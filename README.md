# Marvelite

[![Build Status](https://travis-ci.org/antillas21/marvelite.svg?branch=master)](https://travis-ci.org/antillas21/marvelite)

Simple Ruby wrapper to communicate with the Marvel Comics API.

## Installation

Add this line to your application's Gemfile:

    gem 'marvelite'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marvelite

## Contents

* [Usage](#usage)
* [Responses](#responses)

## Usage

Please register first in the [Marvel Comics Developer
Portal](http://developer.marvel.com/) to get your API credentials (a public key
and a private key, you'll need them both to configure and instantiate a client).

### Instantiate a client

```ruby
client = Marvelite::API::Client.new( :public_key => 'abcd1234', :private_key => '5678efgh')

# fetch a list of characters
client.characters
client.characters(:name => 'Spider-Man')
client.characters(:limit => 10, :offset => 400, :orderBy => 'name')

# fetch a single character
client.character(1009610)
client.character('Spider-Man')

# fetch a list of comics
client.comics
client.comics(:format => 'graphic novel', :limit => 10, :offset => 20 })

# fetch a single comic
client.comic(40128)

# fetch a list of comic characters
client.comic_characters(40128)
client.comic_characters(40128, :orderBy => 'name', :limit => 30, :offset => 20)

# fetch a list of creators
client.creators
client.creators(:lastName => 'Romita')

# fetch a creator
client.creators(214)

# fetch a creator comics
client.creator_comics(214)

# fetch a list of events
client.events
client.events(:name => 'Acts of Vengeance')
client.events(:orderBy => 'name')

# fetch a single event
client.event(116)
client.event('Acts of Vengeance!')

# fetch a list of comics in an event
client.event_comics(116)
client.event_comics('Acts of Vengeance!')
client.event_comics(116, :format => 'graphic novel', :orderBy => 'title', :limit => 10)
client.event_comics('Acts of Vengeance!', :format => 'graphic novel', :orderBy => 'title', :limit => 10)

# fetch a list of series
client.series
client.series(:title => 'Spider-Man')
client.series(:orderBy => 'title')

# fetch a single serie
client.serie(2069)

# fetch a list of comics in a serie
client.series_comics(2069)
client.series_comics(2069, :format => 'graphic novel', :orderBy => 'title', :limit => 10)

# fetch a list of stories
client.stories
client.stories(:limit => 50, :offset => 100)
client.stories(:orderBy => 'id')

# fetch a single story
client.story(2210)

# fetch a list of comics in a story
client.story_comics(2210)
client.story_comics(2210, :format => 'graphic novel', :orderBy => 'title', :limit => 10)
```

See the list of [available
methods](https://github.com/antillas21/marvelite/wiki/Documentation) in the
wiki.

## Responses

Most requests to the API, return a `Marvelite::API::Response` object if
successful or a `Marvelite::API::ErrorResponse` if API response returns an
error. These objects are nothing more than the raw API response enhanced with
Hashie methods.

This way you gain several adavantages to manipulate the response, like:

```ruby
# HashWithIndifferentAccess like functionality
response[:data][:results][0][:name]
response["data"]["results"][0]["name"]

# Top level methods
response.data
response.data[:results]
```

You can always access the raw response returned by the API by calling the
`#raw_response` attribute of the response. Example:

```ruby
hero = client.character(1009610)
hero.raw_response
#=> { "code"=>200, "status"=>"Ok", "copyright"=>"© 2014 MARVEL", ... }
```
Difference between `response` and `raw_reponse`, is that `raw_response` does
not include `Hashie` helpers, and thus you need to navigate it as a plain old
Hash.
```ruby
hero.raw_response['data'][0]['name']
#=> "Spider-Man"
```

## Etags and Gzip support

Support for Etags is built into every endpoint:

```ruby
first_response = client.series
first_response.status # => 200

second_response = client.series headers: { 'If-None-Match' => first_response.etag }
second_response.status # => 304
```

Gzip compressed responses are enabled by default. But if you feel more
comfortable passing it explicitely, you can do it like this:

```ruby
gzipped_response = client.series(:headers => {'Accept-Encoding' => 'gzip'})
#=> Faster response hash from Marvel's API series endpoint. :)
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
