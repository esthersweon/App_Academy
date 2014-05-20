Trellino.Views.CardsNew = Backbone.View.extend({
	template: JST['cards/new'],

	events: {
		"click input[type='submit']": "submit"
	}, 

	render: function() {
		var newCardRank = this.collection.models.length + 1;
		console.log(this.model);
		var renderedContent = this.template({
			card: new Trellino.Models.Card(),
			rank: newCardRank, 
			listID: this.model.id
		});

		this.$el.html(renderedContent);

		return this;
	}, 

	submit: function(event) {
		event.preventDefault();
		var attrs = $(event.target.form).serializeJSON;
		var cards = this.collection;
		console.log(cards);

		this.collection.create(attrs, {
			success: function(data) {
				console.log("HI HI HI");
				cards.add(data);
				Backbone.history.navigate("#boards/" + cards.list.board.attributes.id, { trigger: true });
			}
		})
	}

})