import { editInput } from "./components/shared";
  $(document).on('turbolinks:load', function() {


    $('.edit-button').on('click', (e) => {

        e.preventDefault(); 

       
        editInput();


    // もし更新ボタンがなければ作成。あれば何もしない
        if ($(".monthly_goal_update").length) {
                return;
        } else {
                  const button = $("<button>", {
                  text:  '更新',
                  class: 'monthly_goal_update'
      
                  })
                  $('.monthly_goal').append(button);
                
                };


                $('.monthly_goal_update').on('click', (e) => {
                  e.preventDefault();
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
                            // 成功した時の処理
                            
                          }).fail(function() {
                            // 失敗した時の処理
                          });


              


                })

              
                // 2回目の編集リンククリック時の処理 ①インプット要素をpタグに戻す。更新ボタンの削除
    $(document).on('click', function(e) {
      if (!$(e.target).is('.monthly_goal_update,.edit-button,input')) {

=======
                // $('.monthly_goal_update').on('click', (e) => {
                //   e.preventDefault();
                //   const idNumber = 2;
                //   let currentURL = location.href;
                //   let path = new URL(currentURL).pathname;
                //   let path_array = path.split('/');
                //   let id = path_array[idNumber]
                //   let inputValue = $('input').val();

                  // $.ajax({
                  //   type: 'PATCH', 
                  //   url: `monthly_goals/${id}`, 
                  //   data: { // サーバーへ送信するデータ
                  //          monthly_goal: inputValue
                  //         }
                  //         }).done(function() {
                            
                  //         }).fail(function(result) {
                  // // 失敗処理
                  //         });


              


                // })

              
                // 2回目の編集リンククリック時の処理 ①インプット要素をpタグに戻す。更新ボタンの削除


        let monthly_goal = $("<p>").text(change_goal).addClass("change_goal");
        input.replaceWith(monthly_goal);
        $('.monthly_goal_update').remove();
      }
    });

  });
    

    // $('.edit-button').on('click', () => {

    // });


     
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

