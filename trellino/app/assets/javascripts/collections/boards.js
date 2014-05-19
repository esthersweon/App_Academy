Trellino.Collections.Boards = Backbone.Collection.extend({
	model: Trellino.Models.Board,
	url: "api/boards"
});

window.Trellino.Collections.boards = new Trellino.Collections.Boards();