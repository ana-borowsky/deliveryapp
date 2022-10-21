# README

Usuário Regular: 
    Nome: Ana
    email: ana@sistemadefrete.com.br
    senha: sistema
Usuário Administrador:
    Nome: João
    email: joao@sistemadefrete.com.br
    senha: sistema

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

Commit 'Add price per distance configutation'
- criado model de configurações de preço por distância
- criada página index de configurações de preço por distância
- criada página new de configurações de preço por distância

Commit 'Add tables for configurations'
- Adicionadas tabelas de todas as configurações
- Ajustadas exibições em reais e kg
- Adicionados botões de deletar nas configurações

Commit 'add email barrier and work orders search'
- adicionada pagina de busca pelo usuário não autenticado
- modificado root path
- consertados todos os testes
- adicionada barreira de email @sistemadefrete.com.br
- arquivo seeds populado

Commit 'Add start to work order'
- adicionada lógica do preço
- adicionada seleção de modalidade de transporte
- adicionada opção de iniciar ordem de serviço

Commit 'Remake seeds'
- Seeds inteiro reescrito

Commit 'Fix bugs'
- bugs resolvidos

Commit 'Add end option to work order'
- Adicionada finalização de ordem de serviço

Commit 'Add index to pending work orders'
- Adicionada opção de ver apenas ordens de serviço pendentes

Commit 'Fix bugs on vehicles'
- Arrumados problemas encontrados nos veículos

Commit 'Add delayed justification to work order'
- Adicionar motivo de atraso, caso seja ordem de serviço seja finalizada com atraso.
- Melhorada página de busca por ordem de serviço por usuário não autenticado

Commit 'Add regular and admin user differentiation'
- Adicionada diferenciação entre usuário regular e administrador

Commit 'Add style'
- Melhora da aparência da app.

Commit 'Continue work on app style'
- Continuação do trabalho na aparência da app.

Commit 'Continue work on design, fix bugs'
- Continuação do trabalho de design.
- Arrumados frases faltando tradução no Devise
- Testes que estavam falhando corrigidos

Commit 'Fix some problems'

Commit 'Add message to search if result is 0'
- Adicionada mensagem na busca: 'Nenhum resultado encontrado.'

Commit 'Continue work on design'

Próximas tarefas:
Revisar testes
Ainda há erros no design
Colocar páginas de configuração junto nas de modalidades de transporte
REVISÃO
