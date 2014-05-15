JournalApp.Views.PostForm = Backbone.View.extend({
  events: {
    'click input[type="submit"]': "submit"
  },

  template: JST['posts/form'],

  render: function () {
    var renderedContent = this.template({
      post: this.model
    });
    this.$el.html(renderedContent);

    return this;
  },

  submit: function (event) {
    event.preventDefault();

    var attrs = $(event.target.form).serializeJSON();

    function success () {
      Backbone.history.navigate("", { trigger: true });
    }

    this.model.set(attrs);
    if (this.model.isNew()) {
      this.collection.create(this.model, {
        success: success
      });
    } else {
      this.model.save({}, {
        success: success
      });
    }
  }
});