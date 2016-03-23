class EntriesController < ApplicationController
  before_action :set_entry, only: [:edit, :update, :show, :destroy]

def index
  @entries = Entry.all
end


  def new
    @entry = Entry.new
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
  end

  def entry_params
    params.require(:entry).permit(:developer_id, :date, :duration, :project_id)
  end

end
