$(document).on('turbolinks:load', function() {

  $('.dropdown-menu').on('click',  () =>{
let b = $("a[class = weekly_goal]").data();
console.log(b);
  });

});