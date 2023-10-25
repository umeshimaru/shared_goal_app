$(document).on('turbolinks:load', ()=> {
                                            $('#user_search').on('input',()=>{
                                              let inputUserName = $('input[type="search"]').val();
                                              let params = {
                                                            q: inputUserName
                                                            }
                                              $.ajax({
                                                      url: '/users/search', 
                                                      data: params 
                                                    }).done(function (data, textStatus) {
                                                     
                                                     console.log("ok");
                                                    })
                                                    .fail(function() {

                                                      console.log("エラーが発生しました。");
                                                    });
                                            });




});
  