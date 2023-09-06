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



 export function checkAndCreateButton(){
                                        if ($(".monthly_goal_update").length) {
                                          return;
                                        } else {
                                          const button = $("<button>", {
                                          text:  '更新',
                                          class: 'monthly_goal_update'

                                          })
                                          $('.monthly_goal').append(button);
    
                                        };
                                        }

 export function cancelEdit(e,change_goal,input){
                              if (!$(e.target).is('.monthly_goal_update,.edit-button,input')) {
                              let monthly_goal = $("<p>").text(change_goal).addClass("change_goal");
                              input.replaceWith(monthly_goal);
                              $('.monthly_goal_update').remove();
                              };}