// function for handling hero changes
function heroChangeFunction(i) {
    // set up vars
    var professionSelector = "#heroes_" + i + "_profession_id";
    var itemsDiv = "#hero_" + i + "_items";
    var skillsDiv = "#hero_" + i + "_skills";

    // if hero is selected, update professions
    $("#heroes_" + i + "_hero_id").change(function() {
    
        var heroId = $(this).prop('value');
      
        $.getJSON("/heroes/" + heroId + "/professions", function(data) {
            populateDropdown($(professionSelector), data);
            $(itemsDiv).empty();
            $(skillsDiv).empty();
        });
    });
}

// function for handling class changes
function classChangeFunction(i) {
    
    var itemsDiv = "#hero_" + i + "_items";
    var skillsDiv = "#hero_" + i + "_skills";

        // if class is selected...
    $("#heroes_" + i + "_profession_id").change(function () {

        var professionId = $(this).prop('value');
  
        // update starting items
        $.get("/classes/" + professionId + "/get_items", function (data) {
            $(itemsDiv).html(data);
        });
    
        // update starting skills
        $.get("/classes/" + professionId + "/get_skills", function (data) {
             $(skillsDiv).html(data);
        });
    });
}

// loop through the array and map functions to all 4 hero / profession selectors
var heroArray = [1, 2, 3, 4];

for (var i = 1; i < heroArray.length + 1; i++) {
  $("#heroes_" + i + "_hero_id").change = heroChangeFunction(i)
  $("#heroes_" + i + "_profession_id").change = classChangeFunction(i)
}

// function to properly format dropdown data into options
function populateDropdown(select, data) {
  select.html('');
  select.append($('<option>Choose a class</option>'));
  $.each(data, function(id, option) {
    select.append($('<option></option>').val(option.id).html(option.name));
  });       
}
