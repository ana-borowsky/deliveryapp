# ShippingBox
ShippingBox é um sistema de gerenciamento de fretes desenvolvido para o curso TreinaDev da CampusCode. O planejamento para o projeto encontra-se em um PDF dentro da pasta "docs". É um sistema completo em Ruby on Rails.

![Captura de tela 2025-01-03 123651](https://github.com/user-attachments/assets/35bd8a37-17f8-4c77-999f-2cd0f22634cf)
![Captura de tela 2025-01-03 123749](https://github.com/user-attachments/assets/08684b1f-1974-49f5-b61f-22d9fcb3c0f0)
![Captura de tela 2025-01-03 123651](https://github.com/user-attachments/assets/17e3ce15-eff8-48ba-a45b-10aa3a5033a0)

## Acesso ao sistema
Usuário padrão:
- Email: ana@sistemadefrete.com.br
- Senha: sistema

Usuário administrador:
- Email: joao@sistemadefrete.com.br
- Senha: sistema

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
rails db:migrate
```

E, por último, rode o seed:
```
rails db:seed
```

## Ferramentas utilizadas
Ruby on Rails, SQLite, HTML, CSS
