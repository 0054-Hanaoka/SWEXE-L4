class TopController < ApplicationController
  def main
    if session[:login_uid]
      render "main"
    else
      render "login"
    end
  end

  def login
    # DBから該当ユーザーを検索
    user = User.find_by(uid: params[:uid])

    if user != nil and BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = params[:pass]
      redirect_to top_main_path
    else
      render "error", status: 422
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
end

