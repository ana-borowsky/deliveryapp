class VehiclesController < ApplicationController
  before_action :set_vehicle, only:[:show, :edit, :update]

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save()
      redirect_to vehicles_path, notice: 'Veículo cadastrado com sucesso!'
    else
      flash.now[:notice] = 'Veículo NÃO cadastrado!'      
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicle_path(@vehicle.id), notice: 'Veículo editado com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível atualizar o veículo.'
      render 'edit'
    end
  end

  def search
    @code = params['query_vehicle']
    @vehicles = Vehicle.where("license_plate LIKE ?", "%#{@code}%")
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:year, :manufacturer, :model, :load_capacity, :license_plate, :maintenance, :available)
  end
  
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end