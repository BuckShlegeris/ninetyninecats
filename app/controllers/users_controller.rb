class UsersController < ApplicationController
  #
  # def index
  #   @users = User.all
  #
  #   render :index
  # end
  #
  def show
    @user = User.find(params[:id])
    @owned_cats = @user.cats
    @sessions = @user.sessions
    render :show
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login!(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    render :new
  end

end