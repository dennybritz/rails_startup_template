# Gems
# ==================================================

# Segment.io as an anaytics solution (https://github.com/segmentio/analytics-ruby)
gem "analytics-ruby"
# For encrypted password
gem "bcrypt-ruby"
# Useful SASS mixins (http://bourbon.io/)
gem "bourbon"

# HAML templating language (http://haml.info)
gem "haml-rails" if yes?("Use HAML instead of ERB?")

# Simple form builder (https://github.com/plataformatec/simple_form)
gem "simple_form"
# To generate UUIDs, useful for various things
gem "uuidtools"

gem_group :development do
  # Rspec for tests (https://github.com/rspec/rspec-rails)
  gem "rspec-rails"
  # Guard for automatically launching your specs when files are modified. (https://github.com/guard/guard-rspec)
  gem "guard-rspec"
end

gem_group :test do
  # Capybara for integration testing (https://github.com/jnicklas/capybara)
  gem "capybara" 
  gem "capybara-webkit"
  # FactoryGirl instead of Rails fixtures (https://github.com/thoughtbot/factory_girl)
  gem "factory_girl_rails"
end

gem_group :production do
  # For Rails 4 deployment on Heroku
  gem "rails_12factor"
end


# Setting up foreman to deal with environment variables and services
# https://github.com/ddollar/foreman
# ==================================================
# Use Procfile for foreman
run "echo 'web: bundle exec rails server -p $PORT' >> Procfile"
run "echo PORT=3000 >> .env"
run "echo '.env' >> .gitignore"
# We need this with foreman to see log output immediately
run "echo 'STDOUT.sync = true' >> config/environments/development.rb"



# Initialize guard
# ==================================================

run "bundle exec guard init rspec"



# Clean up Assets
# ==================================================
# Use SASS extension for application.css
run "mv app/assets/stylesheets/application.css app/assets/stylesheets/application.css.scss"
# Remove the require_tree directives from the sass and JS files. 
# It's better design to import or require things manually.
run "sed -i '' /require_tree/d app/assets/javascripts/application.js"
run "sed -i '' /require_tree/d app/assets/stylesheets/application.css.scss"
# Add bourbon to stylesheet file
run "echo >> app/assets/stylesheets/application.css.scss"
run "echo '@import \"bourbon\";' >>  app/assets/stylesheets/application.css.scss"




# Bootstrap: install from https://github.com/twbs/bootstrap
# Note: This is 3.0 RC1, file location may change soon
# ==================================================
if yes?("Download bootstrap?")
  run "wget http://getbootstrap.com/bs-v3.0.0-rc1-dist.zip -O bootstrap.zip"
  run "unzip bootstrap.zip -d bootstrap && rm bootstrap.zip"
  run "cp bootstrap/dist/css/bootstrap.css vendor/assets/stylesheets/"
  run "cp bootstrap/dist/js/bootstrap.js vendor/assets/javascripts/"
  run "rm -rf bootstrap"
  run "echo '@import \"bootstrap\";' >>  app/assets/stylesheets/application.css.scss"
end


# Font-awesome: Install from http://fortawesome.github.io/Font-Awesome/
# ==================================================
if yes?("Download font-awesome?")
  run "wget http://fortawesome.github.io/Font-Awesome/assets/font-awesome.zip -O font-awesome.zip"
  run "unzip font-awesome.zip && rm font-awesome.zip"
  run "cp font-awesome/css/font-awesome.css vendor/assets/stylesheets/"
  run "cp -r font-awesome/font public/font"
  run "rm -rf font-awesome"
  run "echo '@import \"font-awesome\";' >>  app/assets/stylesheets/application.css.scss"
end


# DS_Store gets added to project if viewed in OSX Finder
run "echo '.DS_Store' >> .gitignore"


# Git: Initialize
# ==================================================
git :init
git add: "."
git commit: %Q{ -m 'Initial commit' }

