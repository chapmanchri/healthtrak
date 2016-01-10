class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :show, :destroy]


  def calendar_month
    @events = Event.where(:user_id => current_user.id)
  end

  def list
    @user = User.find_by_id(1)
    @events = @user.events.all
  end

  def list_by_name
    # @pin = Pin.find_by_slug(params[:slug])
    @user = User.find_by_id(session[:user_id])
    puts "#{@user.id} x" * 100
    # @user = User.find_by_id(1)
    @events = @user.events.all
    render :list_by_name
    # @pin = Pin.find_by_slug(params[:slug])
    # render :show
  end

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    #going to have to find the user here
    #this means create the login and the session
    @user = User.find(@event.user_id)
  end

  # GET /events/new
  def new
    @user = User.find_by_id(session[:user_id])
    puts "in new event" * 100
    @event = Event.new
    @event.user_id = session[:user_id]
    puts " #{@event.user_id}" * 25
  end

  # GET /events/1/edit
  def edit
    @user = User.find_by_id(session[:user_id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to list_by_name_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event, :eventdate, :notes, :user_id)
    end

    def correct_user
      @user = User.find(Event.find(params[:id]).user_id)
      redirect_to(root_url) unless current_user?(@user)
      # redirect_to(root_url) unless @user == current_user
    end
end
