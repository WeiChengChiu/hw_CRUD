class EventsController < ApplicationController


  before_action :set_event, :only => [:show, :edit, :update, :destory]

  # GET /events/index
  # GET /events
  def index 
 	@events = Event.page( params[ :page] ).per(10) 
  end
  
  # GET events/show/ :id
  def show
  
    @page_title = @event.name
  end

  # GET event/edit/:id
  def edit

  end

  # POST events/update/:id
  def update

    if @event.update(event_params)

      flash[:notice] = "編輯成功"

      redirect_to :action => :show, :id =>@event
    else
      render :action => :edit #edit.html.erb
    end
  end

  # GET events/destory/:id
  def destory


  	@event.destroy

    flash[:alert] = "刪除成功"

  	redirect_to :action => :index
  end

  # GET events/new
  def new
    @event = Event.new
  end

  # POST events/new
  def create
    @event = Event.new( event_params )
  
    if @event.save

      flash[:notice] = "新增成功"
      

      redirect_to :action => :index 
    else
      render :action => :new # new.html.erb
    end
  end

  private
  
  def set_event
    @event = Event.find( params[:id] )
  end

  def event_params
  	params.require( :event).permit(:name, :description
  		)
  end 
end

