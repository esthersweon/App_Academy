FinalApp.Routers.Projects = Backbone.Router.extend({
	initialize: function (options) {
		this.projects = options.projects;
		this.$rootEl = options.$rootEl;
	}, 

	routes: {
		"": "projectsIndex", 
		"projects/new": "projectsNew", 
		"projects/:id": "projectShow"
	}, 

	projectsIndex: function() {
		var that = this; 

		this.projects.fetch({
			success: function () {
				var indexView = new FinalApp.Views.ProjectsIndex({
					collection: that.projects 
				});

				that._swapView(indexView);
			}
		});
	}, 

	projectsNew: function() {
		var that = this;

		var newProject = new FinalApp.Models.Project();
		var projectView = new FinalApp.Views.ProjectForm({
			model: newProject,
			collection: this.projects 
		});

		that._swapView(projectView);
	},

	projectShow: function(id) {
		var that = this; 
		var project = this.projects.getOrFetch(id);
		var showView = new FinalApp.Views.ProjectShow({
			model: project,
			collection: project.phases()
		});
		project.phases().fetch();
		that._swapView(showView);
	},

	_swapView: function(view) {
		this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
	}
})