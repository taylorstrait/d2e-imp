$(document).ready(function(){

  $('.update-health')
    .bind("ajax:beforeSend", function(evt, xhr, settings){
    })

    .bind("ajax:success", function(evt, data, status, xhr){
      $('#current-health').html(xhr.responseText);
    })

    .bind('ajax:complete', function(evt, xhr, status){
    })

});

$(document).ready(function(){

  $('.update-stamina')
    .bind("ajax:beforeSend", function(evt, xhr, settings){
    })

    .bind("ajax:success", function(evt, data, status, xhr){
      $('#current-stamina').html(xhr.responseText);
    })

    .bind('ajax:complete', function(evt, xhr, status){
    })

});