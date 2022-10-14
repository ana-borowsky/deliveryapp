# README

O planejamento para o projeto encontra-se em um PDF dentro da pasta DOCS.

A cada commit, uma lista das atividades que foram realizadas será descrita neste README.

Commit 'initial': 
- projeto criado, 
- pasta docs adicionada, 
- projeto em pdf adicionado a pasta docs.

Commit 'Added work order':
- instalados rspec e capybara
- criado model work_order (ordem de servico)
- criado work_order controller
- adicionada rota index para work order
- adicionada view index para work order, que também será a root path
- adicionado view new work order

Commit 'Continue working on work orders':
- criada view show de work order
- criada edit view de work order
- adicionadas algumas validações em work order
- adicionado select no status de work order

Commit 'Add devise and I18n':
- devise instalado. Ainda não foi implementada a diferenciação entre user_admin e user.
Inicialmente o projeto está sendo feito como o user_admin irá enxergá-lo.
- implementado I18n

Commit 'Add user authentication and shipping_type':
- criado model shipping_type (modalidade de transporte)
- adicionado bloqueio de usuário não autenticado
- criada view index de modalidades de transporte

Commit 'work on shipping types'
- adicionada view new de modalidades de transporte
- adicionadas validações de modalidades de transporte
- adicionado shipping types em I18n 
- adicionada view show de modalidades de transporte
- adicionada a view edit de modalidades de transporte

Commit 'Add search for work orders, add vehicles'
- Adicionada busca para as ordens de serviço
- adicionada view search para busca das ordens de serviço
- criado model de veículos
- criada view index de veículos
- criada view show de veículos
- criada view edit de veículos
- criada view new de veículos

Commit 'Add missing attributes, work on search for work order and vehicles'
- adicionado status a modalidade de transporte
- adicionado condição a veículo
- adicionado status a veículo
- busca da ordem de serviço consertada
- adicionado template de busca da ordem de servico
- adicionada busca por veículos
- adicionado template de busca por veículos

Commit 'fix bugs and translations'
- adicionadas chek boxes
- arrumados erros na página de busca de veiculos
- arrumados erros em algumas traduções

Commit 'Add configurations and weight configurations'
- criada página index das configurações
- criada configurações de preço por peso
- criada página index e new de configurações de preço por peso

Commit 'Add delivery time configurations'
- criado model de configurações prazo
- criada pagina index de configurações de prazo
- criada página new de configurações de prazo

Próximas tarefas:

adicionar distâncias de atuação dos veiculos?
modificar a aparencia dos preços e pesos para reais e kg
arrumar erros no teste de busca de veículos, e na página de busca
fazer pagina de user nao autenticado
colocar barreira no email
melhorar validacoes de veículo
criar model de preços e prazos
popular o arquivo seeds



