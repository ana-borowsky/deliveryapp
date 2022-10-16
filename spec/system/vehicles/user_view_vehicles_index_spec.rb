require 'rails_helper'

describe 'Usuário vê a página de veículos' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Veículos'
    #assert
    expect(current_path).to eq vehicles_path 
  end

  it 'e vê os veículos cadastrados' do
      #arrange
      user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
      vehicle_a = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
      vehicle_b = Vehicle.create!(manufacturer: 'Fiat', model: 'Fiorino', year: '2018', load_capacity: 100000, license_plate: 'AQW3456')
      #act
      login_as(user)
      visit work_orders_path
      click_on 'Veículos'
      #assert
      expect(page).not_to have_content 'Não existem veículos cadastrados.'
      expect(page).to have_content "#{vehicle_a.manufacturer} #{vehicle_a.model} #{vehicle_a.license_plate}"
      expect(page).to have_content 'Em manutenção:'
      expect(page).to have_content 'Disponível:'

      expect(page).to have_content "#{vehicle_b.manufacturer} #{vehicle_b.model} #{vehicle_b.license_plate}"
      expect(page).to have_content 'Em manutenção:'
      expect(page).to have_content 'Disponível:'
  end

  it 'e verifica que não há veiculos cadastrados no momento' do
    # Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    # Act
    login_as(user)
    visit work_orders_path
    click_on 'Veículos'
  
    # Assert
    expect(page).to have_content('Não existem veículos cadastrados.')
  end
end



