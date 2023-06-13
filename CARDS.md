# CARDS

Cards feitos e utilizados para organizar o processo de desenvolvimento do projeto.

- **Card 1**: Configuração inicial do projeto 
    - Criar projeto (rails CLI).
    - Adicionar dependências do projeto: Devise, Bootstrap, listen (auto reload em dev).
    - Criar repositório git e linkar projeto com repositório.
    - Criar banco de dados e entidades do projeto (user, post, comments, votes).
        - User: name, age, email, password (Devise)
        - Post: title, body, category, up_votes, down_votes, user.
        - Comment: body, replying_to_user, replying_to_comment, post, user.
        - Vote: user, post, operation.
    - Inicío de views, controllers e models usando Scaffolding.

- **Card 3**: Funcionalidade de CRUD para users
    - Criar Sessions e Registrations actions com Devise.
    - Gerar Views do próprio Devise para serem alteradas.
    - Alterar View Registration para o usuário se registrar.
    - Alterar View Session para o usuário se logar.
    - Usuários podem criar uma conta ou logar-se em uma conta.

- **Card 4**: Funcionalidade de CRUD para posts
    - Criar Model, Controller e Views para Posts usando Scaffolding (Todas as Views).
    - Estilizar views para Posts.
    - Gerar middleware de autenticação (usando Devise) para as ações 'index', 'new', 'create', 'show', 'edit', 'update' e 'delete'. Somente usuários autenticados podem acessar essas ações.
    - Criar métodos para Votar em um Post, seja um Like ou Dislike. Cada usuário pode votar uma única vez em um Post, podendo alternar o tipo de voto.

- **Card 5**: Funcionalidade de CRUD para comentários
    - Criar Model, Controller e Views para Posts usando Scaffolding (Somente *'show' e 'edit').
        - *show não será uma view própria, mas sim uma parte de uma view dentro de Posts.show.
    - Estilizar views para comments.
    - Gerar middleware de autenticação (usando Devise) para as ações create, edit, update, destroy. As demais ações não serão criadas.
    - Comentários não possuem sistemas de votos (possível melhoria no sistema).

- **Card 6**: Testes
    - Testes de ações para usuário: registrar e logar-se
    - Testes de autenticação.
    - Testes de ações para posts: criar, editar, visualizar e deletar um post.
    - Testes de ações para comentários: criar, editar, visualizar e deletar um comentário.

- **Card 7**: Entregas
    - Início do projeto em 08/06
    - 08/06: 
        - Card 1
    - 09/06: 
        - Card 2
        - Card 3
    - 12/06:
        - Card 4
        - Card 5
    - 13/06:
        - Card 6
        - Card 7
    - Finalização do projeto em 13/06
    