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

**Same shits ... Different projects!**

For example let's have a look in `Deploying` process:

- **Scenario 1:** Deploying with `Capistrano` ... `cap deploy`
- **Scenario 2:** Custom deploying process `svn update`, `make assets`, `rsync ...`
- **Scenario 3:** Deploying to PaaS ... `git push heroku master`

Yeah ... many different ways to do it but the goal is the same!


### The Solution
I just decided to ***standardize*** these things :)

    $ develo deploy

on every f**kin project! **That's it!** :)


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

So thank you very much that you are looking in this section :) I will be very happy and thankful if you share some ideas, some hacks and best practices which will make our lives nicer and easier :)

Fork the [develo repo on GitHub](https://github.com/mignev/develo), make your super duper awesome changes :) and send me a Pull Request. :)

# TODO
- Add `setup` action.

    - This kind of action will be useful when for example invite new developer to the proejct and there will be the code for setuping environment (installing gems, installing npm packages, installing and configuring grunt installing bower dependencies, making dirs that are in .gitignore by default because they are need only in development and so on.)

- Add `info` action.

    - This kind of action will be useful to add some project info. Wiki links or some info about some procedures of the project and so on.

- Add `release` action

    - This action will be useful to collect some logic in cases when we develop packages (gem,pip,phar and so on.)

- Add `tests` action
    
    - This action will be useful to collect logic about the tests of the project.

- deactivate env
- Add some tests
- Templates for different kind of projects.
  - `develo init --app rails` (jekyll, django ...)
  - `develo init --app https://github.com/mignev/develo-custom-actions.git`
  - `develo new myproject --from gh-user/gh-repo --args`

- Add global and local config file
    - This will be useful if there isn't any sense to run `develo activate` automaticaly every time when you change to directory with initialized develo within. Also will be useful to add some ENV_VAR into it which will be available in all actions and so on.

# CHANGELOG

### 0.0.8:

#### Features
- Basic implementation of selfupdate function

#### Bugfixes
- Fix PS1 newline regx
- Fix bug with `_develo_root_dir`. Now use builtin cd instead of develo's cd command

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


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/mignev/develo/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

