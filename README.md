InstantSpin
====

Combined ([spin](https://github.com/thedarkone/rails-dev-boost)) with ([rails-dev-boost](https://github.com/thedarkone/rails-dev-boost)) for (nearly) instant test starts. Also added ([growl](https://github.com/visionmedia/growl)) for notifications.

This setup works great for me with unit and functional tests (Test::Unit / MinitTest).

Compare the execution times of a simple functional test (rails 3.1 and ruby 1.9.3):

``` bash
#Test Time:
1.270169 seconds

# Total execution time with instantspin
2.755599 seconds

# Total execution time with plain spin
14.565113 seconds

# Total execution time (ruby -Itest ...)
20.771 seconds
```

Installation
===========

Rails
====

``` ruby
#Gemfile
group :development, :test do
  gem 'rails-dev-boost', :git => 'git://github.com/thedarkone/rails-dev-boost.git', :require => 'rails_development_boost'
end

group :development do
  gem "instantspin", :git => "git://github.com/skorfmann/spin.git"
end

```
Add config for rails-dev-boost but only if run via spin

``` ruby
#config/environments/test.rb
if $instantspin
  config.cache_classes = false
  config.soft_reload = true
else
  config.cache_classes = true
end
```

Ensure that ActiveRecord has an active connection

``` ruby
#test/test_helper.rb
ActiveRecord::Base.connection.reconnect!() if $instantspin
```

Done.

Usage
=====

There are two components to Spin, a server and client. The server has to be running for anything interesting to happen. You can start the Spin server from your `Rails.root` with the following command:

``` bash
bundle exec instantspin serve
```

As soon as the server is running it will be ready to accept from clients. You can use the following command to specify a file for the server to load:

``` bash
bundle exec instantspin push test/unit/product_test.rb
```

Or push multiple files to be loaded at once:

``` bash
bundle exec instantspin push test/unit/product_test.rb test/unit/shop_test.rb test/unit/cart_test.rb
```

If you experience issues with `test_helper.rb` not being available you may need to add your test directory to the load path using the `-I` option:

``` bash
bundle exec instantspin serve -Itest
```

Send a SIGQUIT to spin serve (`Ctrl+\`) if you want to re-run the last files that were ran via `spin push [files]`.

### With Kicker

As mentioned, this tool works best with an autotest(ish) workflow. I haven't actually used with with `autotest` itself, but it works great with [kicker](http://github.com/alloy/kicker). Here's the suggested workflow for a Rails app:

1. Start up the spin server

    ``` bash
    bundle exec instantspin serve
    ```

2. Start up `kicker` using the custom binary option (and any other options you want)

    ``` bash
    kicker -r rails -b 'spin push'
    ```

3. Faster testing workflow!

Motivation
==========

Easy solution for really fast test startup times!!!

Hacking
=======

I take pull requests, and it's commit bit, and there are no tests.

Related Projects
===============

If Spin isn't scratching your itch then one of these projects might:

* [guard-spin](https://github.com/vizjerai/guard-spin)
* [Spork](https://github.com/sporkrb/spork)
* [TestR](https://github.com/sunaku/testr)

