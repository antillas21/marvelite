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
client = Marvelite::API::Client.new(
  :public_key => 'abcd1234',
  :private_key => '5678efgh'
)
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
| [#comics](#comics) | Fetches a list of comics. |
| [#comic](#comic) | Fetches a single comic resource. |
| [#comic_characters](#comic_characters) | Fetches a list of characters which appear in a specific comic. |
| [#comic_creators](#comic_creators) | Fetches a list of comic creators whose work appears in a specific comic. |
| [#comic_events](#comic_events) | Fetches a list of events in which a comic appears. |
| [#comic_stories](#comic_stories) | Fetches a list of comic stories in a specific comic issue. |
| [#events](#events) | Fetches a list of events. |
| [#event](#event) | Fetches a single event resource. |
| [#event_characters](#event_characters) | Fetches a list of characters which appear in a specific event. |
| [#event_comics](#event_comics) | Fetches a list of comics which take place during a specific event. |
| [#event_creators](#event_creators) | Fetches a list of event creators whose work appears in a specific event. |
| [#event_series](#event_series) | Fetches a list of comic series in which a specific event takes place. |
| [#event_stories](#event_stories) | Fetches a list of comic stories from a specific event. |


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

Fetches a list of comics containing a specific character. Requires a character id value (integer or string). Accepts optional params.

```ruby
client.character_comics(1009610)
client.character_comics('Spider-Man')
client.character_comics(
  1009610,
  { :format => 'graphic novel', :limit => 10, :orderBy => 'title' }
)
client.character_comics(
  'Spider-Man',
  { :format => 'graphic novel', :limit => 10, :orderBy => 'title' }
)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getComicsCharacterCollection_get_2) for a complete list of params that you can pass to the `#character_comics` method.

#### character_events

Fetches a list of events in which a specific character appears. Requires a character id value (integer or string). Accepts optional params.

```ruby
client.character_events(1009610)
client.character_events('Spider-Man')
client.character_events(
  1009610,
  { :limit => 10, :orderBy => 'name' }
)
client.character_events(
  'Spider-Man',
  { :limit => 10, :orderBy => 'name' }
)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getCharacterEventsCollection_get_3) for a complete list of params that you can pass to the `#character_events` method.


#### character_series

Fetches a list of comic series in which a specific character appears. Requires a character id value (integer or string). Accepts optional params.

```ruby
client.character_series(1009610)
client.character_series('Spider-Man')
client.character_series(
  1009610,
  { :seriesType => 'ongoing', :limit => 10, :orderBy => 'title' }
)
client.character_series(
  'Spider-Man',
  { :seriesType => 'ongoing', :limit => 10, :orderBy => 'title' }
)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getCharacterSeriesCollection_get_4) for a complete list of params that you can pass to the `#character_series` method.


#### character_stories

Fetches a list of comic stories featuring a specific character. Requires a character id value (integer or string). Accepts optional params.

```ruby
client.character_stories(1009610)
client.character_stories('Spider-Man')
client.character_stories(1009610, { :limit => 10, :offset => 20 })
client.character_stories('Spider-Man', { :limit => 10, :offset => 20 })
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getCharacterStoryCollection_get_5) for a complete list of params that you can pass to the `#character_stories` method.


#### comics

Fetches a list of comics. Accepts optional params.

```ruby
client.comics
client.comics(:format => 'graphic novel', :limit => 10, :offset => 20 })
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getComicsCollection_get_6) for a complete list of params that you can pass to the `#comics` method.

#### comic

Fetches a single comic resource. Requires a comic id value (integer).

```ruby
client.comic(40128)
```

#### comic_characters

Fetches a list of characters which appear in a specific comic. Requires a comic id value (integer). Accepts optional params.

```ruby
client.comic_characters(40128)
client.comic_characters(40128, :orderBy => 'name', :limit => 30, :offset => 20)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getComicCharacterCollection_get_8) for a complete list of params that you can pass to the `#comic_characters` method.

#### comic_creators

Fetches a list of comic creators whose work appears in a specific comic. Requires a comic id value (integer). Accepts optional params.

```ruby
client.comic_creators(40128)
client.comic_creators(40128, :lastName => 'Romita')
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getCreatorCollection_get_9) for a complete list of params that you can pass to the `#comic_creators` method.

#### comic_events

Fetches a list of events in which a comic appears. Requires a comic id value (integer). Accepts optional params.

```ruby
client.comic_events(40128)
client.comic_events(40128, :orderBy => 'name', :limit => 10)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getIssueEventsCollection_get_10) for a complete list of params that you can pass to the `#comic_events` method.

#### comic_stories

Fetches a list of comic stories in a specific comic issue. Requires a comic id value (integer). Accepts optional params.

```ruby
client.comic_stories(40128)
client.comic_stories(40128, :orderBy => 'name', :limit => 10)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getComicStoryCollection_get_11) for a complete list of params that you can pass to the `#comic_stories` method.

#### events

Fetches a list of events. Accepts optional params.

```ruby
client.events
client.events(:name => 'Acts of Vengeance')
client.events(:orderBy => 'name')
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getEventsCollection_get_18) for a complete list of params that you can pass to the `#events` method.

#### event

Fetches a single comic resource. Requires an event id value (integer).

```ruby
client.event(116)
```

#### event_characters

Fetches a list of characters which appear in a specific event. Requires an event id value (integer). Accepts optional params.

```ruby
client.event_characters(116)
client.event_characters(116, :orderBy => 'name', :limit => 30, :offset => 20)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getEventCharacterCollection_get_20) for a complete list of params that you can pass to the `#event_characters` method.

#### event_creators

Fetches a list of comic creators whose work appears in a specific event. Requires an event id value (integer). Accepts optional params.

```ruby
client.event_creators(116)
client.event_creators(116, :lastName => 'Romita')
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getCreatorCollection_get_22) for a complete list of params that you can pass to the `#event_creators` method.

#### event_comics

Fetches a list of comics which take place during a specific event. Requires an event id value (integer). Accepts optional params.

```ruby
client.event_comics(116)
client.event_comics(116, :format => 'graphic novel', :orderBy => 'title', :limit => 10)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getComicsCollection_get_21) for a complete list of params that you can pass to the `#event_comics` method.

#### event_series

Fetches a list of comic series in which a specific event takes place. Requires an event id value (integer). Accepts optional params.

```ruby
client.event_series(116)
client.event_series(116, :orderBy => 'title', :limit => 10)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getCreatorSeriesCollection_get_23) for a complete list of params that you can pass to the `#event_series` method.

#### event_stories

Fetches a list of comic stories from a specific event. Requires an event id value (integer). Accepts optional params.

```ruby
client.event_stories(116)
client.event_stories(116, :limit => 10)
```

See the [Marvel Comics Interactive API Tester](http://developer.marvel.com/docs#!/public/getEventStoryCollection_get_24) for a complete list of params that you can pass to the `#event_stories` method.



## Responses

All requests to the API, return a `Marvelite::API::Response` object if successful or a `Marvelite::API::ErrorResponse` if API response returns an error. These objects are nothing more than the raw API response enhanced with Hashie methods.

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
