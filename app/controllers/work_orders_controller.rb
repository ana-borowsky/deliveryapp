class WorkOrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search]
  before_action :set_work_order, only:[:show, :edit, :update]

  def index
    @work_orders = WorkOrder.all
  end

  def new
    @work_order = WorkOrder.new
  end

  def create
    @work_order = WorkOrder.new(work_order_params)
    if @work_order.save()
      redirect_to work_orders_path, notice: 'Ordem de serviço cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Ordem de serviço NÃO cadastrada!'      
      render 'new'
    end
  end

  def show
    @available_shipping_types = ShippingType.where("minimum_distance <= ?", @work_order.distance)
                                  .where("maximum_distance >= ?", @work_order.distance)
                                  .where("minimum_weight <= ?", @work_order.product_weight)
                                  .where("maximum_weight >= ?", @work_order.product_weight)
                                  .where(active: true)
  end

  def edit
  end

  def update
    if @work_order.update(work_order_params)
      redirect_to work_order_path(@work_order.id), notice: 'Ordem de serviço editada com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível atualizar a ordem de serviço.'
      render 'edit'
    end
  end

  def search
    @code = params['query']
    @work_orders = WorkOrder.where("code LIKE ?", "%#{@code}%")
  end

  def select_shipping_type
    @work_order = WorkOrder.find(params[:work_order_id])
    @work_order.shipping_type = ShippingType.find(params[:shipping_type_id])
    @work_order.price = @work_order.shipping_type.calculate_price(@work_order.distance, @work_order.product_weight)
    if @work_order.save
      redirect_to work_order_path(@work_order.id), notice: 'Modalidade de transporte adicionada.'
    else
      flash.now[:notice] = 'Não foi possível adicionar a modalidade de transporte.'
    end
  end

  private

  def work_order_params
    params.require(:work_order).permit(:pickup_address, :delivery_address, :product_code, :product_weight, :distance, :status)
  end
  
  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end
end