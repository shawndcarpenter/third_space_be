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

[Bootstrap](https://github.com/twbs/bootstrap-rubygem) was used extensively for design on the front end.

### Testing
Our application includes extensive testing using the [Capybara gem](https://github.com/teamcapybara/capybara) to simulate user input and interaction.

This application also uses the [Launchy Gem](https://github.com/copiousfreetime/launchy) to view pages in the browser without needing to start the server.

The [Shoulda Matchers Gem](https://github.com/thoughtbot/shoulda-matchers) is used for one-liner testing of models.

The [Orderly Gem](https://github.com/jmondo/orderly) is used to check the order in which items appear on the pages for our application.

The [SimpleCov Gem](https://github.com/simplecov-ruby/simplecov) provides test coverage analysis for our application.

The [FactoryBot](https://github.com/thoughtbot/factory_bot) and [Faker Gems](https://github.com/faker-ruby/faker) was used to create large amounts of data for testing. 

The back end handles API calls to the Yelp API as well as accepts post requests from the user for location moods. It simulates API calls using the [WebMock gem](https://github.com/bblimke/webmock) and the [VCR gem](https://github.com/vcr/vcr).

Both front end and back end use the [Pry gem](https://github.com/pry/pry) and [RSpec Rails](https://github.com/rspec/rspec-rails) within the testing environment for unit and feature testing.

# How to Use the API
The possible requests are divided into locations, which are taken from the Yelp API, and Third Spaces, which are provided to the front end from this application.

## Locations
### GET Locations
Locations will receive the following input:
```sh
GET "/api/v1/locations/search_locations",
params = ({name: "Business Name",
          city: "Business City"
                })
```
And Return the following output to the front end application:
```sh
{:data=>
  [{:id=>"location_id",
    :type=>"search_result",
    :attributes=>
     {:id=>"location_id", :name=>"Location Name", :address=>"Location Address", :category=>"Location Category"}},
   {:id=>"location_id",
    :type=>"search_result", ...
```

### GET One Detailed Location
Locations will receive the following input:
```sh
GET "/api/v1/locations/:id"
```
And Return the following output to the front end application:
```sh
 {:id=>id,
   :type=>"detailed_location",
   :attributes=>
    {:yelp_id=>"yelp_id",
     :name=>"Business Name",
     :address=>"1234 Business Ave S, Minneapolis, MN 12345",
     :rating=>4.5,
     :phone=>"(555) 123-4567",
     :photos=>
      ["photopath.jpg",
       "photopath2.jpg"],
     :lat=>float,
     :lon=>float,
     :price=>"$$",
     :hours=>
      [{:open=>
         [{:is_overnight=>false, :start=>"0700", :end=>"1800", :day=>0},
          {:is_overnight=>false, :start=>"0700", :end=>"1800", :day=>1},
          {:is_overnight=>false, :start=>"0700", :end=>"1800", :day=>2},
          {:is_overnight=>false, :start=>"0700", :end=>"1800", :day=>3},
          {:is_overnight=>false, :start=>"0700", :end=>"1800", :day=>4},
          {:is_overnight=>false, :start=>"0700", :end=>"1800", :day=>5},
          {:is_overnight=>false, :start=>"0700", :end=>"1800", :day=>6}],
        :hours_type=>"REGULAR",
        :is_open_now=>true}],
     :category=>"category",
     :open_now=>true}}}
```

### GET Reviews For A Location
Locations will receive the following input:
```sh
GET "/api/v1/locations/:id/reviews"
```
And Return the following output to the front end application:
```sh
{:data=>
  [{:id=>"id",
    :type=>"review",
    :attributes=>
     {:id=>"id",
      :rating=>5,
      :text=>
       "Some of the best coffee and tea around. They usually have some great breakfast snacks to offer...",
      :name=>"Jeremy S.",
      :yelp_id=>"id"}},
   {:id=>"id", ...
```

## Third Spaces
### GET One Third Space
Third Spaces will receive the following input:
```sh
GET "/api/v1/locations/5pWHnKN3_AIrXiyyqZ74pw"
```
And Return the following output to the front end application:
```sh
{:id=>"3975",
 :type=>"third_space",
 :attributes=>
  {:yelp_id=>"NmS9OJcWvt2b0T5HBhevyA",
   :name=>"Flagstaff House Restaurant",
   :address=>"1138 Flagstaff Rd, Boulder, CO 80302",
   :rating=>4.0,
   :phone=>"(303) 442-4640",
   :photos=>nil,
   :lat=>40.00726560834577,
   :lon=>-105.29451806098224,
   :price=>"$$$$",
   :hours=>nil,
   :category=>"French",
   :open_now=>nil,
   :tags=>
    ["happy",
     "studious"] }}
```

### GET All Third Spaces
Third Spaces will receive the following input:
```sh
 get '/api/v1/third_spaces'
```
And Return the following output to the front end application:
```sh
[{:id=>"id",
  :type=>"third_space",
  :attributes=>
   {:yelp_id=>"yelp_id",
    :name=>"Name",
    :address=>"1400 Address St, Business, CO 12345",
    :rating=>4.0,
    :phone=>"(555) 123-4567",
    :photos=>nil,
    :lat=>float,
    :lon=>float,
    :price=>"$$",
    :hours=>nil,
    :category=>"New American",
    :open_now=>nil,
    :tags=>nil}},
 {:id=>"id2",
  :type=>"third_space", ...
```

### Create A Third Space
Third Spaces will receive the following input:
```sh
POST '/api/v1/third_spaces', ({ id: id,
                    yelp_id: yelp_id,
                    name: name,
                    address: address,
                    rating: rating,
                    phone: phone,
                    photos: [],
                    lat: float,
                    lon: float,
                    price: $$,
                    hours: hours,
                    open_now: false,
                    category: "German",
                    tags: ["happy", "studious"]})
```
And Return the following output to the front end application:
```sh
({ id: id,
                    yelp_id: yelp_id,
                    name: name,
                    address: address,
                    rating: rating,
                    phone: phone,
                    photos: [],
                    lat: float,
                    lon: float,
                    price: $$,
                    hours: hours,
                    open_now: false,
                    category: "German",
                    tags: ["happy", "studious"]})
```

### Delete A Third Space
Third Spaces will receive the following input:
```sh

```
And Return the following output to the front end application:
```sh

```

### Update A Third Space
Third Spaces will receive the following input:
```sh

```
And Return the following output to the front end application:
```sh

```

### POST A Third Space To User Saved Third Spaces
Third Spaces will receive the following input:
```sh

```
And Return the following output to the front end application:
```sh

```

### DELETE A Third Space From User Saved Third Spaces
Third Spaces will receive the following input:
```sh

```
And Return the following output to the front end application:
```sh

```

### SEARCH For A Third Space From User Saved Third Spaces
Third Spaces will receive the following input:
```sh

```
And Return the following output to the front end application:
```sh

```




# Staff

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


