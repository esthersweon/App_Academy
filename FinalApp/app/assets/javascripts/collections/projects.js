FinalApp.Collections.Projects = Backbone.Collection.extend({
	model: FinalApp.Models.Project,
	url: "api/projects",
	getOrFetch: function (id) {
    	var projects = this;
	    var project;
	    if (project = this.get(id)) {
	      project.fetch();
	    } else {
	      project = new FinalApp.Models.Project({ id: id });
	      project.fetch({
	        success: function () { 
	        	projects.add(project);
	        }
	      });
	    }

	    return project;
  }
})