class DevelopersController < ApplicationController
  before_action :set_developer, only: [:edit, :update, :show, :destroy]

  def index
    @developers = Developer.all
  end

  def edit
  end

  def update
    if @developer.update(developer_params)
            redirect_to @developer
    else
      render :edit
    end
  end

  def show
  end



  def new
    @developer = Developer.new
  end


  def create
      @developer = Developer.new(developer_params)
      if @developer.save
          redirect_to @developer
      else
        render :new
      end
  end



  def destroy
    @developer.destroy

    if @developer.destroy
     redirect_to developers_path
    else
     redirect_to developers_path
    end
  end


  private
    def set_developer
      @developer = Developer.find(params[:id])
    end

    def developer_params
      params.require(:developer).permit(:first, :last, :email, :password)
    end



#
#
# Anyone can list/create/edit/delete developers.


end