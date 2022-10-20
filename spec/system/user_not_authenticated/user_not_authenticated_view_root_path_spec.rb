require 'rails_helper'

describe 'Usuário não autenticado' do
  it 'visita a tela inicial' do
    #arrange
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    #act
    visit root_path
    #assert
    expect(page).to have_content 'Sistema de Fretes'
    expect(page).to have_field(placeholder:'Insira o código da ordem de serviço')
    expect(page).to have_button 'Buscar'
    expect(page).to have_link 'Log in'
    expect(page).not_to have_content 'Ordens de Serviço'
    expect(page).not_to have_content 'Modalidades de Transporte'
    expect(page).not_to have_content 'Veículos'
    expect(page).not_to have_content 'Configurações'
    expect(page).not_to have_content '@sistemadefrete.com.br'
    expect(page).not_to have_content work_order.code
  end
end



