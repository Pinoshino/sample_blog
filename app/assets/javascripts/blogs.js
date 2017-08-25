// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
 $('a[data-method="delete"]').on('ajax:success', function(xhr,data,status) {
    $('#blog_'+data.blog.id).fadeOut();
 });
});
