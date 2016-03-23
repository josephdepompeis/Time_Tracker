class SessionsController < ApplicationController

  def new
  end

  def login
    if !session[:developer_id]
      developer = Developer.find_by_email(params[:email])
      if developer && developer.authenticate(params[:password])
        session[:developer_id] = developer.id
        redirect_to developers_path
      else
        render "login"
      end
    else
      redirect_to sessions_login_path
    end

  end

  def logout
    session[:developer_id] = nil
    redirect_to sessions_login_path
  end
  
end
