// Use AJAX to generate dice

$(document).ready(function(){

  $('.roll_dice_button')
    .bind("ajax:beforeSend", function(evt, xhr, settings){
      // var $submitButton = $(this).find('input[name="commit"]');

      // Update the text of the submit button to let the user know stuff is happening.
      // But first, store the original text of the submit button, so it can be restored when the request is finished.
      // $submitButton.data( 'origText', $(this).text() );
      //$submitButton.text( "Generating..." );
      //$('#open_groups_results').hide();

    })
    .bind("ajax:success", function(evt, data, status, xhr){

      // Insert response partial into page below the form.
      $('#dice-results').append(xhr.responseText);
      $.playSound('/sounds/dice-roller.mp3');
      //$('#open_groups_results').fadeIn();

    })
    .bind('ajax:complete', function(evt, xhr, status){
      // var $submitButton = $(this).find('input[name="commit"]');

      // Restore the original submit button text
      //$submitButton.text( $(this).data('origText') );
    })

});

//$(document).ready(function(){
//
//  $('#dice-results').click(function () {
//    $(this).children().fadeOut()
//  });
//
//});