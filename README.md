#  Portland ESL Network
## *By Stephanie Gurung*

**Test Login for Admin Path**
```
Username: admin
Password: admin
```

**Note: Google API Key Required**

This project is dependent on the Google Maps JavaScript API and Google Static Maps API. To use this program, you must create a Google API Key.

* Visit [console.developers.google.com](http://console.developers.google.com) and login to your Google account.

* Select *Credentials* from menu on left.

* Click on the *Create Credentials* dropdown menu and select *API Key*. Take note of your new API key and close the popup window.

* Select *Dashboard* from menu on left.

* Click *Enable API*.

* Search for *Google Maps JavaScript API* and *Google Static Maps API* and make sure both libraries are enabled.

Create a .env file in the project directory and save this code inside:
```
GOOGLE_API_KEY=YOUR TOKEN HERE

```

Add the .env file to your .gitignore file.
```
.env
```

## Description

_With this application, a user can view a list of ESL classes and blog posts about classes. An admin can add, edit, and delete classes and blog posts. The application is intended to help ESL students, teachers, and volunteers get connected and stay up to date with classes in the Portland Metro area._

## Technologies Used

* **Application**: *Ruby on Rails 5*<br>
* **Testing**: *Rspec, Capybara*<br>
* **Database**: *Postgres, ActiveRecord*

Installation
------------

Install *Portland ESL Network* by cloning the repository.  
```
$ git clone https://github.com/stephr3/portland-esl-network
```

Check to make sure ruby and rails are installed on your machine.  
```
$ ruby -v
$ rails -v
```
If they are not installed, please follow instructions [here](http://guides.rubyonrails.org/getting_started.html#installing-rails) to install ruby on rails.

Install required gems:
```
$ bundle install
```

Run Postgres:
```
$ postgres
```

Navigate to project file and migrate database:
```
$ rake db: create
$ rake db: migrate
```

Start the Rails webserver:
```
$ rails server
```

Navigate to `localhost:3000` in your browser of choice.

License
-------
_This software is licensed under the MIT license._<br>
Copyright (c) 2016 **Stephanie Gurung**
