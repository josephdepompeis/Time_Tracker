class EntriesController < ApplicationController
  before_action :set_entry, only: [:edit, :update, :show, :destroy]
  before_action :logged_in?

def index
  @entries = Entry.all
  @entries = Entry.where(developer_id: session["developer_id"])

end


  def new
    @entry = Entry.new
        @dev_id = session[:developer_id]
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry
    else
      render :new
    end
  end

  def edit
    @dev_id = session[:developer_id]
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry
    else
      render :edit
    end
  end


  def show
  end

  def destroy
    @entry.destroy
    redirect_to entries_path
  end


private
  def set_entry
    @entry = Entry.find(params[:id])
    redirect_to developers_path unless @entry != nil && @entry.developer_id == session[:developer_id]

  end

  def entry_params
    params.require(:entry).permit(:developer_id, :date, :duration, :project_id)
  end

end
