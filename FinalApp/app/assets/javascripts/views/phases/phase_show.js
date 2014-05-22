FinalApp.Views.PhaseShow = Backbone.CompositeView.extend({
	template: JST['phases/show'], 
	events: {
		"click button.newTask": "newTask", 
		"click button.destroyPhase": "destroyPhase"
	}, 

	initialize: function() {
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.collection, "sync remove", this.render);
		this.listenTo(this.collection, "add", this.addTask); 
		this.listenTo(this, "addTask", this.render)
		this.collection.fetch();
	},

	addTask: function(task) {
		var taskView = new FinalApp.Views.TaskShow({
			model: task, 
		});
		this.addSubview('#tasks', taskView);	
	},

	render: function() {
		var renderedContent = this.template({
			phase: this.model, 
			tasks: this.model.tasks()
		});

		this.$el.html(renderedContent);

		this.attachSubviews();

		return this;
	},

	newTask: function(event) {
		$(event.target).toggleClass('hidden');
		var newTaskView = new FinalApp.Views.TasksNew({
			model: this.model,
			collection: this.model.tasks()
		});

		this.$el.find('#tasks-new').append(newTaskView.render().$el);
	}, 

	destroyPhase: function(event) {
		event.preventDefault();
		this.model.destroy();
	}
});