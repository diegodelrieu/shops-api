class Api::V1::EventsController < Api::V1::BaseController
  respond_to :json
  #skip_before_action :authenticate_customer!
  skip_after_action :verify_authorized


  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def event_params
    params.require(:event).permit(:timestamp, :description, :page, :customer_id, :shop_id, :item_id)
  end
end
