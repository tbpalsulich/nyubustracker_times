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

Start up the server with `rails server`. The app is also up on Heroku at
[nyubustimes.herokuapp.com/](http://nyubustimes.herokuapp.com/).

## Current Design

Everything happens on a single page (see `app/views/stops/index.html.erb`). All manipulations are done through
Javascript JQuery (see `app/assets/javascripts/stops.js.coffee`). Users select a stop from the list in the
left column and that stop's detail is opened in the right column. This is done through remote Ajax calls
that act on the same page. The list of stops is provided by the Stops controller (`app/controllers/stops_controller.rb`).
The times data is passed from the server to the client through the `gon` library.

In the future, a button should allow the times, routes, IDs, etc. to be edited. This site will also be used to handle
the requests from the NYU Bus Tracker mobile apps. So, once the user is happy with the schedule, they should be able to
'publish' them, so that the mobile apps will receive the updated times.

A helpful feature would be to create different 'profiles' of times. The times may change drastically between summer,
winter break, and the regular school year. But, times may not change much from summer to summer. Along the same vein,
ideally, there would be a version control system, so users can revert unintentional changes.

Users are required to log in to access the site. But, for now, anyone can make an account.