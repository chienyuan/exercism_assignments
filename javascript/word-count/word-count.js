var workcount = function(words){
    var temp = words.toLowerCase().match(/\w+/);
    var words = new Object();
    for(var i = 0 ; i < temp.length ; i++) {
      if( words[temp[i]] == null )
         words[temp[i]] = 0;
      words[temp[i]] += 1;  
    } 
    return words;
}

module.exports = workcount;
