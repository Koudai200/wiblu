$(document).ready(function() {
  // 最初のタブをアクティブにする
  $('.user-tabs li:first').addClass('active');
  $('.tab-content:first').show();
  
  // タブをクリックしたときの処理
  $('.user-tabs li').click(function() {
    // クリックされたタブのhref属性を取得
    var tabId = $(this).children('a').attr('href');
    
    // すべてのタブとコンテンツを非表示にする
    $('.user-tabs li').removeClass('active');
    $('.tab-content').hide();
    
    // クリックされたタブと対応するコンテンツを表示する
    $(this).addClass('active');
    $(tabId).show();
    
    // ページの上部にスクロールする
    $('html, body').animate({ scrollTop: 0 }, 'fast');
    
    // デフォルトのリンク動作をキャンセルする
    return false;
  });
});
