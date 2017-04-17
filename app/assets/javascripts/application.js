//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require cable
////= require material.min

$(document).ready(function(){
    $.material.init();
    $('[data-toggle="tooltip"], [rel="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();
});