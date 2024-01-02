# Toy Robot Simulator
## Overview

The Toy Robot Simulator is a simple application that simulates the movement of a toy robot on a square tabletop 🤖. The simulation can be run either through a Command Line Interface (CLI) or a web version, providing users with flexibility in interacting with the application.

## Usage
### Command Line Interface (CLI)

![Screenshot from 2024-01-02 18-31-51](https://github.com/marcelegodoy/ToyRobot/assets/58745066/83ead6a4-25b9-44ca-a97d-5f085268589a)


Clone the repository:
```
git clone https://github.com/marcelegodoy/ToyRobot.git
```

Navigate to the project directory:
```
cd ToyRobot
```

Set up the CLI:
```
bundle install
```

Run the application:
```
ruby lib/toy_robot_cli.rb
```

### Web Version

![Screenshot from 2024-01-02 18-31-15](https://github.com/marcelegodoy/ToyRobot/assets/58745066/127b920d-9628-4f4a-b855-0a61864aaa5c)

Clone the repository (if not already cloned):

```
git clone https://github.com/marcelegodoy/ToyRobot.git
```

Navigate to the project directory:

```
cd toy-robot-simulator
```

Set up the database:

```
rails db:create
rails db:migrate
```

Set up the web application:

```
bundle install
```

Run the Rails server:

```
rails server
```

Open your web browser and visit http://localhost:3000 to interact with the web version.

## Ruby and Rails Versions
Ruby: 3.2.2
Rails: 7.0
