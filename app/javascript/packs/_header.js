$(document).on('turbolinks:load', ()=> {
                                            $('#user_search').on('input',()=>{
                                              let inputUserName = $('input[type="search"]').val();
                                              let params = {
                                                            key: inputUserName
                                                            };
                                                       
                                              $.ajax({
                                                      url: '/users/search', 
                                                      dataType: "json",
                                                      data: params 
                                                    }).done(function(data){
                                                      let a = []
                                                        $.each(data,(index)=>{
                                                          let userName = (data[index]['name'])
                                                          let userLink = $('<a>').text(userName).addClass("potentialUser");
                                                          a.push(userLink)
                                                          
                                                        }); 
                                                        let searchResults = $('a.potentialUser');
                                                        searchResults.remove();
                                                        $.each(a, function(index, value) {
                                                        $('ul').append(value)
                                                        });
                                                      });
});
});
                                                          // 複数要素が存在しているかつその要素のtextとuserNameが同名か確認
// 一人目のユーザーはfalseの処理に行くけど二人目以降はtrueに入るので表示されない
                                                       
                                                     
                                                    //         if ($('a.potentialUser').length  ){
                                                                
                                                    //             $('ul').append(userLink);
                                                                 
                                                    //         }
                                                    //           else{
                                                    //             $('ul').append(userLink);
                                                    //             console.log("false")
                                                               

                                                    //           }}).fail(function() {
                                                    //   alert('エラーが発生しました')  
                                                    // });
                                            