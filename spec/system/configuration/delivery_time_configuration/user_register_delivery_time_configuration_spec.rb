require 'rails_helper'

describe 'Usuário cadastra uma nova configuração de prazo' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    #act
    login_as user
    visit work_orders_path
    click_on 'Configurações'
    click_on 'Configurações de prazo'
    click_on 'Adicionar nova configuração'

    #assert
    expect(page).to have_content 'Distância mínima:'
    expect(page).to have_content 'Distância máxima:'
    expect(page).to have_content 'Prazo:'  
    expect(page).to have_content 'Modalidade de transporte:'
  end

  it 'com sucesso' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    #act
    login_as user
    visit work_orders_path
    click_on 'Configurações'
    click_on 'Configurações de prazo'
    click_on 'Adicionar nova configuração'
    fill_in 'Distância mínima:', with: '1'
    fill_in 'Distância máxima:', with: '10'
    select 'Motoboy', from: 'Modalidade de transporte'
    fill_in 'Prazo', with: '1000'
    click_on 'Salvar'

    #assert
    expect(current_path).to eq delivery_time_configurations_path
    expect(page).to have_content 'Tabela de prazos'  

  end
end

