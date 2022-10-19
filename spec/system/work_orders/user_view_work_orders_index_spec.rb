require 'rails_helper'

describe 'Usuario visita tela inicial' do
  it 'e vê o nome da app' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    #assert
    expect(page).to have_content 'Sistema de Fretes'
  end

  it 'e vê o subtítulo' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    #assert
    expect(page).to have_content 'Ordens de Serviço'
  end

  it 'e encontra o link para as Ordens de Serviço' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Ordens de Serviço'
    #assert
    expect(current_path).to eq work_orders_path
  end

  it 'e vê ordens de serviço cadastradas' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    work_order_a = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 100', delivery_address: 'Avenida dos Cáctos, 300', 
                                    product_code: 'HJUH123450', product_weight: 100, distance: 10)
    work_order_b = WorkOrder.create!(pickup_address: 'Rua das Araucárias, 2000', delivery_address: 'Avenida dos Ipês Amarelos, 20', 
                                    product_code: 'MKJN123423', product_weight: 10000, distance: 500)
    work_order_c = WorkOrder.create!(pickup_address: 'Rua das Cerejeiras, 30', delivery_address: 'Avenida das Hortências, 4000', 
                                    product_code: 'KOIN123467', product_weight: 100000, distance: 100)
    #act
    login_as(user)
    visit work_orders_path
    #assert
    expect(page).to have_link work_order_a.code
    expect(page).to have_content 'Endereço de saída: Rua das Laranjeiras, 100'
    expect(page).to have_content 'Endereço de entrega: Avenida dos Cáctos, 300'
    expect(page).to have_content 'Código do produto: HJUH123450'
    expect(page).to have_content 'Status: Pendente'
    expect(page).to have_link work_order_b.code
    expect(page).to have_content 'Endereço de saída: Rua das Araucárias, 2000'
    expect(page).to have_content 'Endereço de entrega: Avenida dos Ipês Amarelos, 20'
    expect(page).to have_content 'Código do produto: MKJN123423'
    expect(page).to have_link work_order_c.code
    expect(page).to have_content 'Endereço de saída: Rua das Cerejeiras, 30'
    expect(page).to have_content 'Endereço de entrega: Avenida das Hortências, 4000'
    expect(page).to have_content 'Código do produto: KOIN123467'
  end

  it 'e verifica que não há ordens de serviço cadastradas no momento' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    #assert
    expect(page).to have_content 'Não existem ordens de serviço cadastradas.'
  end
end