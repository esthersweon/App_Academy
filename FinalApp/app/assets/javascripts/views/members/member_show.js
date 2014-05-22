FinalApp.Views.MemberShow = Backbone.CompositeView.extend({
	template: JST['members/show'],

	events: {
		"click button.destroyMember": "destroyMember"
	},

	initialize: function() {
		this.listenTo(this.model, "sync remove", this.render);
	},

	render: function() {
		var renderedContent = this.template({
			member: this.model
		});

		this.$el.html(renderedContent);

		return this;
	},

	destroyMember: function(event) {
		event.preventDefault();
		console.log(this.model);
		this.model.destroy();
		Backbone.history.navigate("", { trigger: true });
	}

});