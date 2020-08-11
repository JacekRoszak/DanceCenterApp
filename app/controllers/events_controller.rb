class EventsController < ApplicationController
  load_and_authorize_resource

  def index
    @events = Event.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      @post = Post.create!(post_content: "Zaplanowano nową imprezę! - #{@event.event_name}") # Post systemowy informujący o stworzeniu nowej imprezy
      redirect_to @event
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit 
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Usunięto.' 
  end

  private
    def event_params
      params.require(:event).permit(:event_name, :start_date, :schedule, :limit, :adress, :start_time, :end_date, :end_time, :description)
    end
end
