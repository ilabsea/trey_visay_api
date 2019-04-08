"use strict";

$(document).on('ready', function() {
  init();

  function init() {
    onSelectFilter();
  }

  function onSelectFilter() {
    $('.select').on('change', function() {
      if ($(this).val() !== null) {
        let url = '/?' + $('#form-filter').serialize();

        $.get( url, null, null, "script");
      }

      true
    })
  }
});
