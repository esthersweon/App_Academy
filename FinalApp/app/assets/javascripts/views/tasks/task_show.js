FinalApp.Views.TaskShow = Backbone.CompositeView.extend({
	template: JST['tasks/show'], 
	events: {
		"click button.destroyTask": "destroyTask"
	}, 

	initialize: function() {
		this.listenTo(this.model, "sync remove", this.render);
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
		var that = this;
		event.preventDefault();
		this.model.destroy();
		this.model.fetch({
			success: function () {
				that.render;
			}
		});
	}
});