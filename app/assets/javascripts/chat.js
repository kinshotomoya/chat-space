$(function(){
  $("#submit").on("click", function(e){
    e.preventDefault();
    ajax();
    return false;
  });


  function ajax(){
    var input = $("#keyword").val();
    $.ajax({
      url: './chats',
      type: 'POST',
      data: {
        text: input
      },
      dataType: 'json'
    })
    .done(function(data){
      appendHtml(data);
      $("#the_form")[0].reset();
    })
    .fail(function(data){
      alert("メッセージを入力してください。");

    });
  }


  function appendHtml(data){

    var html = `<div class="chat__messages__contents__each">
                  <div class="chat__messages__contents__box">
                    <p class="chat__messages__contents__box__name">${ data.name }</p>
                    <p class="chat__messages__contents__box__time">${ data.time }</p>
                  </div>
                  <div class="chat__messages__contents__textbox>
                    <p class="chat__messages__contents__textbox__text">${ data.text }</p>
                  </div>
                </div>`;//コントローラから送られて来た値を取り出すことでviewに表示させる

    $(".chat__messages__contents").append(html);
  }


});

//これだけでは、textは保存されないので,iqueryの関数の$.ajax();でmHTTPリクエストを
//発行してあげて、ちゃんとchats_controllerのcreateアクションが動くようにする！
// あと、appendを使う


