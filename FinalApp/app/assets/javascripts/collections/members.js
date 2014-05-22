FinalApp.Collections.Members = Backbone.Collection.extend({
	model: FinalApp.Models.Member,
	url: "api/members",
	getOrFetch: function (id) {
    	var members = this;
	    var member;
	    if (member = this.get(id)) {
	      member.fetch();
	    } else {
	      member = new FinalApp.Models.Member({ id: id });
	      member.fetch({
	        success: function () { 
	        	members.add(member);
	        }
	      });
	    }

	    return member;
  }
})