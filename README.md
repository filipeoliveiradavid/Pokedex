# 📱 Pokedex

Aplicação desenvolvida com **Flutter + Firebase**, que consome uma API de Pokémons, permitindo visualizar, buscar e explorar informações de diferentes espécies de forma simples e interativa.

---

## 📸 Prints da Aplicação

Tela inicial:

![Tela 1](pokedex%20(2)/assets/print1.png)

Opção de Busca:

![Tela 2](pokedex%20(2)/assets/print2.png)

Favoritar Pokémon:

![Tela 3](pokedex%20(2)/assets/print4.png)

Firebase (Antes):

![Tela 4](pokedex%20(2)/assets/print3.png)

Firebase (Depois):

![Tela 5](pokedex%20(2)/assets/print5.png)

---

## 🚀 Tecnologias Utilizadas

| Tecnologia  | Função                                  |
| ----------- | --------------------------------------- |
| Flutter     | Desenvolvimento da interface mobile/web |
| Dart        | Linguagem principal da aplicação        |
| Firebase    | Backend (configuração e integração)     |
| API PokéAPI | Fonte de dados dos Pokémons             |

---

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                # Ponto de entrada da aplicação
├── api_service.dart         # Comunicação com a API de Pokémons
├── firebase_service.dart    # Integração com Firebase
├── pokemon.dart             # Modelagem dos dados do Pokémon
├── firebase_options.dart    # Configurações do Firebase
```

---

## 🗂️ Arquitetura e Responsabilidades

### `main.dart`

Responsável por inicializar o Firebase e iniciar a aplicação Flutter.

### `api_service.dart`

Centraliza todas as chamadas HTTP para a API de Pokémons.

### `firebase_service.dart`

Gerencia a comunicação com o Firebase.

### `pokemon.dart`

Define a estrutura de dados utilizada na aplicação.

---

## ⚙️ Pré-requisitos

Antes de iniciar, certifique-se de ter instalado:

* Flutter SDK
* Dart
* Conta no Firebase configurada

---

## 🛠️ Como Executar o Projeto

### 1. Clone o repositório

```bash
git clone https://github.com/filipeoliveiradavid/Pokedex.git
cd Pokedex
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 3. Configure o Firebase

Certifique-se de que o arquivo `firebase_options.dart` esteja corretamente configurado com os dados do seu projeto Firebase.

### 4. Execute o projeto

```bash
flutter run
```

---

## 🔌 API Utilizada

A aplicação consome a API pública:

* PokéAPI → https://pokeapi.co/

**Exemplos de uso:**

| Endpoint          | Descrição              |
| ----------------- | ---------------------- |
| `/pokemon`        | Lista de Pokémons      |
| `/pokemon/{name}` | Detalhes de um Pokémon |

---

## 📄 Licença

Este projeto está sob a licença MIT.

---

<p align="center">Desenvolvido com Flutter + Firebase</p>
