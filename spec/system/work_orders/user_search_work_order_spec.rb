require 'rails_helper'
describe 'Usuario busca por uma ordem de serviço' do
  it 'a partir do menu' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit root_path
    #assert
    within('header nav') do
      expect(page).to have_field('Buscar ordem de serviço')
      expect(page).to have_button('Buscar')
    end
  end
  it 'e deve estar autenticado' do
    #arrange
    #act
    visit root_path
    fill_in 'Buscar ordem de serviço', with: 'RGJB7YUEJXH263R'
    click_on 'Buscar'

    #assert
    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  
  end

  it 'e encontra uma ordem de serviço' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    #act
    login_as(user)
    visit root_path
    fill_in 'Buscar ordem de serviço', with: work_order.code
    click_on 'Buscar'
    #assert
    expect(page).to have_content "Resultado da busca por: #{work_order.code}"
    expect(page).to have_content "Código: #{work_order.code}"
    expect(page).to have_content "Endereço de saída: Rua das Laranjeiras, 2000"
    expect(page).to have_content "Endereço de entrega: Avenida dos Cáctos, 3000"
    expect(page).to have_content "Código do produto: GHFJ123450"
    expect(page).to have_content "Distância: 100km"
    expect(page).to have_content "Peso do produto: 10000g"
    expect(page).to have_button('Buscar')
  end
end