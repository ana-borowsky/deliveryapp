require 'rails_helper'

describe 'Usuário edita uma modalidade de serviço' do
  it 'a partir da página de detalhes' do
    #Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)

    #Act
    login_as user
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Motoboy'
    click_on 'Editar'
    #Assert
    expect(page).to have_content 'Editar modalidade de transporte'
    expect(page).to have_field 'Nome', with: 'Motoboy'
    expect(page).to have_field 'Distância mínima', with: '1'
    expect(page).to have_field 'Distância máxima', with: '30'
    expect(page).to have_field 'Peso mínimo', with: '1000'
    expect(page).to have_field 'Peso máximo', with: '20000'
    expect(page).to have_field 'Taxa', with: '500'
  end

  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    #Act
    login_as user
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Motoboy'
    click_on 'Editar'
    fill_in 'Nome:', with: 'Padrão'
    fill_in 'Distância mínima:', with: '5'
    fill_in 'Peso mínimo', with: '10000'
    click_on 'Salvar'
    #Assert
    expect(page).to have_content 'Modalidade de transporte: Padrão'
    expect(page).to have_content 'Distância mínima: 5km'
    expect(page).to have_content 'Peso mínimo: 10000g'
  end

  it 'e mantém os campos obrigatórios' do
    #Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    #Act
    login_as user
    visit root_path
    click_on 'Modalidades de Transporte'
    click_on 'Motoboy'
    click_on 'Editar'
    fill_in 'Nome:', with: ''
    fill_in 'Peso mínimo', with: ''
    fill_in 'Taxa', with: ''
    click_on 'Salvar'
    #Assert
    expect(page).to have_content 'Não foi possível atualizar a modalidade de transporte.'
  end
end