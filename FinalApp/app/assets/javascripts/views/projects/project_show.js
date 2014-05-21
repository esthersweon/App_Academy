FinalApp.Views.ProjectShow = Backbone.CompositeView.extend({
	template: JST['projects/show'],

	events: {
		"click button.destroy": "destroyProject", 
		"click button.newPhase": "newPhase"
	},

	initialize: function() {
		this.listenTo(this.collection, "sync remove", this.render);
		this.listenTo(this.collection, "add", this.addPhase);

		var that = this;
		this.model.phases().each(function(phase){
			that.addPhase(phase);
		});
	},

	addPhase: function(phase){
		var phaseView = new FinalApp.Views.PhaseShow({
			model: phase, 
			collection: phase.tasks()
		});
		this.addSubview('#phases', phaseView);	
	},

	render: function() {
		var that = this;
		var members = this.model.get("members");
		var renderedContent = this.template({
			project: this.model, 
			members: members
		});

		this.$el.html(renderedContent);

		this.attachSubviews();

		return this;
	},

	destroyProject: function(event) {
		event.preventDefault();
		console.log(this.model);
		this.model.destroy();
		Backbone.history.navigate("", { trigger: true });
	},

	newPhase: function(event) {
    	$(event.target).toggleClass('hidden');
		var newPhaseView = new FinalApp.Views.PhasesNew({
      		model: this.model,
      		collection: this.collection
		});

		this.$el.find('#phases-new').append(newPhaseView.render().$el);
	}

});