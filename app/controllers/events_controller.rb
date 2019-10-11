class EventsController < ApplicationController
  require 'sidekiq/api'

  before_action :find_event, only: [:show, :edit, :update, :destroy, :apply, :add_like, :dislike, :view_participants, :cancel_event, :close_event, :owner]
  before_action :check_login, only: [:new, :create, :update, :destroy, :apply, :add_like, :dislike, :cancel_event]
  
  def index
    render layout: "index"
    # @events = Event.where.not(event_status: 'cancelled').search(params[:search])
    @events = Event.available.order(created_at: :desc).search(params[:search])
  end

  def new
    @event = Event.new(min_attend: 1)
    @disable_footer = true
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      EventLog.create(event: @event, user: current_user, role: 'owner')
      CheckOpenTimeUpJob.perform_at(@event.apply_end, {event_id: @event.id})

      redirect_to events_path, notice: "活動建立成功"
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comment.event_id = @event.id
    @link = request.original_url
  end

  def edit
    authorize @event
  end

  def update
    if @event.update(event_params)
      redirect_to event_path, notice: "活動更新成功"

      Sidekiq::ScheduledSet.new.select {|job| job.klass == 'CheckOpenTimeUpJob' }.each do |job|
        job.delete if job.args == [{ "event_id" => @event.id }]
      end

      CheckOpenTimeUpJob.perform_at(@event.apply_end, {event_id: @event.id})
      # 寄信通知團員有變更(TBD)
    else
      render :edit
    end
  end

  def view_participants
    authorize @event
    @users = @event.applied_participants
  end

  def cancel_event
    authorize @event
    @event.to_cancel!

    Sidekiq::ScheduledSet.new.select {|job| job.klass == 'CheckOpenTimeUpJob' }.each do |job|
      job.delete if job.args == [{ "event_id" => @event.id }]
    end

    redirect_to events_path, notice: "活動已取消"
  end

  def apply
    authorize @event
    if current_user.applied?(@event)
      flash.now[:notice] = "你已經報名過囉"
      render :show
    elsif current_user.raised?(@event)
      flash.now[:notice] = "你是主辦人，無法報名自己的活動"
      render :show
    else
      EventLog.create(event: @event, user: current_user, role: 'member')
      redirect_to event_path, notice: "報名成功"
    end
  end

  def list
    @events = Event.available.order(created_at: :desc)
  end

  def add_like
    current_user.likes.create(user: current_user, event: @event) unless current_user.liked?(@event)
  end

  def dislike
    current_user.likes.find_by(event: @event).destroy if current_user.liked?(@event)
    # redirect_to my_like_path, notice: "刪除收藏"
  end

  def close_event
    authorize @event
    @event.to_success!
    redirect_to my_events_raised_path, notice: "收團！"
  end

  def food
    find_event_type(:food)
  end

  def art
    find_event_type(:art)
  end

  def entertainment
    find_event_type(:entertainment)
  end

  def learn
    find_event_type(:learn)
  end

  def sport
    find_event_type(:sport)
  end

  def find_event_type(type)
    @events = Event.available.where(event_type: type).order(created_at: :desc)
  end

  def latest
    @events = Event.available.order(created_at: :desc)
    # render json: @events
  end

  def owner
    @user = @event.owner
  end

  private

  def find_event
    @event = Event.friendly.find(params[:id])
  end

  def event_params
    params.require(:event)
    .permit(:event_name, :event_type, :apply_end, :fee,
            :min_attend, :event_start, :event_end,:event_status, :location, :image, :description)
  end

  def check_login
    redirect_to new_user_session_path, notice: '請先登入會員' unless user_signed_in?
  end
end
