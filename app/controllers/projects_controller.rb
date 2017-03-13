class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  #before_action :require_user, except: [:index, :show]
  #before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @projects = Project.paginate(page: params[:page], per_page: 5) # for pagination
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    #@article.user = current_user
    if @project.save
      flash[:success] = "Project was successfully created"
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    if @project.project(project_params)
      flash[:success] = "Performance Engagement was successfully updated!"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end
  
  def destroy
    @project.destroy
    flash[:danger] = "Engagement was successfully deleted..."
    redirect_to projects_path
  end
  
  
  private
  def set_project
    @project = Project.find(params[:id])
  end
  
  def project_params
    params.require(:project).permit(:title, :portfolio, :pm, :arch, :dev, :sap, :contact, :description, :created_at, :updated_at)
  end
  
  # def require_same_user
  #   if current_user != @project.user and !current_user.admin?
  #     flash[:danger] = "You can only edit or delete your own articles"
  #     redirect_to root_path
  #   end
  # end
  
end
