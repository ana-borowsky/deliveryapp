class WorkOrdersController < ApplicationController
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
      redirect_to root_path, notice: 'Ordem de serviço cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Ordem de serviço NÃO cadastrada!'      
      render 'new'
    end
  end

  def show
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
    @shipping_types = ShippingType.where("code LIKE ?", "%#{@code}%")
  end

  private

  def work_order_params
    params.require(:work_order).permit(:pickup_address, :delivery_address, :product_code, :product_weight, :distance, :status)
  end
  
  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end
end