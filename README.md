# Rails Startup template

This is a template I use for my new Ruby on Rails application.

## How to Use

```bash
rails new [name] -m rails_startup_template/template.rb
```

## What it does

1. Adds the following gems
  - [analytics-ruby](https://github.com/segmentio/analytics-ruby): Segment.io as an anaytics solution
  - bcrypt-ruby: For encrypted_password functionality
  - [bourbon](http://bourbon.io/): Useful SASS mixins
  - [haml-rails](http://haml.info): HAML templating language 
  - [simple_form]((https://github.com/plataformatec/simple_form): Simple form builder 
  - uuidtools: To generate UUIDs, useful for various things
  - [rspec-rails]((https://github.com/rspec/rspec-rails): For writing tests 
  - (test environment) [capybara]((https://github.com/jnicklas/capybara): For integration testing 
  - (test environment) [factory_girl_rails]((https://github.com/thoughtbot/factory_girl): FactoryGirl instead of Rails fixtures 
  - (production environment) [rails_12factor]((https://devcenter.heroku.com/articles/rails-integration-gems): For deploying Rails 4 applications on heroku 

2. Sets up [foreman](https://github.com/ddollar/foreman) to deal with environment variables and background services.

3. Cleans up assets by renaming `application.css` to `application.css.scss` and removing the `include_tree` directives. It's better design to import or require things manually. 

4. Optionally installs [Twitter bootstrap](http://getbootstrap.com/)

5. Optionally installs [Font Awesome](http://fortawesome.github.io/Font-Awesome/)

6. Initializes a new git repository