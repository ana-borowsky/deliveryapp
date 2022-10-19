class SearchWorkOrderController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :allow_admin_only
  
  def index
  end

end