#  Portland ESL Network
## *By Stephanie Gurung*

**Test Login for Admin Path**
```
Username: admin
Password: admin
```
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
$ rake db: seed
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
