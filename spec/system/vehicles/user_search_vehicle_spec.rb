require 'rails_helper'
describe 'Usuario busca por um veículo' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit root_path
    click_on 'Veículos'
    #assert
    expect(page).to have_field('Buscar veículo')
    expect(page).to have_button('Buscar')
  end

  it 'e deve estar autenticado' do
    #arrange
    #act
    visit root_path
    click_on 'Veículos'
    fill_in 'Buscar veículo', with: 'ASD3434'
    click_on 'Buscar'

    #assert
    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end

  it 'e encontra um veículo' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    #act
    login_as(user)
    visit root_path
    click_on 'Veículos'
    fill_in 'Buscar veículo', with: 'ASD3434'
    click_on 'Buscar'
    #assert
    expect(page).to have_content "Resultado da busca por: ASD3434"
    expect(page).to have_content "Fabricante: Honda"
    expect(page).to have_content "Modelo: CG"
    expect(page).to have_content "Capacidade de carga: 10000g"
    expect(page).to have_button('Buscar')
  end
end