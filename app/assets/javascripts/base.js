/* global $ */
/* global moment */

$(function() {

  "use strict";

  let window_width = $(window).width();

  /*Preloader*/
  $(window).load(function() {
    setTimeout(function() {
      $('body').addClass('loaded');      
    }, 200);
  });  
  
  /*----------------------
  * Plugin initialization
  ------------------------*/
  $.extend( true, $.fn.dataTable.defaults, {
    lengthChange: false,
    ordering:     false,
    length:       false,
    stateSave:    true,
    //pagingType: "simple",
    language: {
      decimal:        "",
      emptyTable:     "No hay datos disponibles en la tabla",
      info:           "Mostrando _START_ a _END_ de _TOTAL_ registros",
      infoEmpty:      "Mostrando 0 registros",
      infoFiltered:   "(filtrado de _MAX_ registros)",
      infoPostFix:    "",
      thousands:      ",",
      lengthMenu:     "Mostrar _MENU_ registros",
      loadingRecords: "Cargando...",
      processing:     "Procesando...",
      search:         "Buscar",
      zeroRecords:    "No se encontraron registros de acuerdo a la búsqueda",
      paginate: {
        first:      "Primero",
        last:       "Último",
        next:       "Siguiente",
        previous:   "Anterior"
      },
      aria: {
        sortAscending:  ": activar para organizar la columna ascendentemente",
        sortDescending: ": activar para organizar la columna descendentemente"
      }
    }
    
  });
  
  $('#list-users').DataTable({
    order: [[ 3, "asc" ]],
  });


  let liveDate = $('.live-date'),
      liveTime = $('.live-time');
  function startTime() {
    if(liveDate.length){
      liveDate.html(moment().format("MMMM D, YYYY"));
    }
    if(liveTime.length){
      liveTime.html(moment().format("hh:mm:ss A"));
    }
    setTimeout(function () {
      startTime();
    }, 1000);
  }
  if(liveDate.length || liveTime.length){
   startTime(); 
  }

  // Materialize Dropdown
  $('.dropdown-button').dropdown({
    inDuration: 300,
    outDuration: 125,
    constrain_width: true, // Does not change width of dropdown to that of the activator
    hover: false, // Activate on click
    alignment: 'left', // Aligns dropdown to left or right edge (works with constrain_width)
    gutter: 0, // Spacing from edge
    belowOrigin: true // Displays dropdown below the button
  });

  // Materialize tooltip
  $('.tooltipped').tooltip({
    delay: 50
  });

  // Materialize sideNav  

  //Main Left Sidebar Menu
  $('.sidebar-collapse').sideNav({
    edge: 'left', // Choose the horizontal origin      
  });
  
  //Main Left Sidebar Chat
  $('.chat-collapse').sideNav({
    menuWidth: 240,
    edge: 'right',
  });
  $('.chat-close-collapse').click(function() {
    $('.chat-collapse').sideNav('hide');
  });
  $('.chat-collapsible').collapsible({
    accordion: false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
  });

  // Pikadate datepicker
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: true, // Creates a dropdown of 15 years to control year
    format: 'yyyy/mm/dd',
    formatSubmit: 'yyyy/mm/dd',
    min: new Date(1900, 1, 1)
  });

  $("select").material_select();

  // Perfect Scrollbar
  $('select').not('.disabled').material_select();
  let leftnav = $(".page-topbar").height();  
  let leftnavHeight = window.innerHeight - leftnav;
  $('.leftside-navigation').height(leftnavHeight).perfectScrollbar({
    suppressScrollX: true
  });
  let righttnav = $("#chat-out").height();
  $('.rightside-navigation').height(righttnav).perfectScrollbar({
    suppressScrollX: true
  });

  // Fullscreen
  function toggleFullScreen() {
    if ((document.fullScreenElement && document.fullScreenElement !== null) ||
      (!document.mozFullScreen && !document.webkitIsFullScreen)) {
      if (document.documentElement.requestFullScreen) {
        document.documentElement.requestFullScreen();
      }
      else if (document.documentElement.mozRequestFullScreen) {
        document.documentElement.mozRequestFullScreen();
      }
      else if (document.documentElement.webkitRequestFullScreen) {
        document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
      }
    }
    else {
      if (document.cancelFullScreen) {
        document.cancelFullScreen();
      }
      else if (document.mozCancelFullScreen) {
        document.mozCancelFullScreen();
      }
      else if (document.webkitCancelFullScreen) {
        document.webkitCancelFullScreen();
      }
    }
  }

  $('.toggle-fullscreen').click(function() {
    toggleFullScreen();
  });


  // Floating-Fixed table of contents (Materialize pushpin)
  if ($('nav').length) {
    $('.toc-wrapper').pushpin({
      top: $('nav').height()
    });
  }
  else if ($('#index-banner').length) {
    $('.toc-wrapper').pushpin({
      top: $('#index-banner').height()
    });
  }
  else {
    $('.toc-wrapper').pushpin({
      top: 0
    });
  }

    // Detect touch screen and enable scrollbar if necessary
  function is_touch_device() {
    try {
      document.createEvent("TouchEvent");
      return true;
    }
    catch (e) {
      return false;
    }
  }
  if (is_touch_device()) {
    $('#nav-mobile').css({
      overflow: 'auto'
    });
  }

  $.validator.setDefaults({
    errorClass: "invalid",
    validClass: "valid",
    errorPlacement: function (error, element) {
      $(element).closest("form").find("label[for='" + element.attr("id") + "']").attr('data-error', error.text());
    }
  });
  
  $(".form-card").validate({
    rules: {
      user: {
        email: {
          required: true
        },
        password: {
          required: true  
        }
      },
    },  
    //For custom messages
    /*messages: {
      user: {
        email: {
          required: "Enter the email",
        },
        password: {
          required: "Enter the password",
        }
      }
    }*/
  });


}); // end of document ready