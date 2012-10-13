![engine](http://allemandindustries.com/html/images/cartoon-mechanic4.jpg) 
# Mechanic

Mechanic creates engines the Group Buddies way. It's perfect if you just want to hit the groud running and not worrying on doing those same configuration steps everytime.

Installation
------------

Add this line to your application's Gemfile:

    gem 'mechanic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mechanic

Usage
-----

TODO: Write usage instructions here

Dependencies
------------

Some gems included in Mechanic have native extensions. You should have GCC installed on your
machine before generating an app with Mechanic.

Use [OS X GCC Installer](/kennethreitz/osx-gcc-installer/) for Snow Leopard
(OS X 10.6).

Use [Command Line Tools for XCode](https://developer.apple.com/downloads/index.action)
for Lion (OS X 10.7) or Mountain Lion (OS X 10.8).

We use [Capybara Webkit](/thoughtbot/capybara-webkit) for full-stack Javascript
integration testing. It requires QT. Instructions for installing QT are
[here](/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit).

PostgreSQL needs to be installed and running for the `db:create` rake task.

Issues
------

If you have problems, please create a [Github Issue](/zamith/mechanic/issues).

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Credits
-------

![groupbuddies](http://www.groupbuddies.com/logo.png)

Mechanic is maintained and funded by [GB - Software As A Service, Lda.](http://groupbuddies.com)

Mechanic's idea came from thoughtbot's [suspenders](/thoughtbot/suspenders), so some of the code is based
on it.

License
-------

Mechanic is Copyright © 2008-2012 Group Buddies. It is free software, and may be
redistributed under the terms specified in the LICENSE file.
