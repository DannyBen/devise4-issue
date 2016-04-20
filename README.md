# Devise 4 Debug

This repository was created to demonstrate this [issue] with Devise 4.0 
and Capybara.


## How to Reproduce Issue

1. Clone this repo and `cd` into it
2. Run `rake cucumber`

This will output:

```
$ rake cucumber
/home/vagrant/.rvm/rubies/ruby-2.2.1/bin/ruby -S bundle exec cucumber  --profile default
Running via Spring preloader in process 13712
Using the default profile...
Feature: Welcome

DEPRECATION WARNING: [Devise] Parameter sanitization through a "Devise::ParameterSanitizer#sign_in" method is deprecated and it will be removed from Devise 4.1.
Please use the `permit` method on your sanitizer `initialize` method.

  class Devise::ParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      permit(:sign_in, keys: [:param1, :param2, :param3])
    end
  end
 (called from get at /home/vagrant/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/forwardable.rb:183)
  Scenario: Devise sign in         # features/welcome.feature:3
    Given I am logged in as "user" # features/step_definitions/login.rb:5
      wrong number of arguments (0 for 1..2) (ArgumentError)
      ./features/step_definitions/login.rb:6:in `/^I am logged in as "(.*?)"$/'
      features/welcome.feature:4:in `Given I am logged in as "user"'

Failing Scenarios:
cucumber features/welcome.feature:3 # Scenario: Devise sign in

1 scenario (1 failed)
1 step (1 failed)
0m0.091s
```


## Files of interest

- `features/step_definitions/login.rb`
- `features/welcome.feature`


## Steps taken to create this repo

1: Get an initial rails and devise set up:

- `$ rails new devise4`
- Add `gem 'devise'` to Gemfile
- `$ bundle`
- `$ rails generate devise:install`
- `$ rails generate devise user`
- `$ rails g controller welcome index`
- Add `root 'welcome#index'` to `config/routes`
- `$ rake db:migrate`


2: Add Cucumber / Capybara

- Add `gem 'cucumber-rails', :require => false` to `Gemfile`
- Add `gem 'database_cleaner'` to `Gemfile`
- (instructions taken from [cucumber setup] instructions)
- Add the file `features/step_definitions/login.rb`
- Add the file `features/welcome.feature`
- (Capybara is bundled with cucumber-rails)

[cucumber setup]: https://github.com/cucumber/cucumber-rails
[issue]: https://github.com/plataformatec/devise/issues/4048
