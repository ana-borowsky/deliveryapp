class DeliveryTimeConfigurationsController < ApplicationController
  skip_before_action :allow_admin_only, only: [:index]

  def index
    @delivery_time_configurations = DeliveryTimeConfiguration.all
  end

  def new
    @delivery_time_configuration = DeliveryTimeConfiguration.new
  end

  def create
    @delivery_time_configuration = DeliveryTimeConfiguration.new(delivery_time_configuration_params)
    if @delivery_time_configuration.save()
      redirect_to delivery_time_configurations_path, notice: 'Configuração cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Configuração NÃO cadastrada!'      
      render 'new'
    end
  end

  def destroy
    @delivery_time_configuration = DeliveryTimeConfiguration.find(params[:id])
    @delivery_time_configuration.destroy
    redirect_to delivery_time_configurations_path, notice: 'Configuração removida com sucesso!'
  end

  private 

  def delivery_time_configuration_params
    params.require(:delivery_time_configuration).permit(:minimum_distance, :maximum_distance, :shipping_type_id, :delivery_time)
  end

end