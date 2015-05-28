# Amateur League Sports Management Application
By now you should be familiar with basic sinatra apps and creating simple websites.  This problem will give you a chance to demonstrate your proficiency with the web by writing code for controllers, authentication, views, and basic HTML forms with a little bit of CSS. We're going full [CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete) and building a student oranization management application.

The problem is broken into 4 parts.  You will need to complete each part to move on. We've given approximate timing for each part.  If you find you are taking a lot longer be sure to ask questions.

## Objectives

### Part 1: Authentication (Timing ~ 30 min)

Authentication is a central concern of most web applications.  We're going to start by creating a simple app that does nothing more than authenticate a student.


#### User Model

You have an empty `User` model and a database with a `users` table.  Add validations to the `User` model which guarantee the following:

1. Every user has a username
2. Every user's username is unique
3. Every username must be a combination of 3 letters then 3 numbers (e.g. "abc123")
4. Every user has a password at least 8 characters long

You should not store the user's plaintext password in the database.

#### Sign Up, Log In, Log Out

Create views to allow a user to:

1. Sign up as a new user
2. Log in as an existing user
3. Log out as an existing user

### Part 2: Teams  (Timing ~ 30 min)
We have users and teams.
* Users can be players on many teams and teams have many players.
* Teams have a single coach, but that person could coach many teams.

#### Associations

We've already defined the three models for you.  You'll need to create the associations between them.

The `User` model should have:

1. `user.coached_teams` should return the list of teams coached by the user
2. `user.teams` should return the list of teams the user plays on

To be clear, `coached_teams` and `teams` should return completely different results.

The `Team` model should have:

1. `team.coach` should return the user that is coaching the team
2. `team.players` should return a list of players

To help you along your way, we recommend reviewing the ActiveRecord documentation, specifically the available options for the association methods you'll be using.

Once your associations have been set up, you should be able to run `bundle exec rake db:seed` without any errors.  This will populate the data for you.

##### Optional Stretches
1. Write a method on the `Team` model so that `team.captain` returns the captain of the team. (Note that there is a boolean flag on the [playerships](https://en.wiktionary.org/wiki/playership) table that specifies who the captain is.)
2. Write a method on the `User` model so that `user.captainships` returns all of the teams of which the user is the captain.

**Note**: Before you move on to Part 3, be sure your associations are working as expected. Try `rake console` for testing.

### Part 3: CRUD It Up (Timing ~ 45 min)

With student authentication in place it's time to add the functionality needed to manage teams. As a user to the application, you must be able to do the following:

#### Minimum

* View all teams
* View a single team; the team page should include a roster of all the players on the team
* Create a new team, including specifying which user is the coach of the team
* Delete a team

#### Stretches

**Note:** Do not attempt the stretch challenges until you've attempted all parts of the assessement.  

* Delete players from a team
* Add players to a team
* Change the captain of a team
* Edit information about a team (team name, sport played)

### Part 4: AJAXify it (Timing ~ 30 min)
On the page that lists all the teams, add the form for creating a new team.  Use AJAX on this form so that when a user adds a new team, that new team is appended to the list of teams without refreshing the page.
