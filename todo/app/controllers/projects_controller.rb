class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]



  def index
    @projects = Project.all
  end


  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
     redirect_to projects_path
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
      if @project.save
        redirect_to @project
      else
        render :new
      end
  end

  def show
  end




  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:max_time_spent, :description)
  end




end
