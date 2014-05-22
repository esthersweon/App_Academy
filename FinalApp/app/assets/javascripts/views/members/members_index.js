FinalApp.Views.MembersIndex = Backbone.View.extend({
	template: JST['members/index'],

	render: function() {
		var renderedContent = this.template({
			members: this.collection
		});

		this.$el.html(renderedContent);

		return this;
	}
})