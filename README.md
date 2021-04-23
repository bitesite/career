# Career
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'career'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install career
```

### Run Migrations

This gem comes packaged with some database tables so be sure to run your migrations:

```
rails create:install:migrations
rails db:migrate
```

### Setup CSS

Add the following line to your Manifest if you're using Rails 6

```
# app/assets/config/manifest.js
//= link career/application.css
```

## Contributing
Contribution directions go here.

### Development

#### Testing

To run rspec, be sure to

1. Setup your dummy database

```
cd spec/dummy
cp config/database.yml.tmpl config/database.yml
```

Then edit the `config/database.yml` for your database and run `rails db:create`

2. Copy engine migrations

The main engine migrations are managed in the top level directory and need to be copied down to `spec`:

```
cd spec/dummy
rails career:install:migrations
rails db:migrate
```

*Note: We use `ActiveRecord::Migrator.migrations_paths = './dummy/db/migrate'` to deal with the new timestamp that gets created when copying migrations.*

3. Run rspec

At this point, you should be able to run `rspec` from the root folder.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
