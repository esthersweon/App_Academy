FinalApp.Models.Phase = Backbone.Model.extend({

	tasks: function() {
		if(!this._tasks){
			this._tasks = new FinalApp.Collections.Tasks([], {
				phase: this
			});
		}
		return this._tasks;
	},

	parse: function(response){
		if(response.tasks){
			this.tasks().set(response.tasks);
			delete response.tasks;
		}
		return response;
	}
});