![Logo of the project](https://github.com/jtruong2/shelter/master/app/assets/images/home_icon.png)

# Shelter
> Welcome to Shelter, a community based app for those in need and those wanting to help.
> Please click one of the options below to log in.

Shelter is a dynamic web app designed for connecting individuals who need emergency housing in times of Environmental Catastrophe with home providers in their area.

Disclaimer: Do NOT Use, Not Legitimate Application   

## Installing / Getting started

Shelter is dependent on having developer keys for the [Google APIs](https://console.developers.google.com/projectselector/apis/library) and for [Google Maps APIs](https://console.developers.google.com/apis/api/directions_backend/overview?project=key-chalice-179020&duration=PT1H)

In order to get Shelter running locally make sure you are running , copy the following into your terminal.

```shell
$ git clone git@github.com:jtruong2/shelter.git
$ cd shelter
$ bundle
```
Next, you are going to want to set up your database.
```shell
$ bundle exec rails db:create db:migrate db:seed
```
In addition to setting up your
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

#### Argument 2
Type: `Number|Boolean`  
Default: 100

Copy-paste as many of these as you need.

## Contributing

When you publish something open source, one of the greatest motivations is that
anyone can just jump in and start contributing to your project.

These paragraphs are meant to welcome those kind souls to feel that they are
needed. You should state something like:

"If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome."

If there's anything else the developer needs to know (e.g. the code style
guide), you should link it here. If there's a lot of things to take into
consideration, it is common to separate this section to its own file called
`CONTRIBUTING.md` (or similar). If so, you should say that it exists here.

## Licensing

One really important part: Give your project a proper license. Here you should
state what the license is and how to find the text version of the license.
Something like:

"The code in this project is licensed under MIT license."
