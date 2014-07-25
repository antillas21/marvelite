## Changelog

### 0.1.3
* retrieve story series by connecting to the API's `/stories/:id/series` endpoint
  (contributed by [O-I](https://github.com/O-I)).
* Spec cleaning courtesy of [O-I](https://github.com/O-I).
* Removed Rubinius from `.travis.yml`.


### 0.1.2
* Adds `#raw_response` to store the original response from the API inside 
  a `Marvelite::API::Response` instance. Author: [Jon Allured](https://github.com/jonallured)

### 0.1.1
* Gzipped responses are enabled by default.
  * All API requests include `{ 'Accept-Encoding' = 'gzip' }` which translates
    in faster and band-width conscious responses.

### 0.1.0
* Adds Travis CI support.
* Support for Etags and Gzip compression. Infinite thanks to [Jon Allured](https://github.com/jonallured) for this contribution.
* Refactorings and cleanups, courtesy of [Jon Allured](https://github.com/jonallured)

### 0.0.9
* Adds the following endpoints (contributed by: [Patrick Hereford (@phereford)](https://github.com/phereford)):
  * retrieve creators by connecting to the API's `/creators` endpoint
  * retieve a creator by connecting to the API's `/creators/:id` enpoint
  * retrieve creator connecting to the API's `/creators/:id/comics` endpoint.
  * retrieve creator events by connecting to the API's `/creators/:id/events` endpoint.
  * retrieve creator series by connecting to the API's `/creators/:id/series` endpoint.
  * retrieve creator stories by connecting to the API's `/creators/:id/stories` endpoint.
* Pinpoints dependencies versions.


### 0.0.8
* Fixes a problem where the `Marvelite::API::Router` was replacing the value of its return path string when asked for a route. Thanks to [Patrick Hereford (@phereford)](https://github.com/phereford) for reporting the issue.

### 0.0.7
* Adds the following endpoints:
  * retrieve stories by connecting to the API's `/stories` endpoint
  * retieve a story by connecting to the API's `/stories/:id` enpoint
  * retrieve story characters by connecting to the API's `/stories/:id/characters` endpoint.
  * retrieve story comics by connecting to the API's `/stories/:id/comics` endpoint.
  * retrieve story creators by connecting to the API's `/stories/:id/creators` endpoint.
  * retrieve story events by connecting to the API's `/stories/:id/events` endpoint.

### 0.0.6
* Rewrites `Marvelite::API::Client` to allow for self discovery of available methods, depending on the `Marvelite::API::Router` injected at initialization.
* Adds the following endpoints:
  * retrieve series by connecting to the API's `/series` endpoint
  * retieve a serie by connecting to the API's `/series/:id` enpoint
  * retrieve serie characters by connecting to the API's `/series/:id/characters` endpoint.
  * retrieve serie comics by connecting to the API's `/series/:id/comics` endpoint.
  * retrieve serie creators by connecting to the API's `/series/:id/creators` endpoint.
  * retrieve serie events by connecting to the API's `/series/:id/events` endpoint.
  * retrieve serie stories by connecting to the API's `/series/:id/stories` endpoint.


### 0.0.5
* Rewrites `Marvelite::API::Router` class to make flexible to future API versioning changes from Marvel.
* Adds the following endpoints:
  * retrieve events by connecting to the API's `/events` endpoint
  * retieve a event by connecting to the API's `/events/:id` enpoint
  * retrieve event characters by connecting to the API's `/events/:id/characters` endpoint.
  * retrieve event comics by connecting to the API's `/events/:id/comics` endpoint.
  * retrieve event creators by connecting to the API's `/events/:id/creators` endpoint.
  * retrieve event series by connecting to the API's `/events/:id/series` endpoint.
  * retrieve event stories by connecting to the API's `/events/:id/stories` endpoint.
* Adds helper method to retrieve event sub-resources passing an event name instead of a numeric id.


### 0.0.4
* Adds the following endpoints:
  * retrieve comics by connecting to the API's `/comics` endpoint
  * retieve a comic by connecting to the API's `/comics/:id` enpoint
  * retrieve comic characters by connecting to the API's `/comics/:id/characters` endpoint.
  * retrieve comic creators by connecting to the API's `/comics/:id/creators` endpoint.
  * retrieve comic events by connecting to the API's `/comics/:id/events` endpoint.
  * retrieve comic stories by connecting to the API's `/comics/:id/stories` endpoint.

### 0.0.3
* Adds basic testing setup
* Adds the ability to retrieve:
  * character comics by passing a character name instead of a numeric id
  * character events by passing a character name instead of a numeric id
  * character series by passing a character name instead of a numeric id
  * character stories by passing a character name instead of a numeric id

### 0.0.2
* Adds the following endpoints:
  * retrieve character comics by connecting to the API's `/characters/:id/comics` endpoint
  * retrieve character events by connecting to the API's `/characters/:id/events` endpoint
  * retrieve character series by connecting to the API's `/characters/:id/series` endpoint
  * retrieve character stories by connecting to the API's `/characters/:id/stories` endpoint

### 0.0.1
* Initial release and just two endpoints:
  * retrieve characters by connecting to the API's `/characters` endpoint
  * retrieve a character by connecting to the API's `/characters/:id` endpoint
