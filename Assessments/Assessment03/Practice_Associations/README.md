# Stock Academy

**Windows Users**: Please use one of our workstation machines for the assessments.

**NB: Run `bundle install` before you get started.**

Next, set up the database:

    ./setup_db.sh

Welcome to the finance world. We have been tasked to develop an
application for Stock Acadmey that will allow them to keep track of
users and their watchlists of companies, prices, and executives.

Your task today is to build the relationships between all of these
models. The database has already been setup and the models have been
annotated with their respective table schemas.  We've seeded your
database with some sample data (you can see them in `db/seeds.rb`).

## Assignment

The specs (`bundle exec rspec`) will guide you through building a
series of associations. Refer to the `db/schema.rb` file to find the
format of the database; this will especially help you find the name of
foreign keys.

1. **Build all possible one-step relationships between all the models
(all possible `has_many`, `belongs_to`, and `has_one` associations).**
Use meaningful names for the associations wherever possible.

  For all associations that require any change from the default, (i.e.
  you have to specify class_name, foreign_key, or primary_key for the
  association to work), please specify all 3 (class_name, foreign_key,
  and primary_key).


  Friendly notes:

  * There are exactly 17 one-step associations to be made.
  * Note that companies and boards are maried one to one

2. **Additionally, build the following associations:**

  0. Board to Members
  0. Companies to WatchLists
  0. Companies to Watchers (Users)
  0. Executives to Boards
  0. Users to watched Companies

---

**NB: In total, there should be 23 associations in your models.**

