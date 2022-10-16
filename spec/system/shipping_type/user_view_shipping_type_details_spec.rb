require 'rails_helper'

describe 'Usuário vê detalhes de uma modalidade de transporte' do
  it 'e vê informações adicionais' do
    # Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.new(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    shipping_type.save()

    # Act
    login_as user
    visit work_orders_path
    click_on 'Modalidades de Transporte'
    click_on 'Motoboy'

    # Assert
    expect(page).to have_content 'Motoboy' 
    expect(page).to have_content 'Distância mínima: 1km'
    expect(page).to have_content 'Distância máxima: 30km'
    expect(page).to have_content 'Peso mínimo: 10kg'
    expect(page).to have_content 'Peso máximo: 200kg'
    expect(page).to have_content 'Taxa: R$ 5,00'    
  end

  it 'e volta para a tela inicial' do
    # Arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)

    # Act
    login_as user
    visit work_orders_path
    click_on 'Modalidades de Transporte'
    click_on 'Motoboy'
    click_on 'Ordens de Serviço'

    # Assert
    expect(current_path).to eq work_orders_path
  end
end

