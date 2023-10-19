import { update_your_goal }           from "../components/shared"; 
import { checkAndCreateButton}        from "../components/shared"; 
import { update_your_penalty}         from "../components/shared"; 
import { cancelEdit}                  from "../components/shared"; 
import { cancelPenaltyEdit}           from "../components/shared"; 
import { cancelWeeklyGoalEdit}        from "../components/shared"; 
import { update_your_weekly_goal}     from "../components/shared"; 
import { checkAndCreateUpdateButton}  from "../components/shared"; 
// import { displayNone}          from "../components/shared"; 




  $(document).on('turbolinks:load', function() {
    
    $('.edit_button').on('click', (e) => {
                                           e.preventDefault();
                                           
                                           let change_goal = $(".change_goal").text();
                                           let input = $("<input>").val($(change_goal).text());
                                           $(".change_goal").replaceWith(input);
                                           checkAndCreateButton(".monthly_goal_update",'monthly_goal_update','.monthly_goal');
                                           
       $(document).on('click', function(e) {
                                            
                                            cancelEdit(e,change_goal,input);
                                            });
      $('.monthly_goal_update').on('click', (e) => {
                                                    e.preventDefault();
                                                    ;
                                                    update_your_goal('input');
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

    $( document).on('click', '[class^="weekly_goal_edit_"]', (e) => {
 
                                                e.preventDefault(); 
                                                e.stopPropagation();
                                                // 編集ボタンのカスタムデータ属性取得
                                               let weekly_goal_id = $(e.target).data("id");
                                                
                                                
                                              // 週間目標達成日取得
                                                let custom_date_data = $(".weekly_goal_display_"+weekly_goal_id).data("date");
                                                
                                                // 週間目標取得
                                                let custom_content_data = $(".weekly_goal_display_" + weekly_goal_id).data('content');
                                                
                                              //  変更前の週間目標
                                                let change_weekly_goal = $(".weekly_goal_display_" + weekly_goal_id).text();
                                                
                                                
                                                let weekly_input = $("<input>").addClass("weekly_input");

                                                
                                                $(".weekly_goal_display_" + weekly_goal_id).replaceWith(weekly_input);
                                                
                                                checkAndCreateUpdateButton(".weekly_goal_update",'weekly_goal_update',weekly_goal_id); 
                                                

                                            

$(document).on('click', function(e) {      
                                      e.preventDefault(); 
                                      e.stopPropagation();
                                    
                                      cancelWeeklyGoalEdit(e,change_weekly_goal,weekly_input,weekly_goal_id);
                                      
                                      });
// $('.weekly_goal_update').on('click', (e) => {
//                                               e.preventDefault();
//                                               e.stopPropagation();
//                                               update_your_weekly_goal('input[class = "weekly_input"]',custom_content_data,custom_date_data);
//                                         });

      });




 
});
  






