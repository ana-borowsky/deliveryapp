require 'rails_helper'

describe 'Usuario visita página de detalhes da ordem de serviço' do
  it 'e escolhe uma modalidade de transporte' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)

    #act
    login_as(user)
    visit work_orders_path
    click_on work_order.code
    click_on 'select'
    #assert
    expect(page).to have_content 'Modalidade de transporte adicionada.'
    expect(page).to have_content "Modalidade de transporte: Motoboy - #{work_order.price}"
  end

  it 'e inicia uma ordem de serviço' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')

    #act
    login_as(user)
    visit work_orders_path
    click_on work_order.code
    click_on 'select'
    click_on 'Iniciar ordem de serviço'
    #assert
    expect(page).to have_content 'Ordem de serviço iniciada com sucesso.'
    expect(page).to have_content 'Status: Em transporte'
    expect(page).to have_content 'Veículo: ASD3434'
    expect(page).to have_content "Prazo: #{work_order.date}"
    expect(page).to have_content "Data de início: #{Date.today}"
    expect(page).not_to have_button 'Inicar ordem de serviço'
  end

  it 'e prazo não é atendido por nenhuma modalidade de transporte ' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    #act
    login_as(user)
    visit work_orders_path
    click_on work_order.code
    click_on 'select'
    click_on 'Iniciar ordem de serviço'
    #assert
    expect(page).to have_content 'Prazo não atendido por nenhuma modalidade de transporte. Ordem de serviço não pode ser iniciada.'
    expect(page).to have_button 'Iniciar ordem de serviço'
  end
end