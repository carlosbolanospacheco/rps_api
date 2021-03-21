
# Rock-Paper-Scissors API
## Requirements
* Ruby 3.0.0
* Ruby on Rails 6.1.3

I had problems installing PostgreeSQL so I had to use SQLLite
## Installation
Run the following in your project dir
bundle install
## Running tests
Run the following in your project dir
bundle exec rspec
## Usage
Run the following in your project dir
rails s

To play a new game
```
curl --header "Content-Type: application/json" --request GET --data '{"name":"Ponky", "move":"rock"}' http://localhost:3000/api/v1/play
```

An example of answer to a game is:
```
{"date":"2021-03-21T17:38:06","moves":[{"name":"Dan Brown","move":"paper"},{"name":"Bot","move":"scissors"}],"winner":"Winner is bot"}
```

To get the list of existing games. You can indicate the offset to paginate the results
```
curl --request GET --header "Content-Type: application/json" --data '{"offset":2}' http://localhost:3000/api/v1/get_history
```

An of a list of games is:
```
{"total_games":3,"first_game":1,"games":[{"game":1,"date":"2021-03-21T11:36:27","moves":[{"name":"JK Rowling","move":"scissors"},{"name":"Bot","move":"rock"}],"winner":"Winner is bot"},{"game":2,"date":"2021-03-21T11:36:29","moves":[{"name":"JK Rowling","move":"scissors"},{"name":"Bot","move":"paper"}],"winner":"Winner is JK Rowling"},{"game":3,"date":"2021-03-21T11:36:31","moves":[{"name":"JK Rowling","move":"scissors"},{"name":"Bot","move":"scissors"}],"winner":"Tied game"}]}
```
