window.JournalApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    JournalApp.posts = new JournalApp.Collections.Posts();

    new JournalApp.Routers.Posts({
      "$rootEl": $("#content")
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  JournalApp.initialize();
});