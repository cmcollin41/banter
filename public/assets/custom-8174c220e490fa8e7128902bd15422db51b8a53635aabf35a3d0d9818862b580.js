$(document).ready(function(){ 
  
  function togglePolls() {
    document.getElementById("polls").classList.toggle('active');
  }


  function toggleBar(){
    document.getElementById("menu").classList.toggle('menuActive');
  }
  
  document.getElementById("menuToggle").addEventListener("click", toggleBar, false);
  document.getElementById("pollsToggle").addEventListener("click", togglePolls, false);

});
