$('#heroes_1_hero_id').change(function() {

  var heroId = $(this).prop('value');

  $.getJSON("/heroes/" + heroId + "/professions", function(data) {
      populateDropdown($("#heroes_1_profession_id"), data);
    });
  });

$('#heroes_2_hero_id').change(function() {

  var heroId = $(this).prop('value');

  $.getJSON("/heroes/" + heroId + "/professions", function(data) {
      populateDropdown($("#heroes_2_profession_id"), data);
    });
  });

$('#heroes_3_hero_id').change(function() {

  var heroId = $(this).prop('value');

  $.getJSON("/heroes/" + heroId + "/professions", function(data) {
      populateDropdown($("#heroes_3_profession_id"), data);
    });
  });

$('#heroes_4_hero_id').change(function() {

  var heroId = $(this).prop('value');

  $.getJSON("/heroes/" + heroId + "/professions", function(data) {
      populateDropdown($("#heroes_4_profession_id"), data);
    });
  });




function populateDropdown(select, data) {
  select.html('');
  select.append($('<option>Choose a class</option>'));
  $.each(data, function(id, option) {
  select.append($('<option></option>').val(option.id).html(option.name));
  });       
}