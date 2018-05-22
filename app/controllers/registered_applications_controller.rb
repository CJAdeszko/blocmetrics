class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @apps = RegisteredApplication.all
  end


  def new
    @app = RegisteredApplication.new
  end


  def create
    @app = RegisteredApplication.new(app_params)
    @app.user = current_user

    if @app.save
      flash[:notice] = "Successfully registered your #{@app.name}."
      redirect_to [@app]
    else
      flash.now[:alert] = "There was a problem registering your app. Please try again."
      render :new
    end
  end


  def show
    @app = RegisteredApplication.find(params[:id])
  end

  def edit
    @app = RegisteredApplication.find(params[:id])
  end


  def update
    @app = RegisteredApplication.find(params[:id])
    @app.assign_attributes(app_params)

    if @app.save
      flash[:notice] = "Successfully updated #{@app.name}."
      redirect_to [@app]
    else
      flash.now[:alert] = "There was a problem updating #{@app.name}. Please try again."
      render :edit
    end
  end


  def destroy
    @app = RegisteredApplication.find(params[:id])

    if @app.destroy
      flash[:notice] = "#{@app.name} was deleted successfully."
      render :index
    else
      flash.now[:alert] = "There was a problem deleting #{@app.name}. Please try again."
      render :index
    end
  end


  private

  def app_params
    params.require(:registered_application).permit(:name, :url)
  end
end
