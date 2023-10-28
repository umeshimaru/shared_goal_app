$(document).on('turbolinks:load', ()=> {
                                            $('#user_search').on('input',()=>{
                                              let inputUserName = $('input[type="search"]').val();
                                              let params = {
                                                            key: inputUserName
                                                            }
                                                       
                                              $.ajax({
                                                      url: '/users/search', 
                                                      dataType: "json",
                                                      data: params 
                                                    }).done(function(data){
                                                        $.each(data,(index)=>{
                                                          let userName = (data[index]['name'])
                                                          let userLink = $('<a>').text(userName).addClass("potentialUser");
                                                          // 複数要素が存在しているかつその要素のtextとuserNameが同名か確認

                                                            if ($('.potentialUser').length ){
                                                                $('.potentialUser').each(()=>{
                                                                  console.log($(this).text())
                                                              })

                                                              
                                                              }else{
                                                                $('ul').append(userLink);

                                                              }

                                                            
                                                          

                                                        })
                                                    }).fail(function() {
                                                      alert('エラーが発生しました')  
                                                    });
                                            });




});
  