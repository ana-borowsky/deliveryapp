require 'rails_helper'

describe 'Usuário regular' do
  it 'visita index de ordens de serviço' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit work_orders_path
    #assert
    expect(page).not_to have_content 'Adicionar nova ordem de serviço'
  end

  it 'visita index de modalidades de transporte' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit shipping_types_path
    #assert
    expect(page).not_to have_content 'Adicionar nova modalidade de transporte'
  end

  it 'visita index de veículos' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit vehicles_path
    #assert
    expect(page).not_to have_content 'Adicionar novo veículo'
  end

  it 'visita index de configurações' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit configurations_path
    #assert
    expect(page).to have_content 'Configurações de preço por peso'
    expect(page).to have_content 'Configurações de prazo'
    expect(page).to have_content 'Configurações de preço por distância percorrida'
  end

  it 'visita index de configurações de prazo' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit delivery_time_configurations_path
    #assert
    expect(page).not_to have_content 'Adicionar nova configuração'
    expect(page).not_to have_button 'Remover'
  end

  it 'visita index de configurações de preço por peso' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit weight_configurations_path
    #assert
    expect(page).not_to have_content 'Adicionar nova configuração'
    expect(page).not_to have_button 'Remover'
  end

  it 'visita index de configurações de preço por distância percorrida' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit price_per_distance_configurations_path
    #assert
    expect(page).not_to have_content 'Adicionar nova configuração'
    expect(page).not_to have_button 'Remover'
  end

  it 'visita página para criar novo veículo' do 
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit new_vehicle_path
    #assert
    expect(page).to have_content 'Você não tem permissão de acesso.'
  end

  it 'visita página para editar veículo' do 
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    #act
    login_as user
    visit edit_vehicle_path(vehicle)
    #assert
    expect(page).to have_content 'Você não tem permissão de acesso.'
  end

  it 'visita página para criar nova ordem de serviço' do 
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit new_work_order_path
    #assert
    expect(page).to have_content 'Você não tem permissão de acesso.'
  end

  it 'visita página para editar uma ordem de serviço' do 
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    #act
    login_as user
    visit edit_work_order_path(work_order)
    #assert
    expect(page).to have_content 'Você não tem permissão de acesso.'
  end

  it 'visita página para criar nova modalidade de transporte' do 
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit new_shipping_type_path
    #assert
    expect(page).to have_content 'Você não tem permissão de acesso.'
  end

  it 'visita página para editar modalidade de transporte' do 
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    #act
    login_as user
    visit edit_shipping_type_path(shipping_type)
    #assert
    expect(page).to have_content 'Você não tem permissão de acesso.'
  end

  it 'visita página para criar nova configuração de preço por distância' do 
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit new_price_per_distance_configuration_path
    #assert
    expect(page).to have_content 'Você não tem permissão de acesso.'
  end

  it 'visita página para criar nova configuração de preço por peso' do 
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit new_weight_configuration_path
    #assert
    expect(page).to have_content 'Você não tem permissão de acesso.'
  end

  it 'visita página para criar nova configuração de prazo' do 
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit new_delivery_time_configuration_path
    #assert
    expect(page).to have_content 'Você não tem permissão de acesso.'
  end
end