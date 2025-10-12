require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  # パスワード設定時に自動でハッシュ化
  def password=(new_pass)
    self.pass = Password.create(new_pass)
  end

  # ハッシュ化されたパスワードを比較用に取得
  def password
    Password.new(self.pass)
  end
end

