FinalApp.Models.Project = Backbone.Model.extend({
	urlRoot: "api/projects", 

	phases: function() {
		if(!this._phases){
			this._phases = new FinalApp.Collections.Phases([], {
				project: this
			});
		}
		return this._phases;
	}, 

	parse: function(response) {
		if(response.phases){
			this.phases().set(response.phases, {parse: true});
			delete response.phases;
		}
		return response;
	}
})