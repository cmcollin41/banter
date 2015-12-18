$(document).ready(function(){ 
  
  function togglePolls() {
    document.getElementById("polls").classList.toggle('active');
  }

  document.getElementById("pollsToggle").addEventListener("click", togglePolls, false);


});