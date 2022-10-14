class DeliveryTimeConfigurationsController < ApplicationController
  def index
    @delivery_time_configurations = DeliveryTimeConfiguration.all
  end

  def new
    @delivery_time_configuration = DeliveryTimeConfiguration.new
  end

  def create
    @wdelivery_time_configuration = DeliveryTimeConfiguration.new(delivery_time_configuration_params)
    if @wdelivery_time_configuration.save()
      redirect_to delivery_time_configurations_path, notice: 'Configuração cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Configuração NÃO cadastrada!'      
      render 'new'
    end
  end

  private 

  def delivery_time_configuration_params
    params.require(:delivery_time_configuration).permit(:price, :minimum_distance, :maximum_distance, :shipping_type_id, :delivery_time)
  end

end