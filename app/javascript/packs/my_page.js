import { changeMonthlyGoal }   from "../components/shared"; 
import { checkAndCreateButton} from "../components/shared"; 
import { cancelEdit}           from "../components/shared"; 
import { cancelPenaltyEdit}    from "../components/shared"; 

  $(document).on('turbolinks:load', function() {
    $('.edit-button').on('click', (e) => {
                                           e.preventDefault(); 
                                           let change_goal = $(".change_goal").text();
                                           let input = $("<input>").val($(".change_goal").text());
                                           $('.change_goal').replaceWith(input);
                                           checkAndCreateButton(".monthly_goal_update",'monthly_goal_update','.monthly_goal');

                                           $('.monthly_goal_update').on('click', (e) => {
                                                                                         e.preventDefault();
                                                                                         changeMonthlyGoal();
                                                                                         });
                                           $(document).on('click', function(e) {
                                                                                cancelEdit(e,change_goal,input);
    });
  });
    $('.penalty_edit_button').on('click', (e) => {
      e.preventDefault(); 
      let change_panalty_name = $(".change_penalty_name").text();
      let penalty_input = $("<input>").val($(".change_penalty_name").text());
      $('.change_penalty_name').replaceWith(penalty_input);
      checkAndCreateButton(".penalty_name_update",'penalty_name_update','.penalty');
      $(document).on('click', function(e) {
       cancelPenaltyEdit(e,change_panalty_name,penalty_input);

       
       
     




});
  });
});
  
// let element = $(e.target);
// if (!element.is(".monthly_goal_update")) {
//   $("monthly_goal_update").remove();
//   $('input').replaceWith(".change_goal");

// $(document).on('click', (e) => {
//   let target = $(e.target)
//   if (target.is(".monthly_goal_update")){
//     console.log("更新")

//   }else{
//     console.log("更新ボタン以外")
//   }  
// });

