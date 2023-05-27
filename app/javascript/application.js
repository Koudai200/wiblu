// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function() {
    $('.like-button').click(function(e) {
      e.preventDefault();  // デフォルトのクリックイベントをキャンセル
  
      var $button = $(this);
      var resourceId = $button.data('resource-id');
      var resourceType = $button.data('resource-type');
  
      $.ajax({
        url: '/likes/toggle.js',  // サーバーサイドのエンドポイント（いいね！の追加と削除を切り替えるエンドポイント）
        method: 'POST',
        data: { resource_id: resourceId, resource_type: resourceType },  // リクエストのデータ（いいね！するリソースのIDとタイプ）
        success: function(response) {
          // レスポンスを処理してUIを更新する
          if (response.liked) {
            $button.removeClass('unliked').addClass('liked');
            $button.find('.fa-heart').removeClass('unliked-btn').addClass('liked-btn');
          } else {
            $button.removeClass('liked').addClass('unliked');
            $button.find('.fa-heart').removeClass('liked-btn').addClass('unliked-btn');
          }
          $button.closest('.post-like').find('.like-count').text(response.like_count);
        },
        error: function() {
          alert('いいね！に失敗しました');
        }
      });
    });
  });
  
  
 
