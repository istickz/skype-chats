class AdminController < ApplicationController
  layout 'admin'

  before_filter :authenticate_user!
  before_filter :admin_check

  private
  def admin_check
    unless current_user.admin?
      flash[:warning] = "Доступ запрещен!"
      redirect_to :root
    end
  end




end
