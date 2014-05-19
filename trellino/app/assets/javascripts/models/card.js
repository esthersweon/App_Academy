Trellino.Models.Card = Backbone.model.extend({
	parse: function(response) {
		var users = new Trellino.Collections.Users();
		_(response.users).each (function(user) {
			users.add(user)
		});

		response.users = users;
	}
});