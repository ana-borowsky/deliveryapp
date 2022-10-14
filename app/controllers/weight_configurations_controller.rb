class WeightConfigurationsController < ApplicationController
  before_action :set_weight_configuration, only:[:show]

  def index 
    @weight_configurations = WeightConfiguration.all
  end

  def new
    @weight_configuration = WeightConfiguration.new
  end

  def create
    @weight_configuration = WeightConfiguration.new(weight_configuration_params)
    if @weight_configuration.save()
      redirect_to weight_configurations_path, notice: 'Configuração cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Configuração NÃO cadastrada!'      
      render 'new'
    end
  end

  private 

  def weight_configuration_params
    params.require(:weight_configuration).permit(:name, :minimum_weight, :maximum_weight, :price)
  end
  
  def set_weight_configuration
    @weight_configuration = WeightConfiguration.find(params[:id])
  end
end