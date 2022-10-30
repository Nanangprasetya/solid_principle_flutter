# Flutter App with S.O.L.I.D Principle

S.O.L.I.D principle adalah sebuah prinsip yang dikelankan oleh Robert J. Martin (a.k.a Uncle Bob) di dalam paper yang di terbitkannya pada tahun 2000 Design Principles and Design Patterns. Dalam 20 tahun terakhir kelima prinsip ini merevolusi dunia pemrograman berbasis object (OOP), merubah cara kita dalam menulis code.

## Documentation

For Example web preview for this project, please enter this website [Flutter Solid Principle](https://flutter_solid_principle.codemagic.app/)

For more information enter the article [Flutter with SOLID Principle](https://www.notion.so/nanang-prasetya/Flutter-with-SOLID-Principle-b8c313db71b84dea9c8b689b07c14c9e).

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

* Flutter version : `3.0.5`
* Dart version : `2.17.6`

**Step 1:**

Clone or download this repo by using the code below:

```bash
git clone https://github.com/Nanangprasetya/solid_principle_flutter.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```bash
flutter pub get
```

**Step 3:**

Run the Flavor:

```bash
flutter run --flavor development --target main_development.dart
flutter run --flavor production --target main_production.dart
```

## Features

* S.O.L.I.D architecture principles
* Multiple Platform (Android, IOS, Web)
* Using BLOC state management
* Responsive Layout (Desktop, Tablet, Mobile)
* Using Local Data if hasn't connectivity
* Infinity Scroll in the List view
* Using Page Storage for handle List view
* Encryption environment API
* C.R.U.D API
* Continuous Integration using Codemagic
* Genrator multiple Flavor
* Native splash screen
* Image with Cache management
* Exception handle and Logger API
* Unit and Widget Tests*

### Folder Structure

![Image](assets/images/intro/SOLID.jpg)

#### Feature pages

```bash
├── lib
│   ├── core
│   │   ├── extensions
│   │   ├── languages
│   │   ├── themes
│   │   ├── utils
│   │   └── values
│   └── presentation
│       ├── bloc
│       ├── models
│       ├── pages
│       ├── routes
│       └── widgets
├── packages
│   ├── solid_domain
│   └── todos_data
└── test
```

#### Domain layer

```bash
├── lib
│   ├── core
│   │   ├── config
│   │   ├── exception
│   │   ├── failure
│   │   ├── usecase
│   │   └── values
│   ├── helper
│   ├── service
│   └── src
│       ├── datasource
│       ├── models
│       └── repositories
└── test
```

#### Data layer

```bash
├── lib
│   └── src
│       ├── entities
│       ├── repositories
│       └── usecases
└── test
```

### Social Media

* [Linkedin Nanang Prasetya](https://www.linkedin.com/in/nanang-prasetya-bekti-000612142/)
* [Telegram Nanang Prasetya](https://t.me/biscuit_uiux)
* [Instagram Nanang Prasetya](https://www.instagram.com/biscuit_uiux/)
* [Dribbble Nanang Prasetya](https://dribbble.com/biscuit_uiux)
