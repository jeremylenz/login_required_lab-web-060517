class SessionsController < ApplicationController

  def new
    @session = Session.new
  end

  def create
    if params[:name] == ""
      redirect_to '/sessions/new'
      return nil
    end
    if params[:name]
      @session = Session.new({name: params[:name]})
      session[:name] = params[:name]
      @session.save
      redirect_to '/secrets/1'
    else
      redirect_to '/sessions/new'
    end
  end

  def show
  end

  def destroy
    if session[:name]
      session.destroy
    end
    redirect_to '/'
  end



end
