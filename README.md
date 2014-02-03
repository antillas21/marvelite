# Marvelite

Simple wrapper to communicate with the Marvel Comics API.


> **Important:** This is a work in progress. There's only two endpoints to connect to. I am working into incorporating all of Marvel Comics API endpoints.

## Installation

Add this line to your application's Gemfile:

    gem 'marvelite'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marvelite

## Contents

* [Usage](#usage)
  * [Methods](#methods)
* [Responses](#responses)


## Usage

Please register first in the [Marvel Comics Developer Portal](http://developer.marvel.com/) to get your API credentials (a public key and a private key, you'll need them both to configure and instantiate a client).

### Instantiate a client

```ruby
client = Marvelite::API::Client.new(:public_key => 'abcd1234', :private_key => '5678efgh')
```

### Methods

| Method | Description |
| ------ | ----------- |
| [#characters](#characters) | Fetches a list of comic characters. |
| [#character](#character) | Fetches a single character resource. |
| [#character_comics](#character_comics) | Fetches a list of comics containing a specific character. |
| [#character_events](#character_events) | Fetches a list of events in which a specific character appears. |
| [#character_series](#character_series) | Fetches a list of comic series in which a specific character appears. |
| [#character_stories](#character_stories) | Fetches a list of comic stories featuring a specific character. |

#### characters
Fetches a list of comic characters. Can receive optional params.
```ruby
client.characters
client.characters(:name => 'Spider-Man')
client.characters(:limit => 10, :offset => 400, :orderBy => 'name')
```


See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getCreatorCollection_get_0) for a complete list of params that you can pass to the `#characters` method.

#### character

Fetches a single character resource. Accepts an integer or string value as character id.

```ruby
client.character(1009610)
client.character('Spider-Man')
```

#### character_comics

Fetches a list of comics containing a specific character. Requires a character id value (integer). Accepts optional params.

```ruby
client.character_comics(1009610)
client.character_comics(
  1009610,
  { :format => 'graphic novel', :limit => 10, :orderBy => 'title' }
)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getComicsCharacterCollection_get_2) for a complete list of params that you can pass to the `#character_comics` method.

#### character_events

Fetches a list of events in which a specific character appears. Requires a character id value (integer). Accepts optional params.

```ruby
client.character_events(1009610)
client.character_events(
  1009610,
  { :limit => 10, :orderBy => 'name' }
)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getCharacterEventsCollection_get_3) for a complete list of params that you can pass to the `#character_events` method.


#### character_series

Fetches a list of comic series in which a specific character appears. Requires a character id value (integer). Accepts optional params.

```ruby
client.character_series(1009610)
client.character_series(
  1009610,
  { :seriesType => 'ongoing', :limit => 10, :orderBy => 'title' }
)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getCharacterSeriesCollection_get_4) for a complete list of params that you can pass to the `#character_series` method.


#### character_stories

Fetches a list of comic stories featuring a specific character. Requires a character id value (integer). Accepts optional params.

```ruby
client.character_stories(1009610)
client.character_stories(1009610, { :limit => 10, :offset => 20 })
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getCharacterStoryCollection_get_5) for a complete list of params that you can pass to the `#character_stories` method.

## Responses

All requests to the API, return a `Marvelite::API::Response` object, that is nothing more than the raw API response enhanced with Hashie methods.

This way you gain several adavantages to manipulate the response, like:

```ruby
# HashWithIndifferentAccess like functionality
response[:data][:results][0][:name]
response["data"]["results"][0]["name"]

# Top level methods
response.data
response.data[:results]
```



## Todo

* Add more endpoints


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
