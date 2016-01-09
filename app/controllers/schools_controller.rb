# == Schema Information
#
# Table name: schools
#
#  id                :integer          not null, primary key
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  slug              :string
#  school_id         :integer
#  conversation_id   :integer
#  commitments_count :integer          default(0), not null
#  sort              :string
#
# Indexes
#
#  index_schools_on_conversation_id  (conversation_id)
#  index_schools_on_slug             (slug) UNIQUE
#

class SchoolsController < ApplicationController
  before_action :set_schools

  def index
   
  end

  def show
    @schools = School.all
    @school = School.friendly.find(params[:id])

    if params[:sort] == "Past Week"
      @school_conversations = @school.conversations.where("created_at < ? AND created_at >= ?", Time.zone.now, Time.zone.now - 168.hours).order("likes_count DESC, created_at DESC")
    elsif params[:sort] == "Past Month"
      @school_conversations = @school.conversations.where("created_at < ? AND created_at >= ?", Time.zone.now, Time.zone.now - 720.hours).order("likes_count DESC, created_at DESC")
    else
      @school_conversations = @school.conversations.where("created_at >= ?", Time.zone.now - 24.hours).order("likes_count DESC, created_at DESC")
    end

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
    params.require(:school).permit(:name, :school_id, :sort)
  end
end
