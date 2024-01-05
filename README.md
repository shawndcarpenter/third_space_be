# third_space_be

XXX NEED TO ADD:
API instructions
XXX include database schema
XXX each endpoint is documented with example request & response

# Third Space
> This product aims to help users find locations for leisure activities near them which fit their mood and needs.

The third place is disappearing; a physical location to go to between work/school and home. This application aims to help people find a sense of connection by allowing users to input their current mood and likes with a response of places that may help them find a sense of inclusion (or just help them destress from their daily lives).


## Installation

OS X & Linux:
This project runs on Rails 7.0.8.

Fork and clone [this repository](https://github.com/shawndcarpenter/third_space_fe), which is the front-end of our application.

Fork and clone [this repository](https://github.com/shawndcarpenter/third_space_be) to access our back-end.

Windows:

This product is not compatible with Windows.

## API
XXX Add more data about API endpoints
This application uses the Yelp API to access the locations through the back-end API calls [here](https://docs.developer.yelp.com/reference/v3_business_search).

XXX demonstrate CRUD functionality

## Why Use Third Space?

There are plenty of people who, for a variety of reasons, may wish to find a location to relax beyond their home. This application takes into account the following needs:
1. Mood
2. Accessibility Needs
3. Money the user wishes to spend
4. Whether the space is sober

## Moods Accounted For
1. Calm
2. Studious
3. High Energy
4. Loud
5. Quiet
6. Relaxed
7. Friendly

To provide feedback (including ideas for other moods to be added to our list), contact one of our members in the Staff list below or create a pull request using the instructions outlined in Contributing.

## Development setup
Download both our [front end](https://github.com/shawndcarpenter/third_space_fe) and [back end](https://github.com/shawndcarpenter/third_space_be) applications.

Start the server on the back end and front end applications by typing the following in the terminal of both.

```sh
rails s
```

NOTE: The back-end application should be running on PORT 5000,
while the front-end application should be running on PORT 3000.


Run the following code in your terminal to install the gems required to use this application:
```sh
bundle install
```

Check to make sure all the tests are passing by running the following code in your terminal:
```sh
bundle exec rspec
```

## Gem Information
The front end repository handles most of what the user will interact with, including routing and page rendering. 

### Testing
Our application includes extensive testing using the [Capybara gem](https://github.com/teamcapybara/capybara) to simulate user input and interaction.

This application also uses the [Launchy Gem](https://github.com/copiousfreetime/launchy) to view pages in the browser without needing to start the server.

The [Shoulda Matchers Gem](https://github.com/thoughtbot/shoulda-matchers) is used for one-liner testing of models.

The [Orderly Gem](https://github.com/jmondo/orderly) is used to check the order in which items appear on the pages for our application.

The [SimpleCov Gem](https://github.com/simplecov-ruby/simplecov) provides test coverage analysis for our application.


The back end handles API calls to the Yelp API as well as accepts post requests from the user for location moods. It simulates API calls using the [WebMock gem](https://github.com/bblimke/webmock) and the [VCR gem](https://github.com/vcr/vcr).

Both front end and back end use the [Pry gem](https://github.com/pry/pry) and [RSpec Rails](https://github.com/rspec/rspec-rails) within the testing environment for unit and feature testing.

## Staff

Main Support Email: thirdspace2308@gmail.com

Shawn Carpenter: [Email](shawncarpenter.co@gmail.com) [LinkedIn](https://www.linkedin.com/in/shawndcarpenter/)

Brendan Bondurant: [Email](bondurant.brendan@gmail.com) [LinkedIn](https://www.linkedin.com/in/brendanbondurant/)

Nathan Trautenberg: [Email](ntrautenberg23@gmail.com) [LinkedIn](https://www.linkedin.com/in/nathan-trautenberg-9106271a7/)

Anthea Yur: [Email]() [LinkedIn](https://www.linkedin.com/in/antheayur/)

Charles Ren [Email]() [LinkedIn](https://www.linkedin.com/in/charles-ren-code/)

## Contributing

1. Fork it (<https://github.com/shawndcarpenter/third_space_fe>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request


