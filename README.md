# Ink Tank

## [Live Site](http://the-ink-tank.herokuapp.com/)

## Dev Team

### [Phil DeLong](https://github.com/philjdelong)
### [Darren Campbell]
### [Lain McGrath]
### [Wren Stetile]

## Background and Description

"Ink Tank" is a SaaS platform that is designed to better match Tattoo artists with potential clients. We know that historically, tattoo shops don't spend large amounts of time and money on marketing, so we developed a wep application that allows users to research various tattoo styles to gain a better understanding of what they're looking for. Then we match the user with artists that match their search criteria as well as location. Once the desired artist is found, users can book appointments, send notes, and complete payments all through the app.

## Local Deployment
Follow these instructions in your -nix command line terminal:

Clone this repo:
```
  git clone https://github.com/philjdelong/ink_tank_ui.git
```
Install required gems:
```
  bundle install
  bundle update
```
Start the database:
```
  rails db:{create,migrate,seed}
```
To run test suite and view test coverage:
```
  rspec
  open coverage/index.html
```
Start the Rails server:
```
  rails s
```
In your browser, navigate to localhost:3000.

## Resources Used

- Serp_API: Display Google Search Images based on specified params.
- Stripe: Securely take credit card payments using the app
- Simple-calendar/AJAX: Calendar gem used to display formatted calendar information based on day, week, month, etc. AJAX implimented to interract or make changes without leaving the page.
- Sinatra: Secondary app used to make simple calls to external micro-services.
- Google OAuth: User authentication.

## Learning Goals
 - SaaS
 - Enhanced frontend UX with styling and AJAX. 
 - User-to-user communication for scheduling appointments
 - Services
    - 3rd party OAuth implimentation with less information stored on our side.
 - ActiveRecord
    - Join Multiple tables of data
    - Calculate statistics
    - Create Collections of Data grouped by one or more attributes
