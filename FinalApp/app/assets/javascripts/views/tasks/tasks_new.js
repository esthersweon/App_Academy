FinalApp.Views.TasksNew = Backbone.View.extend({
	template: JST['tasks/new'],

	events: {
		"click input[type='submit']": "submit"
	}, 

	render: function() {
		console.log(this.model);
		var renderedContent = this.template({
			task: new FinalApp.Models.Task(),
			phaseID: this.model.id
		});

		this.$el.html(renderedContent);

		return this;
	}, 

	submit: function(event) {
		event.preventDefault();
		var attrs = $(event.target.form).serializeJSON();
		var tasks = this.collection;

		this.collection.create(attrs, {
			success: function(data) {
				console.log(tasks.phase)
				debugger;
				tasks.add(data);
				Backbone.history.navigate("#projects/" + tasks.phase.attributes.project_id, { trigger: true });
			}
		})
	}
})