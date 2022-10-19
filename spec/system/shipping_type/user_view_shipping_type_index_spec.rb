require 'rails_helper'

describe 'Usuário vê a página de modalidades de transporte' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Modalidades de Transporte'
    #assert
    expect(current_path).to eq shipping_types_path 
  end

  it 'e vê as modalidades de transporte cadastradas' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    shipping_type_a = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    shipping_type_b = ShippingType.create!(name: 'Padrão', minimum_distance: 10, maximum_distance: 300, minimum_weight:5000, maximum_weight:50000, fee:1000)
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Modalidades de Transporte'
    #assert
    expect(page).not_to have_content 'Não existem modalidades de serviço cadastradas.'
    expect(page).to have_content shipping_type_a.name
    expect(page).to have_content 'Distância mínima: 1km'
    expect(page).to have_content 'Distância máxima: 30km'
    expect(page).to have_content 'Peso mínimo: 10kg'
    expect(page).to have_content 'Peso máximo: 200kg'
    expect(page).to have_content 'Taxa: R$ 5,00'    

    expect(page).to have_content shipping_type_a.name
    expect(page).to have_content 'Distância mínima: 10km'
    expect(page).to have_content 'Distância máxima: 300km'
    expect(page).to have_content 'Peso mínimo: 50kg'
    expect(page).to have_content 'Peso máximo: 500kg'
    expect(page).to have_content 'Taxa: R$ 10,00'   
  end

  it 'e verifica que não há modalidades de transporte cadastradas no momento' do
    # Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    # Act
    login_as(user)
    visit work_orders_path
    click_on 'Modalidades de Transporte'
  
    # Assert
    expect(page).to have_content('Não existem modalidades de serviço cadastradas.')
  end
end



