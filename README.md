# ShippingBox
ShippingBox é um sistema de fretes desenvolvido para o curso TreinaDev da CampusCode. O planejamento para o projeto encontra-se em um PDF dentro da pasta DOCS. É um sistema completo em Ruby on Rails.

## Acesso ao sistema
Usuário padrão:
- email: ana@sistemadefrete.com.br
- senha: sistema

Usuário administrador:
- email: joao@sistemadefrete.com.br
- senha: sistema

## Conteúdo
- Ordens de serviço:
    - listar ordens de serviço
    - mostrar ordem de serviço
    - buscar ordens de serviço
    - listar ordens de servico pendentes
    - editar ordens de serviço (admin)
    - criar ordens de serviço (admin)
    - selecionar modalidades de transporte
    - iniciar ordens de serviço
    - finalizar ordens de serviço

- Modalidades de transporte:
    - listar modalidades de transporte
    - mostrar modalidade de transporte
    - adicionar modalidade de transporte (admin)
    - editar modalidade de transporte (admin)

- Veículos:
    - listar veículos
    - mostrar veículo
    - adicionar veículo (admin)
    - editar veículo (admin)
    - buscar veículo

- Configurações:
    - listar configurações de preço por peso
    - listar configurações de preço por distância percorrida
    - listar configurações de prazo
    - adicionar/deletar configurações de preço por peso (admin)
    - adicionar/deletar configurações de preço por distância percorrida (admin)
    - adicionar/deletar configurações de prazo (admin)

## Ferramentas utilizadas
Ruby on Rails, SQLite

## Como rodar
Primeiramente será necessário instalar Ruby na sua máquina. Este trabalho utiliza a versão 3.1.2. Para controle de versões, recomendo a utilização do [asdf](https://github.com/asdf-vm/asdf-ruby).

Em seguida, clone o repositório com o comando:
```
git clone git@github.com:ana-borowsky/deliveryapp.git
```
Então, efetue o comando para atualizar as dependências do Ruby:
```
bundle
```
Rode as migrations com:
```
railsdb:migrate
```
E, por último, rode o seed:
```
railsdb:seed
```