class InvitationsController < Devise::InvitationsController

  def new
    @users = User.all
    super
  end

  def edit
    @users = User.all
    super
  end

  def update
    @users = User.all
    super
  end

end