class WeightConfigurationsController < ApplicationController
  skip_before_action :allow_admin_only, only: [:index]
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

  def destroy
    @weight_configuration = WeightConfiguration.find(params[:id])
    @weight_configuration.destroy
    redirect_to weight_configurations_path, notice: 'Configuração removida com sucesso!'
  end

  private 

  def weight_configuration_params
    params.require(:weight_configuration).permit(:name, :minimum_weight, :maximum_weight, :price, :shipping_type_id)
  end
end