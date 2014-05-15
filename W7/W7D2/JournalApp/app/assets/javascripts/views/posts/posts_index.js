JournalApp.Views.PostsIndex = Backbone.View.extend({
  events: {
    "click .delete": "destroyPost"
  },

  template: JST['posts/index'],

  initialize: function () {
    var that = this;
    this.listenTo(this.collection, "change:title remove reset", this.render);
    this.listenTo(this.collection, "add", this.renderSingleModel);
  },

  destroyPost: function (event) {
    var $target = $(event.target);
    var post = this.collection.get($target.attr("data-id"));

    post.destroy();
  },

  render: function () {
    var renderedContent = this.template({
      posts: this.collection
    });

    this.$el.html(renderedContent);

    return this;
  },

  renderSingleModel: function (model) {
    var view = new JournalApp.Views.PostShow({ model: model });
    this.$el.append(view.render().$el);
  }
});