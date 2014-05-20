Trellino.Views.ListsNew = Backbone.View.extend({
	template: JST["lists/new"], 

	events: {
    	"click input[type='submit']": "submit"
  	},

  	initialize: function() {
		this.listenTo(this, "submit", this.render)
	},

	render: function() {
		var newListRank = this.model.lists.length + 1;
		var renderedContent = this.template({ 
			list: new Trellino.Models.List(),
			rank: newListRank, 
			board: this.model
		});

		this.$el.html(renderedContent);

		return this;
	}, 

	submit: function(event) {
		event.preventDefault();

		var attrs = $(event.target.form).serializeJSON();
		var lists = this.collection;

    	this.collection.create(attrs, {
      		success: function (data) {
        		lists.add(data);
        		Backbone.history.navigate("#boards/" + lists.board.attributes.id, { trigger: true });
      		}
    	});	
    }

});