Trellino.Views.BoardForm = Backbone.View.extend({
	events: {
		'click input[type="submit"]': "submit"
	}, 

	template: JST['boards/form'],

	render: function () {
		var renderedContent = this.template({
			board: this.model
		});

		this.$el.html(renderedContent);

		return this;
	}, 

	submit: function(event) {
		event.preventDefault();
    	var attrs = $(event.target.form).serializeJSON();

    	var newBoard = this.collection.create(attrs, {
    		success: function(savedBoard) {
    			Backbone.history.navigate("#boards/" + savedBoard.id, { trigger: true });
    		}
    });

	}
});