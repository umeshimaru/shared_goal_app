export function changeMonthlyGoal(){
                                      const idNumber = 2;
                                      let currentURL = location.href;
                                      let path = new URL(currentURL).pathname;
                                      let path_array = path.split('/');
                                      let id = path_array[idNumber]
                                      let inputValue = $('input').val();

                                      $.ajax({
                                        type: 'PATCH', 
                                        url: `/monthly_goals/${id}`, 
                                        data: { // サーバーへ送信するデータ
                                                monthly_goal: { monthly_goal: inputValue }
                                              }
                                              }).done(function() {
            
            
                                              }).fail(function() {
            
                                              });
                                    }



 export function checkAndCreateButton(updateButton,cssClass,section){
                                        if ($(updateButton).length) {
                                          return;
                                        } else {
                                          const button = $("<button>", {
                                          text:  '更新',
                                          class: cssClass

                                          })
                                          $(section).append(button);
    
                                        };
                                        }

 export function cancelEdit(e,change_goal,input){
                                                  if (!$(e.target).is('.monthly_goal_update,.edit-button,input')) {
                                                  let monthly_goal = $("<p>").text(change_goal).addClass("change_goal");
                                                  input.replaceWith(monthly_goal);
                                                  $('.monthly_goal_update').remove();
                                                 };}

 export function cancelPenaltyEdit(e,change_panalty_name,penalty_input){
                                                  if (!$(e.target).is('.penalty_name_update,.penalty_edit_button,penalty_input')) {
                                                  let penalty_name = $("<p>").text(change_panalty_name).addClass("change_penalty_name");
                                                  penalty_input.replaceWith(penalty_name);
                                                  $('.penalty_name_update').remove();
                                                 };}