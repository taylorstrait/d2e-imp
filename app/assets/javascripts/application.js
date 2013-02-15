// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

// dropdown menus from bootstrap
$('.dropdown-toggle').dropdown();


// table sorting -- needs to interate because when calling whole class table sorting loses some config options?
$(document).ready(function() 
    { 
        $(".sortable-table").tablesorter(); 
    } 
); 

// bootstrap popovers
$('.object-popup').popover({ html: true, trigger: 'hover'});

// function to properly format dropdown data into options
function populateDropdown(select, data) {
  select.html('');
  $.each(data, function(id, option) {
    select.append($('<option></option>').val(option.id).html(option.name));
  });       
}