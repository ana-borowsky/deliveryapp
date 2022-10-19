class ShippingTypesController < ApplicationController
  before_action :set_work_order, only:[:show, :edit, :update]
  skip_before_action :allow_admin_only, only: [:index, :show]

  def index
    @shipping_types = ShippingType.all
  end

  def new
    @shipping_type = ShippingType.new
  end

  def create
    @shipping_type = ShippingType.new(shipping_type_params)
    if @shipping_type.save()
      redirect_to shipping_types_path, notice: 'Modalidade de transporte cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Modalidade de transporte NÃO cadastrada!'      
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shipping_type.update(shipping_type_params)
      redirect_to shipping_type_path(@shipping_type.id), notice: 'Modalidade de serviço editada com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível atualizar a modalidade de transporte.'
      render 'edit'
    end
  end

  private

  def shipping_type_params
    params.require(:shipping_type).permit(:name, :minimum_distance, :maximum_distance, :minimum_weight, :maximum_weight, :fee, :active)
  end
  
  def set_work_order
    @shipping_type = ShippingType.find(params[:id])
  end

end