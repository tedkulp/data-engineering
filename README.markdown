# Challenge for Senior Software Engineer

## Project Description

Imagine that LivingSocial has just acquired a new company.  Unfortunately, the company
has never stored their data in a database and instead uses a plain text file.  We need
to create a way for the new subsidiary to import their data into a database.  Your task
is to create a web interface that accepts file uploads, normalizes the data, and then
stores it in a relational database.

Here's what your web-based application must do:

1. Your app must accept (via a form) a tab delimited file with the following columns: purchaser name, item description, item price, purchase count, merchant address, and merchant name.  You can assume the columns will always be in that order, that there will always be data in each column, and that there will always be a header line.  An example input file named example_input.tab is included in this repo.
1. Your app must parse the given file, normalize the data, and store the information in a relational database.
1. After upload, your application should display the total amount gross revenue represented by the uploaded file.

## OpenID Caveats

The application does use OpenID for authentication. Currently, it requires everyone
to login, but this is just used to assign a user's name to the uploaded data. It will
allow anyone with a valid OpenID to login and use the system.

## Requirements

1. Ruby 1.9 (tested with 1.9.3-p194)
1. Bundler
1. SQLite libraries (should be installed on most Linux and OS X machines already)

## Installation

1. Clone the repository: `git clone git://github.com/tedkulp/data-engineering.git`
1. Install all the required gems: `bundle install`
1. Create the SQLite database: `rake db:migrate`
1. Start up the rails server on port 3000: `rails s`
1. Point your browser to: `http://localhost:3000`

## TODO

* Add authorization. Right now, any user with an OpenID can log in
* View specs
