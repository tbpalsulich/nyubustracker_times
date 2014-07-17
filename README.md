This Ruby on Rails app will be used to create the JSON files for the NYU Bus Tracker apps.

## Install

* Ruby 2.1.2, Rails 4.X

* Database creation:  
    * Install postgres  
    * Create the POSTGRES_USER and POSTGRES_PASSWORD environment variables
    * `sudo -u postgres psql`
    * `create role [POSTGRES_USER] with createdb login password '[POSTGRES_PASSWORD]'`, substituting in the
       environment variables.
    * `<ctrl-D>`
    * rake db:create

Start up the server with `rails server`. Or, the app is also up on Heroku at http://nyubustimes.herokuapp.com/.