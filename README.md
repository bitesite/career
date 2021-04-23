# Career

It's more than just a job, it's a career. Career provides persistent data to supplement your background jobs providing insight into things like status, percent complete, started at, and stopped at. Combined with ActionCable, it can provide a powerful UI for your background jobs.

## Usage

### Tasks

The main model that Career introduces is tasks in the form of `Career::Task`.

1. Create a task:

```ruby
task = Career::Task.create(status: 'scheduled', description: 'My task', class_name: 'MyBackgroundJob')
```

2. Enqueue the task:

```ruby
task.enqueue
```

### Writing jobs for Tasks

`Career::Task#enqueue` always passes in its own ID as the first argument to your background jobs. So, to make your background jobs compatible with `Career::Task`, you'll want the first argument to be `task_id`.

```ruby
require "resque/errors"

class TestJob
  @queue = :default_queue

  def self.perform(task_id, my_param_1, my_param_2)
    task = Career::Task.find(task_id)

    task.log "Started my job..."

    # Do stuff

    task.log "...finished this part of the job..."
    task.update_percent_complete(50)

    # Do Stuff

    task.log "...complete"
    task.update_percent_complete(100)
  end
end
```

### Using Tasks in your jobs

Once you has access to your task in your job, you can start updating the task within your job with methods like

```ruby
require "resque/errors"

class TestJob
  @queue = :default_queue

  def self.perform(task_id, my_param_1, my_param_2)

    # Log messages
    task.log "...info message...", "info"
    task.log "...successful message...", "success"
    task.log "...error message...", "error"

    # Update percent
    task.update_percent_complete(50)
    task.update_percent_complete(100)

    # Update status
    task.update_status('scheduled')
    task.update_status('started') # which also sets the started_at timestamp
    task.update_status('failed')
    task.update_status('interrupted')
    task.update_status('canceled')
    task.update_status('complete') # which also sets the completed_at timestamp
  end
end
```



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
