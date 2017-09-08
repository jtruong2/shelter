![Logo of the project](https://rawgithubusercontent.com/jtruong2/shelter/master/app/assets/images/home_icon.png)

# Shelter

> Welcome to [Shelter](http://shelter-in-need.herokuapp.com/), a community based app for those in need and those wanting to help

Shelter is a dynamic web app designed for connecting individuals who need emergency housing in times of Environmental Catastrophe with home providers in their area.

Disclaimer: Do NOT Use, Not Legitimate Application   

# Team

- [Eddie Rose](https://github.com/erose357)
- [Jimmy Truong](https://github.com/jtruong2)
- [Mark Van Akkeren](https://github.com/markyv18)
- [Wil Donovan](https://github.com/swdonovan)
- [Will Ratterman](https://github.com/wratterman)


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

 Keys that you'll in your config/application.yml:
 * GOOGLE_CLIENT_ID
 * GOOGLE_CLIENT_SECRET
 * GOOGLE_MAPS_ID
 (This application uses Gmail configuration for the email functionality. You will need to add a gmail account to this file like this...)
 * GMAIL: 'example@gmail.com
 * PASSWORD 'example'

## Features

The features of this application include...
- Allowing any visitor to search and get live emergency weather alerts via [NOAA Weather API](https://forecast-v3.weather.gov/documentation?redirect=legacy)
- Allowing for Google Sign-In
- Manual Sign In comes with two-step verification
- Allows for a registered user to search for, view and reserve properties in their area
- A user can also be a home provider, and can approve, cancel and complete reservations at their home
- Displays the properties of registered home owners  
- Allows for user to get directions immediately to a property using the [Google Maps API](https://console.developers.google.com/apis/api/directions_backend/overview?project=key-chalice-179020&duration=PT1H) 

