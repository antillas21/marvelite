## Changelog

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