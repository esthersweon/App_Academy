Trellino.Views.BoardsIndex = Backbone.View.extend({
	template: JST['boards/index'],

	render: function() {
		var renderedContent = this.template({
			boards: this.collection
		});

		this.$el.html(renderedContent);

		return this;
	}
})