FinalApp.Views.ProjectsIndex = Backbone.View.extend({
	template: JST['projects/index'],

	initialize: function(options) {
		this.collection2 = options.collection2;
	},

	render: function() {
		var renderedContent = this.template({
			projects: this.collection, 
			members: this.collection2
		});

		this.$el.html(renderedContent);

		return this;
	}
})