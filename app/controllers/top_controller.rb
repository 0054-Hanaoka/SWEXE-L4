class TopController < ApplicationController
    def main
        if session[:login_uid] != nil
            render "main"
            
        else
            render "login"
        end
    end
    
    def login
    # 1. 入力されたuidでユーザーを検索
        user = User.find_by(uid: params[:uid])
    
        # 2. 見つかった場合はBCryptでパスワード照合
        if user && BCrypt::Password.new(user.pass) == params[:pass]
          session[:login_uid] = user.uid
          redirect_to top_main_path
        else
          render "error", status: 422
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to action: "main"
    end
end
