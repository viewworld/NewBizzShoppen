var content = '<%= escape_javascript(render(:partial => 'leads_advanced_imports/categories_selection', :locals => {:objects => @categories})) %>';
$('#categories_selection').html(content);
