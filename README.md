# Driftrock API Querier

### What is it?

This command line program takes one of five commands and an optional parameter. It will then return the desired response. (See below for commands)


### My Approach

I first started by thinking about how all the code needed to interact in order to achieve the end goal. The first port of call was the app.rb, where the rest of the code would be executed.

Thinking about what needed to happen, the first thing was fetching the data from the API. This required some research into the best way to access the data in a format that was easy to manipulate. Httparty was the gem I found that satisfied these criteria. The way the API is designed required incrementing the page number and grabbing the data till the end was reached (an unknown point till reached). This was done using string interpolation into the url with variables for the type, ie users or purchases, and page number; returning the data in an array.

Next I needed a class to control what happens when the user has given a command. The Controller class is the main core of the code. It tells the DataFetcher class to load the data, then starts the according function to complete the task. I originally extracted some logic out to a command class, but I realised I was parsing a lot of data through and repeating myself. So I took a step back and realised I didn't need it. This also happened with the Calculator class; originally I had two, one for users and one for purchases, but once again I stopped and realised it was unnecessary.

The Calculator class gets the correct data based on the command given. Some of the commands were straight forward once the user id was found, eg. total_spend and average_spend. However, highest_value was more problematic and is still rather messy.

All the above was achieved using TDD to structure the code.

### Installation

Open up terminal, change to the directory you want the repo and type ```git clone https://github.com/w-schwier/driftrock```

Change into the directory ```cd driftrock```

Install required gems by running ```bundle install``` If you don't already have bundle installed run ```brew install bundle```(this assumes you have homebrew installed)

In the command line, run the app by typing ```ruby app.rb COMMAND OPTIONAL_PARAMETER```

The possible commands are: ```total_spend email.of.user@example.com```, ```average_spend email.of.user@example.com```, ```most_loyal```, ```highest_value```, ```most_sold```

### User Stories

As a time pressed user, so that I start the code quickly, I want to run the code with one line.

As a user, so that I can retrieve the correct information, I want to be able to enter a command.

### Challenges and Future Improvements

When testing the DataFetcher class, I struggled to stub the API call, in order to not continuously be pinging the API I chose to comment the tests out. However, given more time I would like to have achieved this so all the code was covered.

In the Controller and Calculator spec files the test data is repeated twice, this doesn't coincide with DRY and agile methodology, but this could of been solved by extracting the data to a helper method.

In the run function of the Controller class, I had to write another function, puts_and_return, in order to pass the tests and still be functional to the user. This is not ideal and looks very messy, some further research would be required to see if a statement like 'puts' exists that serves the same function.

The biggest challenge was the highest_value command. Although it works and returns the right answer, its very inefficient when scaled up. This is something I would like to improve as efficiency is something I'm having to overcome more and more, with little experience previously. I started to identify the section of code that is slow: ```ids.each { |id| arr.push(id => total_spend(id, data)) }```, I believe it is because it is iterating over the data so many unnecessary times. Adding some code that deleted the data once it had been processed would speed it up massively.

I did have some success in improving efficiency, the first success was when fetching the purchase data. Increasing the results per page variable massively decreased the time taken to fetch the data. The second was when selecting the mode of items purchased, most_sold. By adding in puts statements to see where in the process the code had got to I was able to identify one line that was taking maybe 4/5 minutes. Having done some research and changing the line to ```arr.group_by{|i| i}.max{|x,y| x[1].length <=> y[1].length}[0]``` it now takes mili-seconds.
