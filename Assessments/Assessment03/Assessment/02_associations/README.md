# Hogwarts School of Witchcraft and Wizardry

We'll take **1hr 10min** for this part of the assesment.

**NB: Run `bundle install` before you get started.**

Next, set up the database:

    ./setup_db.sh

Welcome to the wizarding world. We have been tasked to develop an
application for Hogwarts that will allow them to keep track of
students, teachers, classes, houses, and wands for everybody at
Hogwarts and the other wizarding schools.

Your task today is to build the relationships between all of these
models. The database has already been setup and the models have been
annotated with their respective table schemas.

## Building Associations

The specs (`bundle exec rspec`) will guide you through building a
series of associations. Refer to the `db/schema.rb` file to find the
format of the database; this will especially help you find the name of
foreign keys.

I would start by building `has_many`, `belongs_to` and `has_one`
associations. I would later build the `has_many :through`
associations.

For any associations that requires any a non-default option, (i.e.
you have to specify `class_name`, `foreign_key`, `primary_key`, or
`source` for the association to work), please specify all options.

**Hints**

* A wizard and a wand are married one-to-one.
* There is only one table of wizards; a wizard can be either an
  instructor or a student.
