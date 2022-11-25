
# Challenge Project

Desafio que consiste em analisar nossos conhecimentos das ultimas semanas.







## Features

- Autenticação(Firebase)
- Consumo de API
- Detalhes de cada evento consumido
- persistir no Shared Preference cada evento
- listar cada evento persistido
- verificar qual tipo de conexão está ativa


## Login

Dados do Firebase para testar o app:

login: teste51@teste.com
senha: 123456

Possuí tratamento de erros ao logar porém não possuí mascará os campos.

É verificado se o usuário já está logado ou não mesmo reiniciando o app.





## Consumo API

Ao logar será levado para tela onde será exibido os eventos, podendo salva-los no armazenamento local e também olhar os detalhes de cada evento.


Nessa tela também na AppBar é possível ver qual conexão está ativa no momento e caso seja modificada, será mostrada uma Snack Bar customizada informando.
## Eventos Favoritos

Logo na segunda tab é mostrado a lista de eventos que foram salvos, podendo também olhar os detalhes de cada evento.


## Arquitetura

Foi usada arquitetura MVC no projeto.
