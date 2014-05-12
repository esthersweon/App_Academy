Array.prototype.uniq = function() {
  var answer = [];
  for (var i = 0; i < this.length; i++){
    if (answer.indexOf(this[i]) == -1){
      answer.push(this[i]);
    }
  }
  return answer;
}