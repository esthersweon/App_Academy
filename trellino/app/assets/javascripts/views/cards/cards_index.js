Trellino.Views.CardsIndex = Backbone.View.extend({

	initialize: function() {
		this.listenTo(this.collection, 'add', this.render),
		this.listenTo(this.collection, 'remove', this.render)
	},

	events: {
		"click button.addCard": "addCard"
	},

	template: JST['cards/index'],

  render: function () {
    var that = this;
    var renderedContent = this.template({
      cards: this.collection,
      list: this.model
    });
    this.$el.html(renderedContent);
    
    return this;
  }, 

  addCard: function() {
    var newCardView = new Trellino.Views.CardNew({
      collection: that.model.cards,
      model: that.model
    });
    this.$('ul.card_list').append(newCardView.render().$el);
  }

});