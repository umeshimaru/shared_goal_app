export function searchOtherUsers(){
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
  let searchResults = []
    $.each(data,(index)=>{
      let userName = (data[index]['name'])
      let userLink = $('<a>').text(userName).addClass("potentialUser");
      searchResults.push(userLink)
      
    }); 
    let searchResultsFromHtml = $('a.potentialUser');
    searchResultsFromHtml.remove();
    $.each(searchResults, function(index, value) {
    $('ul').append(value)
    });
  });
})


}
