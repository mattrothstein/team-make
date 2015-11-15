
var ready = function() {

$( document ).ready(function() {
  $( "#manage-club" ).delay( 100 ).fadeIn( "slow" );
  $( "#update-club-info" ).delay( 300 ).fadeIn( "slow" );
  $( "#post-tryout" ).delay( 600 ).fadeIn( "slow" );
  $( "#view-seasons" ).delay( 100 ).fadeIn( "slow" );
  $( "#view-tryouts" ).delay( 300 ).fadeIn( "slow" );
  $( "#delete-club-account" ).delay( 600 ).fadeIn( "slow" );


  });

$(document).ready(function() {

    $("#manage-club").hover(
      function() {
        $("#manage-club").animate({'width':'21em',
                           'height': '9em'});
      },
      function() {
        $("#manage-club").animate({'width':'20em',
                           'height': '8em'});
      }
    );

    $("#update-club-info").hover(
      function() {
    $("#update-club-info").animate({'width':'21em',
                   'height': '9em'});
  },function(){
        $("#update-club-info").animate({'width':'20em',
                   'height': '8em'});
  });


    $("#post-tryout").hover(
                     function() {
    $("#post-tryout").animate({'width':'21em',
                   'height': '9em'});
  },function(){
        $("#post-tryout").animate({'width':'20em',
                   'height': '8em'});
    });
  });

}

$(document).ready(function() {

    $("#view-seasons").hover(
      function() {
        $("#view-seasons").animate({'width':'21em',
                           'height': '9em'});
      },
      function() {
        $("#view-seasons").animate({'width':'20em',
                           'height': '8em'});
      }
    );

    $("#view-tryouts").hover(
                     function() {
    $("#view-tryouts").animate({'width':'21em',
                   'height': '9em'});
  },function(){
        $("#view-tryouts").animate({'width':'20em',
                   'height': '8em'});
  });


    $("#delete-club-account").hover(
                     function() {
    $("#delete-club-account").animate({'width':'21em',
                   'height': '9em'});
  },function(){
        $("#delete-club-account").animate({'width':'20em',
                   'height': '8em'});
    });
  });

$( "#team-div" ).hover(function() {
  $( "#team-div" ).effect( "shake", 5 );
});
// $( document ).click(function() {
//   $( "#update-club-info" ).toggle( "puff" );
// });
// $( document ).click(function() {
//   $( "#post-tryout" ).toggle( "puff" );
// });
// $( document ).click(function() {
//   $( "#view-seasons" ).toggle( "puff" );
// });
// $( document ).click(function() {
//   $( "#view-tryouts" ).toggle( "puff" );
// });
// $( document ).click(function() {
//   $( "#delete-club-account" ).toggle( "puff" );
// });


$(document).on('ready page:load', ready);
