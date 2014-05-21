FinalApp.Collections.Phases = Backbone.Collection.extend({
	model: FinalApp.Models.Phase,
	url: function() {
		return this.project.url() + "/phases"
	}, 
	initialize: function (models, options) {
		this.project = options.project;
	}
})