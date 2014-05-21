FinalApp.Views.TaskShow = Backbone.CompositeView.extend({
	template: JST['tasks/show'], 
	events: {
		"click button.destroyTask": "destroyTask"
	}, 

	initialize: function() {
		this.listenTo(this.model, "sync", this.render)
	},

	render: function() {
		var renderedContent = this.template({
			task: this.model
		});

		this.$el.html(renderedContent);

		this.attachSubviews();
		return this;
	}, 

	destroyTask: function(event) {
		event.preventDefault();
		this.model.destroy();
	}
});