class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy, :apply, :cancel]
  before_action :check_login, only: [:new, :create, :update, :destroy]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new(min_attend: 1, event_status: 'posted')
  end
  def create
    @event = Event.new(event_params)

    if @event.save
      EventLog.create(event_id: @event.id, user_id: current_user.id, role: 'owner')
      redirect_to events_path, notice: "活動建立成功"
    else
      render :new
    end
  end

  def show
   
  end

  def edit
    
  end

  def update
    if @event.update(event_params)
      redirect_to event_path, notice: "活動更新成功"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "活動刪除成功"
  end

  def apply
    @event.users.where()
  end

  def cancel
    
  end

  def list
    @events = Event.all
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end
  def event_params
    params.require(:event)
    .permit(:event_pic, :event_name, :event_type, :apply_start, :apply_end, :fee,
            :max_attend, :min_attend, :event_start, :event_end, :event_status, :location, :image)
  end
  private
  def check_login
    redirect_to new_user_session_path, notice: '請先登入會員' unless user_signed_in?
  end
end
