FinalApp.Views.PhasesNew = Backbone.View.extend({
	template: JST["phases/new"],

	events: {
		"click input[type='submit']": "submit"
	}, 

	initialize: function() {
		this.listenTo(this, "submit", this.render)
	}, 

	render: function() {
		var renderedContent = this.template({ 
			phase: new FinalApp.Models.Phase(),
			project: this.model
		});

		this.$el.html(renderedContent);

		return this;
	}, 

	submit: function(event) {
		event.preventDefault();

		var attrs = $(event.target.form).serializeJSON();
		var phases = this.collection;

    	this.collection.create(attrs, {
      		success: function (data) {
        		phases.add(data);
        		Backbone.history.navigate("#projects/" + phases.project.attributes.id, { trigger: true });
      		}
    	});	
	}
});