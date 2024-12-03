# ShippingBox
ShippingBox é um sistema de fretes desenvolvido para o curso TreinaDev da CampusCode. O planejamento para o projeto encontra-se em um PDF dentro da pasta DOCS. É um sistema completo em Ruby on Rails.

## Acesso ao sistema
Usuário Regular:
- nome: Ana
- email: ana@sistemadefrete.com.br
- senha: sistema

Usuário Administrador:
- nome: João
- email: joao@sistemadefrete.com.br
- senha: sistema

## Conteúdo
- CRUD de veículos
- Busca de veículos por placa
- CRUD de modalidades de transporte
- CRUD de ordens de serviço
- Busca por ordens de serviço
- CRUD de configurações de
    - preço por peso
    - preço por distância percorrida
    - prazo
- Modo administrador

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