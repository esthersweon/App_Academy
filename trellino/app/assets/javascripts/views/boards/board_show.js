Trellino.Views.BoardShow = Backbone.View.extend({
	template: JST['boards/show'],

	events: {
		"click button.destroy": "destroyBoard", 
		"click button.newList": "addList",
		"click button.newBoardMember": "addMember", 
		"click button.newCard": "addCard"
	},

	initialize: function() {
		this.listenTo(this.collection, "add", this.render);
		this.listenTo(this, "addList", this.render)
	},

	render: function() {
		var members = this.model.get("members");
		console.log(members);
		var renderedContent = this.template({
			board: this.model, 
			lists: this.collection.fetch(), 
			members: members
		});

		this.$el.html(renderedContent);

		return this;
	},

	destroyBoard: function(event) {
		event.preventDefault();
		this.model.destroy();
		Backbone.history.navigate("", { trigger: true });
	},

	addList: function(event) {
    	$(event.target).toggleClass('hidden');
		var newListView = new Trellino.Views.ListsNew({
      		model: this.model,
      		collection: this.collection
		});

		this.$el.find('#lists-new').append(newListView.render().$el);
	},

	addMember: function(event) {
		$(event.target).toggleClass('hidden');
		var newBoardMemberView = new Trellino.Views.MembersNew({
			model: this.model,
			collection: this.collection
		});

		this.$el.find('#boardmembers-new').append(newBoardMemberView.render().$el);
	}

});