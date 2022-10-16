require 'rails_helper'

describe 'Usuário não autenticado busca por uma ordem de serviço' do
  it 'visita a tela inicial' do
    #arrange
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    #act
    visit root_path
    fill_in 'Buscar ordem de serviço', with: work_order.code
    click_on 'Buscar'
    #assert
    expect(page).to have_content "Resultado da busca por: #{work_order.code}"
    expect(page).to have_content 'Endereço de saída: Rua das Laranjeiras, 2000'
    expect(page).to have_content 'Endereço de entrega: Avenida dos Cáctos, 3000'
    expect(page).to have_content 'Código do produto: GHFJ123450'
    expect(page).to have_content 'Peso do produto: 100kg'
    expect(page).to have_content 'Distância: 100km'
    expect(page).to have_content 'Status:'
    expect(page).to have_content 'Data de início:'
    expect(page).to have_content 'Previsão de entrega:'
    expect(page).to have_content 'Veículo'
  end
end
