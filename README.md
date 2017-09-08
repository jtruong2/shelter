![Logo of the project](https://rawgithubusercontent.com/jtruong2/shelter/master/app/assets/images/home_icon.png)

# Shelter

> Welcome to Shelter, a community based app for those in need and those wanting to help.
> Please click one of the options below to log in.

Shelter is a dynamic web app designed for connecting individuals who need emergency housing in times of Environmental Catastrophe with home providers in their area.

Disclaimer: Do NOT Use, Not Legitimate Application   

# Team

[Eddie Rose](https://github.com/erose357)
[Jimmy Truong](https://github.com/jtruong2)
[Mark Van Akkeren](https://github.com/markyv18)
[Wil Donovan](https://github.com/swdonovan)
[Will Ratterman](https://github.com/wratterman)


## Installing / Getting started

Shelter is dependent on having developer keys for the [Google APIs](https://console.developers.google.com/projectselector/apis/library) and for [Google Maps APIs](https://console.developers.google.com/apis/api/directions_backend/overview?project=key-chalice-179020&duration=PT1H)

In order to get Shelter running locally make sure you are running , copy the following into your terminal.
```shell
$ git clone git@github.com:jtruong2/shelter.git
$ cd shelter
$ bundle
```
Next, you are going to want to set up your database.
[Database]((https://rawgithubusercontent.com/jtruong2/shelter/master/app/assets/images/db.png))

In your terminal...
```shell
$ bundle exec rails db:create db:migrate db:seed
```
## Configuration

  HERE JIMMY

### Building

If your project needs some additional steps for the developer to build the
project after some code changes, state them here:

```shell
./configure
make
make install
```

Here again you should state what actually happens when the code above gets
executed.

### Deploying / Publishing

In case there's some step you have to take that publishes this project to a
server, this is the right time to state it.

```shell
packagemanager deploy awesome-project -s server.com -u username -p password
```

And again you'd need to tell what the previous code actually does.

## Features

What's all the bells and whistles this project can perform?
* What's the main functionality
* You can also do another thing
* If you get really randy, you can even do this

## Configuration

Here you should write what are all of the configurations a user can enter when
using the project.

#### Argument 1
Type: `String`  
Default: `'default value'`

State what an argument does and how you can use it. If needed, you can provide
an example below.

Example:
```bash
awesome-project "Some other value"  # Prints "You're nailing this readme!"
```
