# Assessment 4

**NB: Run `bundle exec rake aa` before you get started.**

You have **2 hours 30 minutes** for the assessment. Do not worry if
you do not complete all the assessment; finish as much as you can.

This assessment will focus on a simple CRUD app with
authentication. You will have to model users, posts, and tags, along
with session management.


Run the specs as you solve the assessment. The tests are intended to
be run in this order:

```
bundle exec rspec spec/features/auth_spec.rb
bundle exec rspec spec/features/posts_spec.rb
bundle exec rspec spec/features/tagging_spec.rb
```

If a failing spec confuses you, look at the spec file to see if you
can discern what it is asking of you. You may also wish to add
`save_and_open_page` to a spec to see what Capybara sees.

Note that a common mistake relates to capitalization; Capybara needs
to have the text of links and buttons exactly match what it expects.

As ever, please ask your TAs any questions. If you get stuck or don't
know why something is failing; ask. TAs will let you know whether they
can answer your question, so ask anything. Don't use internet or prior
notes, please.

Good luck!

## Submission

* Rename the directory `"#{first_name}-#{last_name}"`.
* ZIP it (you can use OS X's built in zip functionality)
* Use either `.tar.gz` or `.zip`; no boutique formats please :-)
* Email it to your TAs.


## Tests order

* SecureRandom::urlsafe_base64
* form_authenticity_token
* rake db:test:prepare
* password too short
* button text
* **TODO**: add test for sign-in on signup
