class Admin::SessionsController < ApplicationController
  def new
    @errors = []
  end

  def create
    @errors = []
    user    = User.find_by_email(params[:email])

    if user && user.admin? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice]    = t('users.auth_yes')

      redirect_to root_path
    else
      @errors << t('users.auth_no')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice]    = t('users.bye')

    redirect_to root_path
  end
end
