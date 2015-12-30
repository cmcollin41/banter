class SchoolsController < ApplicationController
  before_action :set_schools

  def index
   
  end

  def show
    @schools = School.all
    @school = School.friendly.find(params[:id])
    @today = @school.conversations.where("created_at >= ?", Time.zone.now.beginning_of_day).order("likes_count DESC, created_at DESC")
    @yesterday = @school.conversations.where("created_at < ? AND created_at >= ?" ,Time.zone.now.beginning_of_day, Time.zone.now.beginning_of_day - 24.hours).order("likes_count DESC, created_at DESC")
    @everything_else = @school.conversations.where("created_at < ?", Time.zone.now.beginning_of_day - 24.hours).order("likes_count DESC, created_at DESC")

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