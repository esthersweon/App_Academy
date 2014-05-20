Trellino.Routers.Boards = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  }, 

  routes: {
    "": "boardsIndex", 
    "boards/new": "boardsNew", 
    "boards/:id": "boardShow", 
    "cards": "cardsIndex"
  }, 

  boardsIndex: function () {
    var that = this; 

    Trellino.boards.fetch({
      success: function () {
        var indexView = new Trellino.Views.BoardsIndex({
          collection: Trellino.boards
        });

        that._swapView(indexView);
      }
    });
  }, 

  boardsNew: function () {
    var that = this;

    var newBoard = new Trellino.Models.Board();
    var boardView = new Trellino.Views.BoardForm({
      model: newBoard,
      collection: Trellino.boards
    });

    that._swapView(boardView);
  },

  boardShow: function (id) {
    var that = this; 
    var board = Trellino.boards.getOrFetch(id); 
    var showView = new Trellino.Views.BoardShow({
      model: board, 
      collection: board.lists(),
      members: board.get("members")
    });
    board.lists().fetch();
    that._swapView(showView);
      
  },

  _getBoard: function (id, callback) {
    var board = Trellino.boards.get(id);
    if (!board) {
      board = new Trellino.Models.Board({ id: id });
      board.collection = Trellino.boards;
      board.fetch({
        success: function () {
          Trellino.boards.add(board);
          callback(board);
        }
      });
    } else {
      callback(board);
    }
  },

  cardsIndex: function() {
    var myCardsView = new Trellino.Views.CardsUserIndex();
    this._swapView(myCardsView);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

})