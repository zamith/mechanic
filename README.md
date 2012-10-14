![engine](http://allemandindustries.com/html/images/cartoon-mechanic4.jpg) 
# Mechanic

Mechanic creates engines the Group Buddies way. It's perfect if you just want to hit the groud running and not worrying on doing those same configuration steps everytime.

Installation
------------

First install the mechanic gem:

    gem install mechanic

Then run:

    mechanic enginename --mountable
    
or

    mechanic enginename (same as --full)

This will create a Rails mountable engine in the current folder. This script creates a
new git repository. It is not meant to be used against an existing repo.

Gemfile
-------

To see the latest and greatest gems, look at Mechanic'
[templates/gemspec_additions](/zamith/mechanic/blob/master/templates/gemspec_additions),
which will be appended to the default generated projectname.gemspec.

It includes application gems like:

* [Formtastic](/justinfrench/formtastic) for form markup and style
* [SASS](/rails/sass-rails) for stylesheets

And development gems like:

* [Thin](/macournoyer/thin) for an HTTP Server
* [Capybara](/jnicklas/capybara) and
  [Capybara Webkit](/thoughtbot/capybara-webkit) for integration testing
* [Jasmine](/searls/jasmine-rails) for JS unit testing
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [Shoulda Matchers](/thoughtbot/shoulda-matchers) for common RSpec matchers
* [Timecop](/jtrupiano/timecop) for testing time

Other goodies
-------------

Mechanic also comes with:

* A few nice time formats.
* An email validator.
* A default .gitignore file.

Github
------

You can optionally create a Github repository:

    suspenders app --github organization/project

This has the same effect as running:

    hub create organization/project

Capybara Webkit
---------------

You can optionally not include Capybara Webkit (which depends on QT being
installed on your machine):

    suspenders app --webkit false

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
3. Add tests and make sure you break none
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

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
