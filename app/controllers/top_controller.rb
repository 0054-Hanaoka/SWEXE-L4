class TopController < ApplicationController
    def main
        if session[:login_uid] != nil
            render "main"
            
        else
            render "login"
        end
    end
    
    def login
      user = User.find_by(uid: params[:uid])
      
      if user && BCrypt::Password.new(user.pass) == params[:pass]
        # 認証成功
        session[:login_uid] = user.uid
        redirect_to action: :main
      else
        # 認証失敗
        render "error", status: 422
      end
    end




    
    def logout
      session.delete(:login_uid)
      redirect_to action: :main
    end

end
