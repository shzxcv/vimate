$(function() {
  $('.alert').hide().fadeIn(1000);
})

$(function(){
  setTimeout(function() {
    $('.alert').animate({opacity: "0.0"})}, 3500
  );
})
