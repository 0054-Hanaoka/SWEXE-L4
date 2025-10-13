class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    p = BCrypt::Password.create(params[:user][:pass])
    u = User.new(uid: params[:user][:uid], pass: p)
    u.save
    redirect_to users_path
  end
end

