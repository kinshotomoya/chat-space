
$(function(){

  function sendInAjax(){
    var input = $("#js_chat_input").val();
    if(input != ""){
      $.ajax({
        url: 'chats',
        type: 'POST',
        data: {
        text: input   //上のjs-file-fieldからファイルを取り出して、json形式で今度はchats_controllerに送っている。
        },
        dataType: 'json'
      })
      .done(function(data){
        console.log(data.image);
        appendHtml(data);
        $("#js_sending_form")[0].reset();
      })
      .fail(function(data){
        alert("メッセージを入力してください。");
      });
    }else{
      alert("メッセージを入力してください！");
    }
  }


  function sendFileInAjax(){ //ファイルとテキストを分けている。 //後は、下の二行の書き方さえ正常にすればちゃんと送れる！
    var form = $("#js-file-field")[0].files[0];//この書き方でfileの情報を取得できている
    var fd = new FormData(); //formの内容をこの形で送ることができる。FormDataは、送信するためのキーとバリューの値をセットにして送ることができる！！！
    fd.append('image', form); //上で作ったformの内容を送る変数に、imageというkeyでformの内容をvalueとして追加する。
    $.ajax({
      url: 'chats',
      type: 'POST',
      data: fd,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data.image); //ちゃんとイメージの値が取れているかコンソール上に表示させる。
      appendHtml(data);
    })
    .fail(function(data){
      alert("ファイルを選択してください。");
    });
  }


  function appendHtml(data){
    if (data.image.url != null){ //imageの値がnull時、つまり、値があるかどうかを確認してあれば、true、なければfalseを返す。
      var html = `<div class="chat__messages__contents__each">
                    <div class="chat__messages__contents__box">
                      <p class="chat__messages__contents__box__name">${ data.name }</p>
                      <p class="chat__messages__contents__box__time">${ data.time }</p>
                    </div>
                      <img class="chat__messages__contents__textbox__text", src="${data.image.url}", height="200", width="200">
                  </div>`;//コントローラから送られて来た値を取り出すことでviewに表示させる。dataにimageの値の有無で表示させるviewを開けている実装をしている。
    }else if(data.text != null){
      var html = `<div class="chat__messages__contents__each">
                    <div class="chat__messages__contents__box">
                      <p class="chat__messages__contents__box__name">${ data.name }</p>
                      <p class="chat__messages__contents__box__time">${ data.time }</p>
                    </div>
                    <div class="chat__messages__contents__textbox">
                      <p class="chat__messages__contents__textbox__text">${ data.text }</p>
                    </div>
                  </div>`;//コントローラから送られて来た値を取り出すことでviewに表示させる。dataにimageの値の有無で表示させるviewを開けている実装をしている。
    }
    $("#js__chat__messages__contents.chat__messages__contents").append(html);
  }


  function autoLoadPage(){
    $.ajax({//chats_controllerのindexアクションとajaxで定期的に通信することで自動更新が行われる！
      type: 'GET',
      url: 'chats',
      dataType: 'json',
    })
    .done(function(data){
      console.log(data.chats); //これで配列の中の値を取り出している！
      $(".chat__messages__contents__each").remove();
      data.chats.forEach(function(e){//配列を一個一個取り出している！
        console.log(e); //ちゃんと表示されているのかコンソールで表示！
        appendHtml(e);
      })
    })
    .fail(function(data){
      console.log("通信失敗です！");
    });
  }



  $("#submit").on("click", function(e){
    e.preventDefault();
    sendInAjax();
    return false;
  });

  $("#js-file-field").on("change", function(e){ //ここまでは正常に動作している.formの値がchangeした時にここが実行される！！！
    e.preventDefault();
    sendFileInAjax();
    return false;
  })


  setInterval(autoLoadPage, 5000);


});


