class Schools::CommitmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school

  def index
    @schools = Schools.all
  end

  def create
    @school.commitments.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html {redirect_to @school}
      format.js
    end
  end

  def destroy
    @school.commitments.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html {redirect_to @school}
      format.js
    end
  end

  private

  def set_school
    @school = School.friendly.find(params[:school_id])
  end
end
