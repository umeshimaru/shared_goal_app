
  $(document).on('turbolinks:load', function() {
    $('.edit-button').on('click', (e) => {
        e.preventDefault(); 
        let textarea = $("<textarea>").val($(".change_goal").text());
        const button = $("<button>", {
          text: "更新",
          data: { action: "update", controller: "monthly_goals" }
        });
        $('.monthly_goal').append(button);
        // $(".change_goal").replaceWith(textarea);

        


    });
    
});
