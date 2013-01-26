$('#adventure_hero1_hero_id').change(function() {

  var heroId = $(this).prop('value');

  $.getJSON("/heroes/" + heroId + "/professions", function(data) {
      populateDropdown($("#adventure_hero1_profession_id"), data);
    });
  });

$('#adventure_hero2_hero_id').change(function() {

  var heroId = $(this).prop('value');

  $.getJSON("/heroes/" + heroId + "/professions", function(data) {
      populateDropdown($("#adventure_hero2_profession_id"), data);
    });
  });

$('#adventure_hero3_hero_id').change(function() {

  var heroId = $(this).prop('value');

  $.getJSON("/heroes/" + heroId + "/professions", function(data) {
      populateDropdown($("#adventure_hero3_profession_id"), data);
    });
  });

$('#adventure_hero4_hero_id').change(function() {

  var heroId = $(this).prop('value');

  $.getJSON("/heroes/" + heroId + "/professions", function(data) {
      populateDropdown($("#adventure_hero4_profession_id"), data);
    });
  });




function populateDropdown(select, data) {
  select.html('');
  select.append($('<option>Choose a class</option>'));
  $.each(data, function(id, option) {
  select.append($('<option></option>').val(option.value).html(option.name));
  });       
}