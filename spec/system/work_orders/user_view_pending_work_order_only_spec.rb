require 'rails_helper'

describe 'Usuario visita index de ordens de serviço' do
  it 'e vê apenas as com status pendente' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    work_order_a = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    work_order_b = WorkOrder.create!(pickup_address: 'Rua dos Coqueiros, 10', delivery_address: 'Avenida dos Ipês Roxos, 42', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100, status: :delivered)

    #act
    login_as(user)
    visit work_orders_path
    click_on 'Mostrar ordens de serviço pendentes'
    #assert
    expect(current_path).to eq pending_work_orders_path
    expect(page).to have_content work_order_a.code
    expect(page).not_to have_content work_order_b.code
  end

  it 'e verifica que não há ordens de serviço pendentes' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Mostrar ordens de serviço pendentes'
    #assert
    expect(page).to have_content 'Não existem ordens de serviço pendentes no momento.'
  end
end