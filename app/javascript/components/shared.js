export function update_your_goal(input) {
                                      const idNumber = 2;
                                      let currentURL = location.href;
                                      let path = new URL(currentURL).pathname;
                                      let path_array = path.split('/');
                                      let id = path_array[idNumber]
                                      let inputValue = $(input).val();

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
export function update_your_penalty(input) {
                                      const idNumber = 2;
                                      let currentURL = location.href;
                                      let path = new URL(currentURL).pathname;
                                      let path_array = path.split('/');
                                      let id = path_array[idNumber]
                                      let inputValue = $(input).val();

                                      $.ajax({
                                        type: 'PATCH', 
                                        url: `/monthly_goals/${id}`, 
                                        data: { // サーバーへ送信するデータ
                                                monthly_goal: { penalty_name: inputValue }
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
                                                  
                                                  if (!$(e.target).is('.monthly_goal_update,.edit_button,input')) {
                                                  let monthly_goal = $("<p>").text(change_goal).addClass("change_goal");
                                                  input.replaceWith(monthly_goal);
                                                  $('.monthly_goal_update').remove();
                                                 };}

 export function cancelPenaltyEdit(e,change_penalty_name,penalty_input){
                                                  if (!$(e.target).is('.penalty_name_update,.penalty_edit_button,.penalty_input')) {
                                                  let penalty_name = $("<p>").text(change_penalty_name).addClass("change_penalty_name");
                                                  penalty_input.replaceWith(penalty_name);
                                                  $('.penalty_name_update').remove();
                                                 };}
 export function changeHtmlToInputElement(e,your_goal){
                                                    e.preventDefault();
                                                    let change_goal = $(your_goal).text();
                                                    let input = $("<input>").val($(your_goal).text());
                                                    $(your_goal).replaceWith(input);
                                                 };

export function cancelWeeklyGoalEdit(e,change_goal,input){
                                                  
                                                          if (!$(e.target).is('.weekly_goal_update,.weekly_goal_edit,weekly_input')) {
                                                          let monthly_goal = $("<p>").text(change_goal).addClass("weekly_goal_link");
                                                          input.replaceWith(monthly_goal);
                                                          $('.weekly_goal_update').remove();
                                                 };}
                                                
                                                

//  export function displayNone(e){
//                               if (!$(e.target).is('.penalty_name_update,.penalty_edit_button,.penalty_input')) {
//                                 $('#file-upload-form').hide();
                              
//                                 };}


 // penalty_name_update ＝ ペナルティの名前の更新ボタンのcssのクラス
// change_panalty_name = pタグの中身
// penalty_input = pタグの中身の入ったinput
// penalty_edit_button 編集ボタン