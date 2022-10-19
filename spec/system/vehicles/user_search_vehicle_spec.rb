require 'rails_helper'
describe 'Usuario busca por um veículo' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Veículos'
    #assert
    expect(page).to have_field('Buscar veículo')
    expect(page).to have_button('Buscar')
  end

  it 'e deve estar autenticado' do
    #arrange
    #act
    visit work_orders_path

    #assert
    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end

  it 'e encontra um veículo' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Veículos'
    fill_in 'Buscar veículo', with: 'ASD3434'
    within '#vehicles' do
      click_on 'Buscar'
    end

    #assert
    expect(page).to have_content "Resultado da busca por: ASD3434"
    expect(page).to have_content "Honda CG - ASD3434"
    expect(page).to have_content 'Em manutenção:'
    expect(page).to have_content 'Disponível:'
    expect(page).to have_button('Buscar')
  end
end