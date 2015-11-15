
var ready = function() {

$( document ).ready(function() {
  $( ".panel-back.noti-box" ).delay( 100 ).fadeIn( "slow" );
  $( "#two" ).delay( 300 ).fadeIn( "slow" );
  $( "#three" ).delay( 600 ).fadeIn( "slow" );


  });

$(document).ready(function() {

    $(".panel-back.noti-box").hover(
      function() {
        $(".panel-back.noti-box").effect("shake", 5)
      // },
      // function() {
      //   $(".panel-back.noti-box").animate({'width':'5em',
      //                      'height': '5em'});
       }
    );

    $("#two").hover(
                     function() {
    $("#two").animate({'width':'8em',
                   'height': '8em'});
  },function(){
        $("#two").animate({'width':'5em',
                   'height': '5em'});
  });


    $("#three").hover(
                     function() {
    $("#three").animate({'width':'8em',
                   'height': '8em'});
  },function(){
        $("#three").animate({'width':'5em',
                   'height': '5em'});
  });

  });


}

$(document).on('ready page:load', ready);

////
////
////

// Below is responsible for handling animations of links in dashboard sidebar
// $( document ).ready(function() {
//   $( "a" ).delay( 100 ).fadeIn( "slow" );
//   $( "#two" ).delay( 300 ).fadeIn( "slow" );
//   $( "#three" ).delay( 600 ).fadeIn( "slow" );


//   });

// $(document).ready(function() {

//     $("li a").hover(
//                      function() {
//     $("li a").animate({'width':'18em',
//                    'height': '4em'});
//   },function(){
//         $("li a").animate({'width':'16em',
//                    'height': '3em'});
//   });

//     $("#two").hover(
//                      function() {
//     $("#two").animate({'width':'8em',
//                    'height': '8em'});
//   },function(){
//         $("#two").animate({'width':'5em',
//                    'height': '5em'});
//   });


//     $("#three").hover(
//                      function() {
//     $("#three").animate({'width':'8em',
//                    'height': '8em'});
//   },function(){
//         $("#three").animate({'width':'5em',
//                    'height': '5em'});
//   });
//   });
