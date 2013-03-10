// set our initial arrays so we can avoid duplicates when selecitngn random heroes and professions
chosenHeroes = new Array(0,0,0,0,0);
chosenProfessions = new Array(0,0,0,0,0);

// function for handling hero changes
function heroChangeFunction(i) {
    // set up vars
    var professionSelector = "#heroes_" + i + "_profession_id";
    var itemsDiv = "#hero_" + i + "_items";
    var skillsDiv = "#hero_" + i + "_skills";

    // if hero is selected, update professions
    $("#heroes_" + i + "_hero_id").change(function() {
    
        var heroId = $(this).prop('value');
        chosenHeroes[i] = $(this).prop('value');

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
        chosenProfessions[i] = $(this).prop('value');

        // update starting items
        $.get("/classes/" + professionId + "/items", function (data) {
            $(itemsDiv).html(data);
        });
    
        // update starting skills
        $.get("/classes/" + professionId + "/starting_skills", function (data) {
             $(skillsDiv).html(data);
        });
    });
}

// function for hero randomizer
function randomizeHeroFunction(i) {

    $("#randomize_hero_" + i).click(function () {

        //set random hero, adjusting +1/-1 for select prompt in list
        // loop through heroes, making sure they aren't already selected somewhere else
        
        // MUST CHOOSE HERO THAT CANPICK CLASS OR IT WILL BOMB OUT
        do
            {
                chosenHeroes[i] = 0; // clear the current slot so we can select the same hero again
                $("#heroes_" + i + "_hero_id > option")[Math.floor(Math.random() * ($("#heroes_" + i + "_hero_id > option").length - 1)) + 1].selected = true;
                var currentHero = $("#heroes_" + i + "_hero_id").prop('value');
            }
        while ((jQuery.inArray($("#heroes_" + i + "_hero_id").prop('value'), chosenHeroes) != -1));
  
        chosenHeroes[i] = currentHero; // log the selected hero in the array

        // wait then trigger the next select option selector
        setTimeout(function(){
            $("#heroes_" + i + "_hero_id").change();
        }, 100);

        // wait and then set random profession, adjusting +1/-1 for select prompt in list
        // loop through professions, making sure they aren't already selected somewhere else
        // we use a break counter for cases where all available professions are taken due to hero archetype limitations
        setTimeout(function(){       
            var options = $("#heroes_" + i + "_profession_id > option");
            var counter = 0;
            do
                {
                    chosenProfessions[i] = 0; // clear the current slot so we can select the same profession again
                    options[Math.floor(Math.random() * (options.length - 1)) + 1].selected = true;
                    var currentProfession = $("#heroes_" + i + "_profession_id").prop('value');

                    counter ++;
                    if(counter >10) {break;}
                }
            while ((jQuery.inArray(currentProfession, chosenProfessions) != -1));
            
            chosenProfessions[i] = currentProfession; // log the selected profession in the array

        }, 400);
        

        // wait and then trigger the show items/skills partial generator
        setTimeout(function(){
            $("#heroes_" + i + "_profession_id").change();
        }, 600);
    });
}

// loop through the array and map functions to all 4 hero / profession selectors
var heroArray = [1, 2, 3, 4];

for (var i = 1; i < heroArray.length + 1; i++) {
  $("#heroes_" + i + "_hero_id").change = heroChangeFunction(i);
  $("#heroes_" + i + "_profession_id").change = classChangeFunction(i);
  $("#randomize_hero_" + i).click = randomizeHeroFunction(i);
}

// update form title as user enters name
$('#adventure_name').keyup(function() {

    var newTitle = $(this).val();
    
    $('#form_title').html(newTitle);
});

// for removing items
$(document).on('ajax:success', '.remove-object', function() {
    // .parent() is the div containing this "X" delete link
    $(this).parent().slideUp();
    }
);