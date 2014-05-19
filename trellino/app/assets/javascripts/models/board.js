Trellino.Models.Board = Backbone.Model.extend({	
	urlRoot: "api/boards", 

	initialize: function () {
    	this.lists = new Trellino.Collections.Lists(this, {
    		board: this
    	})
  	}, 

  	parse: function (response) {
	    var members = new Trellino.Collections.Users();
	    _(response.members).each(function (member) {
	      members.add(member);
	    })
	    response.members = members;
	    
	    return response;
  	}
});