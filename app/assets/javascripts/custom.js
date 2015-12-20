$(document).ready(function(){ 
  
  function togglePolls() {
    document.getElementById("polls").classList.toggle('active');
  }


  function toggleBar(){
    console.log("hallelujah")
    document.getElementById("menu").classList.toggle('menuActive');
  }

  
  document.getElementById("pollsToggle").addEventListener("click", togglePolls, false);
  document.getElementById("menuToggle").addEventListener("click", toggleBar, false);

});