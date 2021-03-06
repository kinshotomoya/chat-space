$(document).on('turbolinks:load', function(){
//ページ変移した時に、リロードしなくてもJSが読み込まれるように！gemにtrbokinlsがデフォルトで書かれているので、
//ページ変移した時にこのように書くことで、このファイルがtyなんと読み込まれる！
  function searchUsersAjax(list, preInput){
    var input = $.trim($("#js-user-search-field").val());
    if(input != preInput){//複数の文字を入力する時に、前回の文字で検索した結果が残っているのでそれと今回新たに入力した文字が違えば新しく検索し、表示させるように実装している。
      $.ajax({
        url: '/users/search',
        type: 'GET',
        data: {
          name: input
        },
        dataType: 'json'
      })
      .done(function(data){
        appendUsers(data, input, list, preInput);
      })
      .fail(function(data){
        alert("グループを作成してください。");

      });
    }
  }

  function appendUsers(data, input, list, preInput){
      $(".js-chat-group-list").remove();
          $(".chat-group-form__search").append(list)
          $.each(data, function(i, user){ //バッククォートで囲ってあげることによって式展開することができる！
            console.log(data[i].id);
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
            preInput = input;
            addUsers(i, user, html);
           //一個一個のhtmlにfunctionを設定、追加ボタンを押すと下のメンバーの欄に追加された、この欄のリストから、削除される実装！
          });
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


  $("#js-user-search-field").on("keyup", function(e){
    e.preventDefault();
    var list = "<ul class='js-chat-group-list'></ul>"; //検索されたメンバーをこの中に<li>の形で出力するが、文字を消した時にこの<ul>ごと消して一新するので、新たに検索したメンバーを出力させるために再度これをHTMLに追加させる必要がある。
    var preInput;
    searchUsersAjax(list, preInput);
    return false;
  });

});

