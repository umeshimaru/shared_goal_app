import { update_your_goal }    from "../components/shared"; 
import { checkAndCreateButton} from "../components/shared"; 
import { update_your_penalty}  from "../components/shared"; 
import { cancelEdit}           from "../components/shared"; 
import { cancelPenaltyEdit}    from "../components/shared"; 
// import { displayNone}          from "../components/shared"; 



  $(document).on('turbolinks:load', function() {
    $('.edit-button').on('click', (e) => {
                                           e.preventDefault(); 
                                           let change_goal = $(".change_goal").text();
                                           let input = $("<input>").val($(".change_goal").text());
                                           $('.change_goal').replaceWith(input);
                                           checkAndCreateButton(".monthly_goal_update",'monthly_goal_update','.monthly_goal');

      $('.monthly_goal_update').on('click', (e) => {
                                                    e.preventDefault();
                                                    update_your_goal('input');
                                                    });
      $(document).on('click', function(e) {
                                           cancelEdit(e,change_goal,input);
                                          });
                                          });

  $('.penalty_edit_button').on('click', (e) => {
                                                e.preventDefault(); 
                                                let change_penalty_name = $(".change_penalty_name").text();
                                                let penalty_input = $("<input>").val($(".change_penalty_name").text()).addClass("penalty_input");
                                                $('.change_penalty_name').replaceWith(penalty_input);
                                                checkAndCreateButton(".penalty_name_update",'penalty_name_update','.penalty');

      $(document).on('click', function(e) {
                                          cancelPenaltyEdit(e,change_penalty_name,penalty_input);
                                          });
      $('.penalty_name_update').on('click', (e) => {
                                                    e.preventDefault();
                                                    update_your_penalty('.penalty_input');
                                                  });
    });
      $('.penalty_image_edit').on('click', (e) => {
        e.preventDefault();
        $('#file-upload-form').toggle();
      
                                                     
                                                 });
      $("a[class = 'weekly_goal']").on('click',(e)=> {
                                                  
      let startDay = $(e.target).data("day");                                   
      $("#day").val(startDay);                   
    });
      $("a[class = 'task']").on('click',(e)=> {
                                                  
                                              let day = $(e.target).data("day");                                   
                                              $("#start_date").val(day);                   
    });
    $(".not-display").hide();
    $("label[class='change-color']").on('click',(e) => {
      // クリックされたラベルに赤色を設定
      $("label[class='change-color']").css('color',"black");
      $(e.target).css("color", "red");
    

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



