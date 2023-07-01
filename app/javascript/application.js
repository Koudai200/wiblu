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

  document.addEventListener("DOMContentLoaded", function() {
    var searchIcon = document.getElementById("search-icon");
    var searchContainer = document.getElementById("search-container");
    var searchForm = document.querySelector(".search-form");

    searchIcon.addEventListener("click", function() {
      searchContainer.classList.toggle("active");
      if (searchContainer.classList.contains("active")) {
        searchForm.querySelector("input").focus();
      }
    });

    document.addEventListener("click", function(event) {
      if (!searchContainer.contains(event.target) && event.target !== searchIcon) {
        searchContainer.classList.remove("active");
      }
    });
  });

function confirmAndDelete(itemId, itemType) {
    var confirmMessage = '';
    var url = '';
  
    if (itemType === 'post') {
      confirmMessage = '本当に投稿を削除しますか？';
      url = "/posts/" + itemId + "/destroy";
    } else if (itemType === 'user') {
      confirmMessage = '本当にアカウントを削除しますか？';
      url = "/users/" + itemId + "/destroy";
    } else if (itemType === 'music') {
      confirmMessage = '本当に音楽を削除しますか？';
      url = "/musics/" + itemId + "/destroy";
    } else if (itemType === 'movie') {
      confirmMessage = '本当に映像を削除しますか？';
      url = "/movies/" + itemId + "/destroy";
    } else if (itemType === 'image') {
      confirmMessage = '本当にイラストを削除しますか？';
      url = "/images/" + itemId + "/destroy";
    }
  
    if (confirm(confirmMessage)) {
      window.location.href = url;
    }
  }
