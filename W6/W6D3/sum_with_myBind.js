var sum = function() {
  var sum = 0;
  for(var i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
};

Function.prototype.myBind = function(object) {
  var f = this;
  //take off object; leave just the arguments
  var args = Array.prototype.slice.call(arguments, 1);

  return function () {
    var otherArgs = Array.prototype.slice.call(arguments);
    return f.apply(object, args.concat(otherArgs));
  }
};



//to test the myBind function on an unrelated object

function myObject(name) {
  this.name = name;
};

var mySum = function() {
  var sum = 0;
  for(var i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  console.log(sum);
};

var bob = new myObject("bob");

//bob.mySum(1, 2);
var myBoundFunction = mySum.myBind(bob, 1, 2);

//bob.mySum(1, 2, 3);
myBoundFunction(3);