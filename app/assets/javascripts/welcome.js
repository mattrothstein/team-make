
var ready = function() {

  $('.login-forms').delay(3500,function(){
    $(".login-forms").stop().animate({'margin-top':'8em'}, {queue:false, duration:2000, easing: 'easeInOutBack'});
    });


 };

$(document).on('ready page:load', ready);
