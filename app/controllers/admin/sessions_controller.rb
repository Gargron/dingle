class Admin::SessionsController < ApplicationController
  def new
    @errors = []
  end

  def create
    @errors = []
    user    = User.find_by_email(params[:email])

    if user && user.admin? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_suggestions_path, :notice => t('users.auth_yes')
    else
      @errors << t('users.auth_no')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => t('users.bye')
  end
end
