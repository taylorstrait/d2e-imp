$("#quest_selector").change(function() {
    
    var questId = $(this).prop('value');

    $.getJSON("/quests/" + questId + "/encounters", function(data) {
        populateDropdown($("#encounter_id"), data);
    });
});

$("#quest_selector").change(function() {
    $("#open_groups_results").empty();
});

$("encounter_id").change(function() {
    $("#open_groups_results").empty();
});



// Use AJAX to generate monster list

$(document).ready(function(){

  $('#generate_open_groups_form')
    .bind("ajax:beforeSend", function(evt, xhr, settings){
      // var $submitButton = $(this).find('input[name="commit"]');

      // Update the text of the submit button to let the user know stuff is happening.
      // But first, store the original text of the submit button, so it can be restored when the request is finished.
      // $submitButton.data( 'origText', $(this).text() );
      //$submitButton.text( "Generating..." );
      $('#open_groups_results').hide();

    })
    .bind("ajax:success", function(evt, data, status, xhr){

      // Insert response partial into page below the form.
      $('#open_groups_results').html(xhr.responseText);
      $('#open_groups_results').fadeIn();

    })
    .bind('ajax:complete', function(evt, xhr, status){
      // var $submitButton = $(this).find('input[name="commit"]');

      // Restore the original submit button text
      //$submitButton.text( $(this).data('origText') );
    })

});