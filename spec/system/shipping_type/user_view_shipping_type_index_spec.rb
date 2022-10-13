require 'rails_helper'

describe 'Usuário vê a página de modalidades de transporte' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    #assert
    expect(current_path).to eq shipping_types_path 
  end

  it 'e vê as modalidades de transporte cadastradas' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type_a = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    shipping_type_b = ShippingType.create!(name: 'Padrão', minimum_distance: 10, maximum_distance: 300, minimum_weight:5000, maximum_weight:50000, fee:1000)
    #act
    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    #assert
    expect(page).not_to have_content 'Não existem modalidades de serviço cadastradas.'
    expect(page).to have_content shipping_type_a.name
    expect(page).to have_content 'Distância mínima: 1km'
    expect(page).to have_content 'Distância máxima: 30km'
    expect(page).to have_content 'Peso mínimo: 1000'
    expect(page).to have_content 'Peso máximo: 20000'
    expect(page).to have_content 'Taxa: 500'    

    expect(page).to have_content shipping_type_a.name
    expect(page).to have_content 'Distância mínima: 10km'
    expect(page).to have_content 'Distância máxima: 300km'
    expect(page).to have_content 'Peso mínimo: 5000'
    expect(page).to have_content 'Peso máximo: 50000'
    expect(page).to have_content 'Taxa: 1000'   
  end

  it 'e verifica que não há galpões cadastrados no momento' do
    # Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    # Act
    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
  
    # Assert
    expect(page).to have_content('Não existem modalidades de serviço cadastradas.')
  end
end


