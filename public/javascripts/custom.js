$(document).ajaxStart(function(){
  $('#global_loader').show();
});

$(document).ajaxStop(function(){
  $('#global_loader').hide();
});

$(document).ready(function() {
   $('*.expandable').expander({
      slicePoint:           100,
      widow:                4,
      expandText:           I18n.t("common.js.read_more"),
      expandPrefix:         I18n.t("common.js.expand_prefix"),
      collapseTimer:        0,
      expandEffect:         'fadeIn',
      expandSpeed:          '',
      userCollapse:         true,
      userCollapseText:     I18n.t("common.js.collapse_expanded_text"),
      userCollapsePrefix:   I18n.t("common.js.collapse_prefix"),
      beforeExpand:         function($thisEl) {},
      afterExpand:          function($thisEl) {},
      onCollapse:           function($thisEl, byUser) {}
   });
});

