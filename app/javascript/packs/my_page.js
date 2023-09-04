
  $(document).on('turbolinks:load', function() {


    $('.edit-button').on('click', (e) => {
        e.preventDefault(); 
        let change_goal = ($(".change_goal").text());
        let input = $("<input>").val($(".change_goal").text());
        $('.change_goal').replaceWith(input);


    // もし更新ボタンがなければ作成。あれば何もしない
        if ($(".monthly_goal_update").length) {
                return;
        } else {
                  const button = $("<button>", {
                  text: "更新",
                  class: 'monthly_goal_update'
                  })
                  $('.monthly_goal').append(button);
                };
    
                // 2回目の編集リンククリック時の処理
    $(document).on('click', function(e) {
      if (!$(e.target).is('.monthly_goal_update,.edit-button,input')) {
        const updatedText = input.val();
        const newParagraph = $("<p>").text(updatedText).addClass("change_goal");
        input.replaceWith(newParagraph);
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

    

