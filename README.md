# Projeto FitLab - App Rails

Este é um projeto desenvolvido como parte de um processo seletivo para a posição de desenvolvedor backend dentro da FitLab. O objetivo deste projeto é criar um aplicativo web que permite aos usuários postar conteúdos e comentar neles. O projeto foi desenvolvido utilizando o framework Ruby on Rails e Bootstrap.

## Tecnologias Utilizadas

O projeto utiliza as seguintes tecnologias:

- **Ruby**: Versão 3.0.2.

- **Ruby on Rails**: Versão 6.1.5.

- **Banco de Dados**: O projeto utiliza o banco de dados SQLite.

- **Bootstrap**: Versão 5.3.0 do Bootstrap CSS para o desenvolvimento front-end.


## Configuração do Ambiente de Desenvolvimento

Para configurar o ambiente de desenvolvimento e executar o projeto localmente, siga estas etapas:

1. Certifique-se de ter o Ruby, Ruby on Rails, Node.js e Yarn (ou NPM) instalados em sua máquina. 

2. Clone o repositório do projeto:
   ```
   git clone https://github.com/azevedev/fitlab-test-app
   ```

3. Acesse o diretório do projeto e instale as dependências:
   ```
   cd fitlab-test-app && gem install
   ```

4. Instale as dependências JavaScript usando o Yarn (ou NPM):
   ```
   yarn install
   ```

5. Crie o banco de dados e execute as migrações:
   ```
   rails db:create db:migrate
   ```

6. Inicie o servidor local:
    ```
    rails server
    ```

7. Abra seu navegador e acesse http://localhost:3000 para visualizar o aplicativo.

Pronto! Tudo certo.


## Possíveis Melhorias

Aqui estão algumas possíveis melhorias que podem ser implementadas no projeto:

### Melhores formas de interações do App por meio de endpoints de API

1. **Utilizar algum Service**: Seria ideal utilizar algum serviço específico para genrenciar interações dinâmicas dentro do app (como dar like ou dislike em um post).

2. **Implementar paginação**: Se o número de posts e comentários crescer significativamente, a página ficaria com uma navegação lenta. Implementar uma paginação nos endpoints que retornam os dados seria o ideal para resolver esse problema. Além de ajudar a reduzir a carga do servidor, também melhora a velocidade de resposta dos dados e a navegação dos usuários.

3. **Upvotes/DownVotes**: Não há Likes/Dislikes (up_votes e down_votes) para Comentários. Seria uma boa forma de indicar o quão bem um comentário é avaliado em uma postagem.

### Melhoria na Cobertura de Testes

1. **Testes não implementados**: Não foram implementados testes de cobertura ou testes de desempenho. A aplicação inteira foi testada manualmente enquanto era desenvolvida e alguns testes de base foram feitos, como autenticação e CRUDS. Implementar os demais testes iria garantir que o código está funcionando como deveria.


Essas são apenas algumas sugestões de melhorias que podem ser implementadas no projeto. Lembre-se de priorizar as melhorias com base nas necessidades do aplicativo e nos requisitos do processo seletivo.

Agradeço a oportunidade de participar desse processo seletivo, caso tenha alguma dúvida por favor basta entrar em contato através do meu e-mail ou telefone.

##
