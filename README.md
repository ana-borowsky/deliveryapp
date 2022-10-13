# README

O planejamento para o projeto encontra-se em um PDF dentro da pasta DOCS.

A cada commit, uma lista das atividades que foram realizadas sera descrita neste README.

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




