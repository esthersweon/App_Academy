JournalApp.Routers.Posts = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "index",
    "posts/:id": "show",
    "posts/new": "new"
  },

  index: function () {
    var that = this;

    JournalApp.posts.fetch({
      success: function () {
        var indexView = new JournalApp.Views.PostsIndex({
          collection: JournalApp.posts
        });

        that._swapView(indexView);
      }
    });
  },

  new: function () {
    var that = this;

    var newPost = new JournalApp.Models.Post();
    var formView = new JournalApp.Views.PostForm({
      collection: JournalApp.posts,
      model: newPost
    });

    that._swapView(formView);
  },

  show: function (id) {
    var that = this;

    that._getPost(id, function (post) {
      var formView = new JournalApp.Views.PostForm({
        model: post
      });

      that._swapView(formView);
    });
  },

  _getPost: function (id, callback) {
    var post = JournalApp.posts.get(id);
    if (!post) {
      post = new JournalApp.Models.Post({ id: id });
      post.collection = JournalApp.posts;
      post.fetch({
        success: function () {
          JournalApp.posts.add(post);
          callback(post);
        }
      });
    } else {
      callback(post);
    }
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currenView = view;
    this.$rootEl.html(view.render().$el);
  }
});