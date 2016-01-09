class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Healthtraks!"
      redirect_to '/events/user.id'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :patient_name, :acceptance)
    end

  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  # # before_action :require_login, only: [:show, :edit, :update, :destroy]
  #
  # def authenticate
  #   @user = User.authenticate(params[:email], params[:password])
  #   if @user.nil?
  #     @errors = "Either email or password is incorrect"
  #     render :login
  #   else
  #     session[:user_id] = @user.id
  #     redirect_to '/events/session[:user_id]'
  #   end
  # end
  #
  # def login
  #   @errors = ""
  # end
  #
  # def logout
  #   session.delete(:user_id)
  #   redirect_to login_path
  # end
  #
  # def index
  #   @users = User.all
  # end
  #
  # # GET /users/1
  # # GET /users/1.json
  # def show
  #
  # end
  #
  # # GET /users/new
  # def new
  #   @user = User.new
  # end
  #
  # # GET /users/1/edit
  # def edit
  # end
  #
  # # POST /users
  # # POST /users.json
  # def create
  #   @user = User.new(user_params)
  #
  #   respond_to do |format|
  #     if @user.save
  #       puts "in user.save #{current_user.id}" * 100
  #       format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /users/1
  # # DELETE /users/1.json
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_user
  #     @user = User.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def user_params
  #     params.require(:user).permit(:email, :password, :password_confirmation, :patient_name, :acceptance)
  #   end
end
