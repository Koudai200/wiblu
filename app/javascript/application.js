  $(document).ready(function() {
    $(".user-tabs li").click(function() {
      // クリックされたタブのIDを取得
      var tabId = $(this).find("a").attr("href");
      
      // タブの切り替え
      $(".tab-content").hide(); // すべてのコンテンツを非表示にする
      $(tabId).show(); // クリックされたタブに対応するコンテンツを表示する
      
      // アクティブなタブのスタイルを設定
      $(".user-tabs li").removeClass("active");
      $(this).addClass("active");
      
      return false; // デフォルトのリンク遷移を無効化
    });

     // 初期表示では「いいね！」タブのコンテンツを表示
     $("#posts-tab").hide();
    
     // タブのクリックイベントハンドラ
     $("#posts-tab-link").click(function() {
       // クリックされたタブに対応するコンテンツを表示
       $("#posts-tab").show();
       $("#likes-tab").hide();
       
       // タブのスタイルを設定
       $("#posts-tab-link").addClass("active");
       $("#likes-tab-link").removeClass("active");
       
       return false;
     });
     
     $("#likes-tab-link").click(function() {
       // クリックされたタブに対応するコンテンツを表示
       $("#posts-tab").hide();
       $("#likes-tab").show();
       
       // タブのスタイルを設定
       $("#posts-tab-link").removeClass("active");
       $("#likes-tab-link").addClass("active");
       
       return false;
     });

     setTimeout(function() {
      $('.flash').fadeOut('slow');
    }, 2000);
    
  });
