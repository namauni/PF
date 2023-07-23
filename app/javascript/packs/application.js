// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"; 

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// jquery書きはじめ
$(document).on('turbolinks:load', function() {
    $(function (){
      // 処理（ページが読み込まれた時、フォームに残り何文字入力できるかを数えて表示する）
    
      //フォームに入力されている文字数を数える
      //\nは"改行"に変換して2文字にする。オプションフラグgで文字列の最後まで\nを探し変換する
      var count = $(".js-text").text().replace(/\n/g, "改行").length;
      //残りの入力できる文字数を計算
      var now_count = 50000 - count;
      //文字数がオーバーしていたら文字色を赤にする
      if (count > 50000) {
        $(".js-text-count").css("color","red");
      }
      //残りの入力できる文字数を表示
      $(".js-text-count").text( "残り" + now_count + "文字");
    
      $(".js-text").on("keyup", function() {
        // 処理（キーボードを押した時、フォームに残り何文字入力できるかを数えて表示する）
        //フォームのvalueの文字数を数える
        var count = $(this).val().replace(/\n/g, "改行").length;
        var now_count = 50000 - count;
    
        if (count > 50000) {
          $(".js-text-count").css("color","red");
        } else {
          $(".js-text-count").css("color","black");
        }
        $(".js-text-count").text( "残り" + now_count + "文字");
      });
    });
});