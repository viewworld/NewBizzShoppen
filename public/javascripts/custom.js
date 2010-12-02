  $(document).ready(function(){
     $.each($("a[id*='help_popup_']"), function(idx,elem) {
        $(elem).colorbox({opacity:0, transition:'none'});
     });
  });
