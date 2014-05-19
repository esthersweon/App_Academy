Trellino.Views.CardsNew = Backbone.View.extend({
	events: {
		"click input[type='submit']": "submit"
	}, 

	template: JST['cards/new'],

	render: function() {
		var newCardRank = this.collection.models.length + 1;
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
		this.collection.create(attrs, {
			success: function(data) {
				Trellino.cards.add(data);
			}
		})
	}

})