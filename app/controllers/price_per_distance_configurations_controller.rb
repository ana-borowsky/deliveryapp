class  PricePerDistanceConfigurationsController < ApplicationController
  skip_before_action :allow_admin_only, only: [:index]

  def index
    @price_per_distance_configurations = PricePerDistanceConfiguration.all
  end

  def new
    @price_per_distance_configuration = PricePerDistanceConfiguration.new
  end

  def create
    @price_per_distance_configuration = PricePerDistanceConfiguration.new(price_per_distance_configuration_params)
    if  @price_per_distance_configuration.price_per_distance
      @price_per_distance_configuration.price_per_distance = @price_per_distance_configuration.price_per_distance*100
    end
    if @price_per_distance_configuration.save()
      redirect_to price_per_distance_configurations_path, notice: 'Configuração cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Configuração NÃO cadastrada!'      
      render 'new'
    end
  end

  def destroy
    @price_per_distance_configuration = PricePerDistanceConfiguration.find(params[:id])
    @price_per_distance_configuration.destroy
    redirect_to price_per_distance_configurations_path, notice: 'Configuração removida com sucesso!'
  end

  private

  def price_per_distance_configuration_params
    params.require(:price_per_distance_configuration).permit(:minimum_distance, :maximum_distance, :price_per_distance, :shipping_type_id)
  end

end