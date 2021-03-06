# nwea_blogpostapi

Code sample exercise.

# Requirements:
* Ruby: 2.0.0 or greater (written with Ruby-2.4.0)
* Required Gems (and dependencies):
  * 'json'
  * 'sinatra'
  * 'sqlite3'
    


## Installation

Clone this repository:
```bash
$ git clone https://github.com/aytch/nwea_blogpostapi.git
```

Ensure you have an installed Ruby that meets the minimum requirements:

```bash
$ ruby -v
```

Ensure that the required gems are installed:
```bash
$ gem install json sinatra sqlite3
```

Launch the application:
```
$ ruby api.rb
```

By default, the API server will be listening on localhost:4567.

# Sample Input/Output

Add entries:
```bash
$ curl -X POST localhost:4567/post -d '{"title":"\"my first post\"","body":"\"some text here\""}'
```

Retrieve all entries:
```bash
$ curl localhost:4567/posts
[[1,"my first post","some text here"],[2,"my second post","some other text"]]
```
