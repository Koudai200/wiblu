const selected = $("select[name=preflist]");
selected.on("change",function(){
  window.location.href = selected.val();
});