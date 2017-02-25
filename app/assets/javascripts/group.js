$(function(){
  $("#js-user-search-field").on("keyup", function(e){
    e.preventDefault();
    sendInAjax();
    return false;
  });


    function sendInAjax(){
      var input = $.trim($("#js-user-search-field").val());
      $.ajax({
        url: '/users/search',
        type: 'GET',
        data: {
          name: input
        },
        dataType: 'json'
      })
      .done(function(data){
        appendUsers(data);
      })
      .fail(function(data){
        alert("グループを作成してください。");

      });
    }

    function appendUsers(data){
      if(data.length !== 0){
        $.each(data, function(i, user){ //バッククォートで囲ってあげることによって式展開することができる！
          var html = `<li id="user-search-result-${i}", class="chat-group-user">
                        <div class="chat-group-user__name">
                          ${ user.name }
                        </div>
                        <div class="chat-group-user__btn">
                          <div class="chat-group-user__btn--add", id="add-button-${i}">
                            追加
                          </div>
                        </div>
                      </li>`;
          $(".js-chat-group-list").append(html);
          addUsers(i, user, html);
           //一個一個のhtmlにfunctionを設定、追加ボタンを押すと下のメンバーの欄に追加された、この欄のリストから、削除される実装！
        });
      }
    }

     function addUsers(i, user, html){
        $(`#add-button-${i}`).on("click", function(){
          var usersHtml = `<div class="chat-group-user clearfix", id="chat-group-users-${i}">
                            <input id="users-value", type="hidden", name="group[user_ids][]", value="${user.id}">
                            </input>
                              <span class="chat-group-user_name">
                               ${ user.name }
                              </span>
                             <div class="chat-group-user__btn">
                               <div class="chat-group-user__btn--remove", id="button-${i}">
                                削除
                               </div>
                             </div>
                           </div>`
          $("#chat-group-users").append(usersHtml);
          $(`#user-search-result-${i}`).remove();
          removeUsers(i, user, html);
        });
      }
      // 追加ボタンを押すと、user_idsという配列に押したボタンのuse.idを追加して、削除ボタンを押すと、配列からそのuser.idを削除する。

      function removeUsers(i, user, html){
        $(`#button-${i}`).on("click", function(){
          console.log(`${i}`);
          $(`#chat-group-users-${i}`).remove();
          $(".js-chat-group-list").append(html);
          addUsers(i, user);
        });
      }
});








