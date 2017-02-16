class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize

  layout 'admin'
  
  private
  def authorize
    # head will send an empty HTTP response and the HTTP code for it will be determined by the first argument you pass. In this case, :unauthorized will send back code '401'
    head :unauthorized unless current_user.is_admin?
  end

end
