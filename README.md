# Spree Social

[![Build Status](https://travis-ci.org/spree-contrib/spree_social.svg?branch=master)](https://travis-ci.org/spree-contrib/spree_social)
[![Code Climate](https://codeclimate.com/github/spree-contrib/spree_social/badges/gpa.svg)](https://codeclimate.com/github/spree-contrib/spree_social)

Core for all social media related functionality for Spree.
The Spree Social gem handles authorization, account creation and association through social media sources such as Twitter and Facebook.
This gem is beta at best and should be treated as such.
Features and code base will change rapidly as this is under active development.
Use with caution.

---

## Setup for Production

1. Add this extension to your Gemfile with this line:

  #### Spree >= 3.1

  ```ruby
  gem 'spree_social', github: 'OmSolution/spree_social'
  ```


2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_social:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.



Preference(optional): By default url will be `/users/auth/:provider`. If you wish to modify the url to: `/member/auth/:provider`, `/profile/auth/:provider`, or `/auth/:provider` then you can do this accordingly in your **config/initializers/spree.rb** file as described below:

```ruby
Spree::SocialConfig[:path_prefix] = 'member'  # for /member/auth/:provider
Spree::SocialConfig[:path_prefix] = 'profile' # for /profile/auth/:provider
Spree::SocialConfig[:path_prefix] = ''        # for /auth/:provider
```

---


