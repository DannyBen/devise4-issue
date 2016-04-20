# Devise 4 Debug

## Steps taken to create this repo

1: get an initial rails and devise set up:

- `$ rails new devise4`
- Add `gem 'devise'` to Gemfile
- `$ bundle`
- `$ rails generate devise:install`
- `$ rails generate devise user`
- `$ rails g controller welcome index`
- Add `root 'welcome#index'` to `config/routes`
- `$ rake db:migrate`


2: Add Capybara / Cucumber

