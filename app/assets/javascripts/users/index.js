"use strict";

$(document).on('ready', function() {
  init();

  function init() {
    onSelectFilter();
    onClickDownload();
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

  function onClickDownload() {
    $('#btn-download').on('click', function(event) {
      event.preventDefault();
      window.location = $(this).attr("href") + '?' + $('#form-filter').serialize();
    })
  }
});
