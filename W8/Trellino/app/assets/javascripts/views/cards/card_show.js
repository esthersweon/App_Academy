Trellino.Views.CardShow = Backbone.CompositeView.extend({
	template: JST['cards/show'], 
	events: {
		"click button.newCard": "newCard", 
		"click button.deleteList": "deleteList"
	}, 

	initialize: function() {
		this.listenTo(this.model, "sync", this.render)
	},

	render: function() {
		var renderedContent = this.template({
			card: this.model
		});

		this.$el.html(renderedContent);

		this.attachSubviews();
		return this;
	}
});