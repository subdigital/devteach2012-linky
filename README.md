# Do it Later with Delayed Job & Resque

This is a sample Rails app that demonstrates how to do background processing for Rails apps.

* Delayed Job is used to fetch link details for a submitted URL
* Resque is used to fetch user avatars from [Gravatar](http://gravatar.com)

## Installation / Running the app

To run on your machine, you must have [Redis](http://redis.io) installed.  To install on a Mac with Homebrew:

```
brew install redis
```

Make sure you migrate the database:

```
rake db:migrate
```

Then run the workers (each in their own tab):

```
rake jobs:work
```

```
QUEUE=* rake resque:work
```

Then run the rails server in its own tab:

```
rails s
```

That's it!  Play with the app at http://localhost:3000/links and http://localhost:3000/users

Enjoy :)

## License

This code is released under the MIT License.
