class SchoolsController < ApplicationController
  before_action :set_schools

  def index
   
  end

  def show
    @schools = School.all
    @school = School.friendly.find(params[:id])
    @conversations = @school.conversations.all.order(likes_count: :desc)
  end


  def new
    @school = School.new
  end

  def create
    @school = School.new school_params
    if @school.save
      redirect_to root_path
    end
  end

  private

  def set_schools
    @schools = School.all
  end

  def school_params
    params.require(:school).permit(:name, :school_id)
  end
end