FinalApp.Routers.Projects = Backbone.Router.extend({
	initialize: function (options) {
		this.projects = options.projects;
		this.members = options.members;
		this.$rootEl = options.$rootEl;
	}, 

	routes: {
		"": "projectsIndex", 
		"projects/new": "projectsNew", 
		"projects/:id": "projectShow", 
		"members/new": "membersNew", 
		"members/:id": "memberShow"
	}, 

	projectsIndex: function() {
		var that = this;
		
		this.members.fetch({
			success: function() {
				that.projects.fetch({
					success: function () {
						var indexView = new FinalApp.Views.ProjectsIndex({
							collection: that.projects, 
							collection2: that.members
						});

					that._swapView(indexView);
					}
				});
			}
		});

		
	}, 

	projectsNew: function() {
		var newProject = new FinalApp.Models.Project();
		var projectView = new FinalApp.Views.ProjectForm({
			model: newProject,
			collection: this.projects 
		});

		this._swapView(projectView);
	},

	projectShow: function(id) {
		var project = this.projects.getOrFetch(id);
		var showView = new FinalApp.Views.ProjectShow({
			model: project,
			collection: project.phases()
		});
		project.phases().fetch();
		this._swapView(showView);
	},

	membersNew: function() {
		var newMember = new FinalApp.Models.Member();
		var memberView = new FinalApp.Views.MemberForm({
			model: newMember, 
			collection: this.members
		});

		this._swapView(memberView);
	},

	memberShow: function(id) {
		var member = this.members.getOrFetch(id);
		var memberShowView = new FinalApp.Views.MemberShow({
			model: member
		});
		this._swapView(memberShowView);
	},

	_swapView: function(view) {
		this._currentView && this._currentView.remove();
    	this._currentView = view;
    	this.$rootEl.html(view.render().$el);
	}
})