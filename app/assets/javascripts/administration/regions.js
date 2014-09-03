function loadRegionsToSelect(selector, country) {
  $.get('/regions.json', { country_id: country }, function(regions) {
    $(selector).html("<option value='' selected='selected'></option>");

    $.each(regions, function(i, region) {
      $(selector).append($('<option>', {
        value: region.id,
        text: region.name
      }));
    });
  });
}
