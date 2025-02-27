class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.valid_password?(params[:password])
      login(@user.email, params[:password])
      redirect_to dashboard_path, notice: 'ログインしました！'
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが間違っています'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, notice: 'ログアウトしました'
  end
end
