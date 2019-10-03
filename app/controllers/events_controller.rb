class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy, :apply, :cancel_apply, :add_like, :dislike, :participants]
  before_action :check_login, only: [:new, :create, :update, :destroy, :apply, :cancel_apply, :add_like, :dislike]
  
  def index
    @events = Event.all.search(params[:search])
  end

  def new
    @event = Event.new(min_attend: 1, event_status: 'posted')
  end
  def create
    @event = Event.new(event_params)

    if @event.save
      EventLog.create(event: @event, user: current_user, role: 'owner')
      redirect_to events_path, notice: "活動建立成功"
    else
      flash.now[:notice] = "輸入的資訊有問題喔，請再次確認"
      render :new
    end
  end

  def show
  end

  def edit
    authorize @event
  end

  def update
    if @event.update(event_params)
      redirect_to event_path, notice: "活動更新成功"
    else
      render :edit
    end
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to events_path, notice: "活動刪除成功"
  end

  def participants
    @users = @event.applied_participants
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

  def cancel_apply
    authorize @event
    if current_user.applied?(@event)
      EventLog.find_by(event: @event, user: current_user).destroy
      flash.now[:notice] = "已取消報名"
      render :show
    else
      flash.now[:notice] = "你沒有報名這個活動喔"
      render :show
    end
  end

  def list
    @events = Event.all.order(created_at: :desc)
  end

  def add_like
    if current_user.liked?(@event)
      redirect_to list_events_path, notice: "已在收藏清單中囉"
    else
      current_user.likes.create(user: current_user, event: @event)
      redirect_to list_events_path, notice: "加入收藏"
    end
  end

  def dislike
    current_user.likes.find_by(event: @event).destroy
    redirect_to my_like_path, notice: "刪除收藏"
  end

  def food
    find_event_type('美食')
  end

  def art
    find_event_type('藝文')
  end

  def entertainment
    find_event_type('娛樂')
  end

  def learn
    find_event_type('學習')
  end

  def sport
    find_event_type('運動')
  end

  def find_event_type(type)
    @events = Event.where(event_type: type)
  end

  def latest
    @events = Event.order(created_at: :desc)
    # render json: @events
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event)
    .permit(:event_name, :event_type, :apply_start, :apply_end, :fee,
            :max_attend, :min_attend, :event_start, :event_end, :event_status, :location, :image, :description)
  end

  def check_login
    redirect_to new_user_session_path, notice: '請先登入會員' unless user_signed_in?
  end
end
