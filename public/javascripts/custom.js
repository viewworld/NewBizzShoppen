$(document).ajaxStart(function(){
  $('#global_loader').show();
});
$(document).ajaxStop(function(){
  $('#global_loader').hide();
});
