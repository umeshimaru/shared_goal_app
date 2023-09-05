 export function editInput(){
                                    let change_goal = ($(".change_goal").text());
                                    let input = $("<input>").val($(".change_goal").text());
                                    $('.change_goal').replaceWith(input);
                                    }