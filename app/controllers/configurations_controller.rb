class ConfigurationsController < ApplicationController
  skip_before_action :allow_admin_only, only: [:index]

  def index
  end
end