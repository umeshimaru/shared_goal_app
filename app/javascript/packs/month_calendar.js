$(document).on('turbolinks:load', function() {

  $('.weekly_goal').on('click',  () =>{
   a = $("ul[class = dropdown-menu]").data();
   console.log(a);
  });
});