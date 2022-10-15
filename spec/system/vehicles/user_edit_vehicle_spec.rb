require 'rails_helper'

describe 'Usuário edita um veículo' do
  it 'a partir da página de detalhes' do
    #Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')

    #Act
    login_as user
    visit root_path
    click_on 'Veículos'
    click_on 'ASD3434'
    click_on 'Editar'
    #Assert
    expect(page).to have_content 'Editar veículo'
    expect(page).to have_field 'Placa:', with: 'ASD3434'
    expect(page).to have_field 'Fabricante:', with: 'Honda'
    expect(page).to have_field 'Modelo:', with: 'CG'
    expect(page).to have_field 'Ano de fabricação:', with: '2020'
    expect(page).to have_field 'Capacidade de carga:', with: '10000'
  end

  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    #Act
    login_as user
    visit root_path
    click_on 'Veículo'
    click_on 'ASD3434'
    click_on 'Editar'
    fill_in 'Modelo:', with: 'Fiorino'
    fill_in 'Fabricante:', with: 'Fiat'
    fill_in 'Capacidade de carga', with: '100000'
    click_on 'Salvar'
    #Assert
    expect(page).to have_content 'Fiat Fiorino - ASD3434'
    expect(page).to have_content 'Capacidade de carga: 1000kg'
  end

  it 'e mantém os campos obrigatórios' do
    #Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    #Act
    login_as user
    visit root_path
    click_on 'Veículos'
    click_on 'ASD3434'
    click_on 'Editar'
    fill_in 'Fabricante:', with: ''
    fill_in 'Modelo', with: ''
    fill_in 'Capacidade de carga', with: ''
    click_on 'Salvar'
    #Assert
    expect(page).to have_content 'Não foi possível atualizar o veículo.'
  end
end