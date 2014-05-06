# SQL Assessment

## Instructions

Take 25min to write SQL queries for the following questions.

Fill in the required SQL in the `lib/movie_sql.rb` file. The spec file
(run with `bundle exec rspec`) will check your work (go for the
green!). You may wish to use the command-line sqlite3 program to
interactively experiment with SQL, but this is not required. Please do
not use the internet.

Run the following script in the 01_sql directory to setup the DB:

    ./import_db.sh

If your DB gets borked somehow, you can always rerun `./import_db.sh`
to restore the DB.

In `sqlite3` you can list all tables with `.tables` and view the
database schema with `.schema`.

After 25 minutes (or upon completion), move on to the second part of
the assessment, which is on ActiveRecord. Make sure to move on after
25min so you have time for the AR part.

## Notes

0. Result ordering matters; the spec will enforce this.
0. Make sure to terminate sqlite3 commands with semicolons, otherwise
   they don't execute.
0. Ask for help if you get stuck!
0. Good luck!
