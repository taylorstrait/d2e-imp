// Use AJAX to generate dice

$(document).ready(function(){

  $('.roll_dice_button')
    .bind("ajax:beforeSend", function(evt, xhr, settings){
    })


    .bind("ajax:success", function(evt, data, status, xhr){

      // Insert response partial into page below the form.
      $('#dice-results').append(xhr.responseText);
      var snd = new Audio('/sounds/dice-roller.mp3'); // buffers automatically when created
      snd.play();
    })


    .bind('ajax:complete', function(evt, xhr, status){
    })

});



$(document).ready(function(){

  $('#clear-dice').click(function () {
    $("#dice-results").empty()
  });

});