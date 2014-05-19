Trellino.Views.ListShow = Backbone.CompositeView.extend({
	template: JST['lists/show'], 
	events: {
		"click button.newCard": "newCard", 
		"click button.destroyList": "destroyList"
	}, 

	initialize: function() {
		this.listenTo(this.model.cards(), "sync", this.render);
		this.listenTo(this.model.cards(), "add", this.addCard); 

		var that = this;
		this.model.cards().each (function(card) {
			that.addCard(card);
		})
	},

	addCard: function(card) {
		var cardView = new Trellino.Views.CardShow({model: card});
		this.addSubview('#cards', cardView);	
	},

	render: function() {
		var renderedContent = this.template({
			list: this.model, 
			cards: this.model.cards()
		});

		this.$el.html(renderedContent);

		this.attachSubviews();
		return this;
	},

	newCard: function(event) {
		$(event.target).toggleClass('hidden');
		var newCardView = new Trellino.Views.CardsNew({
			model: this.model,
			collection: this.model.cards()
		});

		this.$el.find('#cards-new').append(newCardView.render().$el);
	}, 

	destroyList: function(event) {
		debugger;
		event.preventDefault();
		this.model.destroy();
		Backbone.history.navigate("boards/" + this.model.parent().id, { trigger: true });
	}
});