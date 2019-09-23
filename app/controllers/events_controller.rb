class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destory]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
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
      redirect_to events_path, notice: "活動更新成功"
    else
      render :edit
    end
  end

  def destroy
    
  end

  def add_to_list
    
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end
  def event_params
    params.require(:event)
    .permit(:event_pic, :event_name, :event_type, :apply_start, :apply_end, :fee,
            :max_attend, :min_attend, :event_start, :event_end, :event_status, :location)
  end
end
