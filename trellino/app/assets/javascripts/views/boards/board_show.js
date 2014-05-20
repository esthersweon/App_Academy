Trellino.Views.BoardShow = Backbone.CompositeView.extend({
	template: JST['boards/show'],

	events: {
		"click button.destroy": "destroyBoard", 
		"click button.newList": "newList",
		"click button.newBoardMember": "addMember"
	},

	initialize: function() {
		this.listenTo(this.collection, "sync remove", this.render);
		this.listenTo(this.collection, "add", this.addList);

		var that = this;
		this.model.lists().each(function(list){
			that.addList(list);
		});
	},

	addList: function(list){
		var listView = new Trellino.Views.ListShow({
			model: list, 
			collection: list.cards()
		});
		this.addSubview('#lists', listView);	
	},

	render: function() {
		var that = this;
		var members = this.model.get("members");
		var renderedContent = this.template({
			board: this.model, 
			members: members
		});

		this.$el.html(renderedContent);

		this.attachSubviews();

		return this;
	},

	destroyBoard: function(event) {
		event.preventDefault();
		console.log(this.model);
		this.model.destroy();
		Backbone.history.navigate("", { trigger: true });
	},

	newList: function(event) {
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