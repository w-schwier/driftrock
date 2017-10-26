# API Querier

### What is it?

This command line program takes one of five commands and an optional parameter. It will then return the desired response.


### My Approach

I first started by think about how all the code needed to interact in order to achieve the end goal.

### Installation

Open up terminal, change to the directory you want the repo and type ```git clone https://github.com/w-schwier/driftrock```

Change into the directory ```cd driftrock```

Install required gems by running ```bundle install``` If you don't already have bundle installed run ```brew install bundle```(this assumes you have homebrew installed)

In the command line, run the app by typing ```ruby app.rb COMMAND OPTIONAL_PARAMETER```

The possible commands are: ```total_spend email.of.user@example.com```, ```average_spend email.of.user@example.com```, ```most_loyal```, ```highest_value```, ```most_sold```

### User Stories

As a user, so that I can 

As a user, so that

### Challenges and Future Improvements

stubbing data fetcher tests so I wasnt continuiously pinging the API

the data in controller and calculator spec are repeated so extract to a helper

my highest value method is nasty and inefficient

controller, repeated puts and return to pass tests but still function in returning something the user can see

data
