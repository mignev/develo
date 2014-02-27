Develo
=======

Hi, don't be so excited :) There's nothing magical here :) `Develo` is just a tool that helps me to handle the same stuff that I do but on different projects and environments.

What do I mean?

### The Problem

Imagine that you are just like me ... love to experiment or work with different programming languages or with different frameworks.

I saw that on every (web)project that I work with I have the same things to do:

- **Setup and prepare project environment**
- **Running development servers**
- **Using REPLs**
- **Accessing DBs**
- **Deploying**
- **Updating project**

**Same things ... Different projects!**

For example let's have a look in `Deploying` process:

- **Scenario 1:** Deploying with `Capistrano` ... `cap deploy`
- **Scenario 2:** Custom deploying process `svn update`, `make assets`, `rsync ...`
- **Scenario 3:** Deploying to PaaS ... `git push heroku master`

Yeah ... many different ways to do it but the goal is the same!


### The Solution
I just decided to ***standardize*** these things :)

    $ develo deploy

on every project! **That's it!**


#Usage examples

Some quick examples how can you use `develo`

### Initialize new environment

    $ develo init

This command will create `.develo` directory in your project with some half empty action files.

    .develo/
    ├── activate
    ├── console
    ├── db
    ├── deploy
    ├── server
    └── update

If you don't have any idea what kind of code you can put into the action files, open them one by one and there are some usage examples :)

If you have any ideas for other similar behaviours which we can make as a developers please share them :)

### Using actions

    $ develo <action>

If you want to run the code of `.develo/deploy` for example you have to run:

    $ develo deploy

That's all!

### Help

    $ develo help


#Requirements

* bash
* make

# Installation

### With make

    $ git clone https://github.com/mignev/develo.git
    $ cd develo
    $ make install

### Manual

    $ cd ~
    $ git clone https://github.com/mignev/develo.git
    $ mv develo ~/.develo_project
    $ echo '\nsource ~/.develo_project/develo.sh' >> ~/.bashrc


# Uninstallation

    $ cd develo
    $ make uninstall

# Testing

TODO

# Contributing

So thank you very much that you are looking in this section :) I will be very happy and thankful if you share some ideas, some hacks which will make our lives nicer and easier :)

Fork the [develo repo on GitHub](https://github.com/mignev/develo), make your super duper awesome changes :) and send me a Pull Request. :)

# TODO
- deactivate env
- Add some tests
- Templates for different kind of projects.
  - `develo init --app rails` (jekyll, django ...)
  - `develo init --app https://github.com/mignev/develo-custom-actions.git`

# CHANGELOG


### 0.0.5:

- Basic implementation of selfupdate function

### 0.0.2:

- Make some documentation in README.md

### 0.0.1:

- First actions are defined
- Usage examples in the actions themselves
- Basic implementation of develo `init`, running actions
- Patching `cd` command
- Makefile `install`, `uninstall`

#Copyright
Copyright (c) 2014 Marian Ignev. See LICENSE for further details.
