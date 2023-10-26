$(document).on('turbolinks:load', ()=> {
                                            $('#user_search').on('input',()=>{
                                              let inputUserName = $('input[type="search"]').val();
                                              let params = {
                                                            query: inputUserName
                                                            }
                                                       
                                              $.ajax({
                                                      url: '/users/search', 
                                                      dataType: "json",
                                                      data: params 
                                                    }).done(function(data){
                                                        $.each(data,(index)=>{
                                                          let user = (data[index]['name'])
                                                          
                                                          $('.find-user').after(user);

                                                        })
                                                    }).fail(function() {
                                                      alert('エラーが発生しました')  
                                                    });
                                            });




});
  