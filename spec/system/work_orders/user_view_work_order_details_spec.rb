require 'rails_helper'

describe 'Usuário vê detalhes de ordem de serviço' do
  it 'e vê informações adicionais' do
    #arrange
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                    product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    #act
    visit(root_path)
    click_on work_order.code
    #assert
    expect(current_path).to eq work_order_path(work_order.id)
    expect(page).to have_content work_order.code
    expect(page).to have_content 'Rua das Laranjeiras, 2000'
    expect(page).to have_content 'Avenida dos Cáctos, 3000'
    expect(page).to have_content 'GHFJ123450'
    expect(page).to have_content '10000'
    expect(page).to have_content '100'
  end
end