require 'rails_helper'

describe 'Usuário edita uma ordem de serviço' do
  it 'a partir da página de detalhes' do
    #arrange
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    #act
    visit(root_path)
    click_on work_order.code
    click_on 'Editar'
    #assert
    expect(page).to have_content "Editar ordem de serviço #{work_order.code}"
    expect(page).to have_field 'Endereço de saída:', with: 'Rua das Laranjeiras, 2000'
    expect(page).to have_field 'Endereço de entrega:', with: 'Avenida dos Cáctos, 3000'
    expect(page).to have_field 'Código do produto:', with: 'GHFJ123450'
    expect(page).to have_field 'Peso do produto:', with: '10000'
    expect(page).to have_field 'Distância:', with: '100'
  end

  it 'com sucesso' do
    #arrange
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    #act
    visit root_path
    click_on work_order.code
    click_on 'Editar'
    fill_in 'Endereço de saída:', with: 'Rua dos ipês amarelos, 345'
    fill_in 'Peso do produto:', with: '1230'
    fill_in 'Distância:', with: '10000'
    click_on 'Salvar'
    puts (page.body)

    #assert
    expect(page).to have_content 'Endereço de saída: Rua dos ipês amarelos, 345'
    expect(page).to have_content 'Peso do produto: 123'
    expect(page).to have_content 'Distância: 10000'
    expect(page).to have_content 'Ordem de serviço editada com sucesso!'
  end

  it 'e mantém os campos obrigatórios' do
    #arrange
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    #act
    visit root_path
    click_on work_order.code
    click_on 'Editar'
    fill_in 'Endereço de saída:', with: ''
    fill_in 'Peso do produto:', with: ''
    fill_in 'Distância:', with: ''
    click_on 'Salvar'

    #assert
    expect(page).to have_content 'Não foi possível atualizar a ordem de serviço.'
  end
end
