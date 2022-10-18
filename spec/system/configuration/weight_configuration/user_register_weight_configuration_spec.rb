require 'rails_helper'

describe 'Usuário cadastra uma nova configuração de preço por peso' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit work_orders_path
    click_on 'Configurações'
    click_on 'Configurações de preço por peso'
    click_on 'Adicionar nova configuração'

    #assert
    expect(page).to have_content 'Peso mínimo:'
    expect(page).to have_content 'Peso máximo:'
    expect(page).to have_content 'Preço:'  
  end

  it 'com sucesso' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    #act
    login_as user
    visit work_orders_path
    click_on 'Configurações'
    click_on 'Configurações de preço por peso'
    click_on 'Adicionar nova configuração'
    fill_in 'Peso mínimo:', with: '1000'
    fill_in 'Peso máximo', with: '10000'
    fill_in 'Preço', with: '3000'
    select 'Motoboy', from: 'Modalidade de transporte'
    click_on 'Salvar'

    #assert
    expect(current_path).to eq weight_configurations_path
    expect(page).to have_content 'Tabela de preço por peso'  
  end
end

