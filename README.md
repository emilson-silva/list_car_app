# Decisões Técnicas do Projeto

Este documento detalha as principais decisões técnicas tomadas durante o desenvolvimento do projeto, incluindo a escolha da arquitetura, frameworks, gerenciamento de estado, banco de dados, e mais.

## 1. Arquitetura MVC

### Decisão
Utilizar a arquitetura MVC (Model-View-Controller).

### Justificativa
A arquitetura MVC é amplamente utilizada em desenvolvimento de software por dividir a aplicação em três componentes principais: Model, View e Controller. Isso facilita a manutenção, escalabilidade e testabilidade do código.

- **Model**: Representa a estrutura de dados da aplicação. No nosso caso, `Car` e `Cars`.
- **View**: Responsável pela interface do usuário. Aqui, usamos o `CarDetailsView`.
- **Controller**: Manipula a lógica de negócios e a comunicação entre Model e View. Exemplo: `CarController`.

## 2. Flutter como Framework de Desenvolvimento

### Decisão
Usar Flutter para o desenvolvimento do aplicativo.

### Justificativa
Flutter é um framework open-source criado pelo Google. É ideal para criar interfaces bonitas, rápidas e responsivas, tanto para Android quanto para iOS, com uma única base de código.

## 3. Gerenciamento de Estado

### Decisão
Utilizar o `setState` para gerenciamento de estado local.

### Justificativa
Para este projeto simples, `setState` é suficiente para atualizar a UI em resposta a mudanças de estado. Em projetos maiores, consideraríamos provedores de estado mais avançados.

## 4. Banco de Dados SQLite

### Decisão
Usar SQLite para armazenamento local dos leads.

### Justificativa
SQLite é um banco de dados leve e eficiente, ideal para aplicativos móveis que precisam de armazenamento local.

## 5. Persistência e Acesso ao Banco de Dados

### Decisão
Implementar uma classe `DatabaseHelper` para operações CRUD no SQLite.

### Justificativa
Melhora a organização do código e facilita a manutenção das operações de banco de dados.

## 6. Uso de Pacotes de Terceiros

### Decisão
Incluir pacotes como `sqflite`, `http`, e `path_provider`.

### Justificativa
- **sqflite**: Facilita o uso do SQLite no Flutter.
- **http**: Simplifica a realização de requisições HTTP.
- **path_provider**: Ajuda a encontrar diretórios no sistema de arquivos.

## 7. Implementação da Interface do Usuário

### Decisão
Desenvolver uma interface de usuário simples e intuitiva com Flutter.

### Justificativa
Manter a UI simples facilita a usabilidade e a experiência do usuário.

## Conclusão
As decisões técnicas foram orientadas para garantir um desenvolvimento eficiente, manutenção fácil e uma boa experiência do usuário. A combinação de Flutter, SQLite, e uma arquitetura MVC criou um aplicativo robusto e escalável.