# RICK AND MORTY API
## @author José Gabriel da S. Carvalho

## Features

O projeto Rick & Morty API possui as seguintes features:

[Clique aqui para ver a demonstração do app](./docs/demo.mp4)

- **Tela inicial (Home):**
    - Listagem dos personagens da série Rick & Morty
    - Paginação da listagem para um scroll infinito pegando de 20 em 20 personagens
    - Drawer lateral com as principais listas de personagens filtrados por gênero e status
    - Barra de pesquisa para pesquisar seus personagens favoritos por nome
    - Debounce na pesquisa de 500ms para não sobrecarregar o server de requests a cada caractere digitado

- **Tela de detalhes do personagem**

    - Card mostrando os detalhes do personagem selecionado (nome, foto, genero e etc.)
    - Botão para adicionar o personagem aos favoritos

- **Tela de personagens favoritos**

    - Listagem dos seus personagens favoritos, caso tenha favoritado algum

## Arquitetura e padrões de projeto

Devido a origem do projeto ser um teste, foi feito um "overengineering" onde para demostrar algumas das minhas habilidades foram utilizados padrões que aumentaram a complexidade do projeto mesmo não havendo necessidade para tal. Esta aplicação foi desenvolvida com uma mesclagem de MVC, conceitos de camadas e arquitetura limpa.

### Gerenciamento de estado

Para o gerenciamento de estado foi utilizado a notificação reativa nativa do Flutter, ``ValueNotifier`` e ``ValueListenableBuilder``, utilizando o ``Provider`` como injetor de dependencias, esta abordagem combina com o tipo de arquitetura na qual utilizei, mantendo os estados acessíveis a partir do controller da página com o padrão Source.

### Pattern Source

Um dos padrões que mais gosto de utilizar, aproveitando muito bem do que o recurso ``part`` e ``part of`` podem oferecer. Ao criar uma tela apenas um "handler" no caso a classe principal é publica, mantendo todos os seus componentes privados, tanto os widgets exclusivos desta tela, como tambem seus controllers e view, deixando unidos como uma biblioteca, mantendo imports e dependecias em apenas um arquivo.
Este padrão ele tem como vantagem o completo isolamento de seus componentes de outras telas (features), tendo apenas uma instancia publica esse pattern garante que não tenha "cross references" entre views e widgets externos, alem de reduzir o numero de referencias disponiveis na listagem da IDE (a view ``Home`` vai ter o ``_HomeController`` e não pode acessar o ``_DetailsController`` por exemplo).

Sua desvantagem é o hard coding de manualmente ter que declarar ``part`` e ``part of`` dos membros da mesma biblioteca, podendo deixar o handler com muitos imports em um unico arquivo.

### Pattern Service

Para o consumo da API foi utilizado o padrão service com injeção de dependencia do ``Dio``, facilitando o desenvolvinento e testes.

### Pattern Repository

Para manter a lista de personagens favoritados foi utilizado o padrao repository.

### Extensões

Foram utilizadas extensões para a navegação e tipografia onde:
- Utilizando o ``go_router``, o ``BuildContext`` foi extendido para ter rotas padrão definidas por natureza.
    ```dart
    context.goToHome();
    context.goToDetails();
    context.goToFavorites();
    ```
    Deste modo posso organizar as rotas em um único arquivo, não tendo que defini-las manualmente toda vez que eu for navegar pelo aplicativo, isso além de ser mais organizado e limpo, garante que uma mudança na rota da extensão vai afetar corretamente todos os widgets que a referencia.

- Para a tipografia foi também criada uma extensão ``kobe``, mantendo toda configuração em uma única extensão.
    ```dart
    Typography().kobe.regular,
    Typography().kobe.black,
    Typography().kobe.medium,
    ```

### Logging

Para o desenvolvimento eu criei um Logger próprio, utilizando o dart:developer, para ao "printar" algo ele sair colorido, com emoji (baseado no tipo de log) com timestamp e o arquivo no qual ele gerou aquele log, esse Logger eu custumo utilizar em meus projetos, para requests, disposes, inits, downloads e etc.
```dart
Logger.success(mensagem);

Logger.error(
    error,
    stackTrace: stackTrace,
);
```

## Pacotes utilizados:

- **go_router**: Utilizado para a navegação de páginas.
- **dio**: Para requisições http.
- **provider**: Para injeções de dependências.
- **intl**: Para manipulação de timestamp.
- **google_fonts**: Para utilizar a fonte ``Lato`` seguindo os requisitos de design.
- **mocktail**: Para testes.