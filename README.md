# Flutter Micro Front End Scaffolding Tool

## Requirements

* [Node.js](http://nodejs.org/)

## Installation Steps

1. Clone repo
2. Run `npm install`
3. Run `sudo npm link`
4. A `scaffold` command is now at your disposal.

## Examples of use:

```bash
scaffold mf user_profile
```

### Output
Running the command above will generate a folder called `user_profile` with the following contents:

```
user_profile
│   README.md
│   pubspec.yaml
│   .gitignore
│   
└───lib
│   │   user_profile.dart
│   │
│   └───app
│   │   │   user_profile_events.dart
│   │   │   user_profile_resolver.dart
│   │   │   
│   │   └───presenter
│   │   │   │   user_profile_view.dart
│   │   │   │      

```

