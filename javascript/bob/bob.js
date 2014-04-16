var Bob = function(){
  this.hey = function(words){
    if( /^\s*$/.test(words))
      return 'Fine. Be that way!';
    else if(words == words.toUpperCase() && /[A-Z]/.test(words) )
      return 'Woah, chill out!';
    else if(/\?$/.test(words))
      return 'Sure.';
    else 
      return 'Whatever.';
  };
};

module.exports = Bob;
