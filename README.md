# 📱 Pokédex Flutter

Aplicação mobile desenvolvida em **Flutter** que consome dados da **PokéAPI** e permite favoritar Pokémons utilizando **Firebase Firestore**.

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

## 🚀 Funcionalidades

- 🔍 Listagem de Pokémons via API
- 🖼️ Exibição de imagem e nome
- ⭐ Favoritar e desfavoritar Pokémons
- 🔎 Pesquisa em tempo real por nome
- ☁️ Integração com Firebase Firestore

---

## 🛠️ Tecnologias Utilizadas

- Flutter
- Dart
- FlutLab
- PokéAPI
- Firebase
- Cloud Firestore

---

## 🌐 API Utilizada

A aplicação consome dados da API pública:

https://pokeapi.co/api/v2/pokemon

---

## ☁️ Integração com Firebase

O Firebase Firestore foi utilizado para armazenar os Pokémons favoritos.

### 📁 Coleção:
favoritos

### 📌 Estrutura dos dados:

```json
{
  "nome": "pikachu",
  "imagem": "url_da_imagem",
  "favoritadoEm": "timestamp"
}
🧠 Arquitetura da Aplicação
Usuário
  ↓
Interface Flutter (HomePage)
  ↓
ApiService → PokéAPI
  ↓
FirebaseService → Firestore

▶️ Como Executar o Projeto
Clone o repositório:
git clone https://github.com/filipeoliveiradavid/Repositorio-nome-pokedex-flutter.git
Acesse a pasta:
cd pokedex
Instale as dependências:
flutter pub get
Execute o projeto:
flutter run
