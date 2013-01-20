var $gc = $(".game_checkbox")
var $mc = $(".monster_checkbox")

$gc.click(function() { 
  
  var gId = $(this).prop('value'); 
  var new_setting = $(this).prop('checked');

  $mc.each(function() { 
    if (gId == $(this).attr('game_id')) {
      $(this).prop('checked', new_setting);
    }
  }); 
});