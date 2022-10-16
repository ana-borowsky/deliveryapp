require 'rails_helper'

describe 'Usuário vê detalhes de um veículo' do
  it 'e vê informações adicionais' do
    # Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    vehicle = Vehicle.new(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    vehicle.save()

    # Act
    login_as user
    visit work_orders_path
    click_on 'Veículos'
    click_on 'ASD3434'

    # Assert
    expect(page).to have_content 'Honda CG - ASD3434' 
    expect(page).to have_content 'Ano de fabricação: 2020'
    expect(page).to have_content 'Capacidade de carga: 100kg'
    expect(page).to have_content 'Em manutenção:'
    expect(page).to have_content 'Disponível:'
  end

  it 'e volta para a tela inicial' do
    # Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    # Act
    login_as user
    visit work_orders_path
    click_on 'Veículos'
    click_on 'ASD3434'
    click_on 'Ordens de Serviço'

    # Assert
    expect(current_path).to eq work_orders_path
  end
end















