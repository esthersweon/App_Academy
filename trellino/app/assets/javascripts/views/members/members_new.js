Trellino.Views.MembersNew = Backbone.View.extend({
	template: JST["members/new"], 

	events: {
    	"click input[type='submit']": "add"
  	},

  	initialize: function() {
		this.listenTo(this, "submit", this.render)
	},

	render: function() {
		var renderedContent = this.template({ 
			member: new Trellino.Models.User()
		});

		this.$el.html(renderedContent);

		return this;
	}, 

	add: function(event) {
		var that = this;
		event.preventDefault();
		var newMemberEmail = $(event.target.form).serializeJSON().member_email;
    	this.model.save({ 'newMemberEmail': newMemberEmail });
		this.collection.trigger('add');
	}

});