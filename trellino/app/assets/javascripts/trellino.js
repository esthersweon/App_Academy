window.Trellino = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {    
    
    Trellino.boards = new Trellino.Collections.Boards();
    
    // Trellino.lists = new Trellino.Collections.Lists();
    
    // Trellino.cards = new Trellino.Collections.Cards();
    
    // Trellino.boards.each(function (board) {
    //   board.lists.add(Trellino.lists.where({board_id: board.id}));
    // })
    
    // Trellino.lists.each(function (list) {
    //   list.cards.add(Trellino.cards.where({list_id: list.id}));
    // })
    

    Trellino.boardsRouter = new Trellino.Routers.Boards({
      $rootEl: $('#content')
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Trellino.initialize();
});