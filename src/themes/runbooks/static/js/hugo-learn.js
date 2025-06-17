// Get Parameters from some url
let getUrlParameter = function getUrlParameter(sPageURL) {
    let url = sPageURL.split('?');
    let obj = {};
    if (url.length == 2) {
      let sURLVariables = url[1].split('&'),
          sParameterName,
          i;
      for (i = 0; i < sURLVariables.length; i++) {
          sParameterName = sURLVariables[i].split('=');
          obj[sParameterName[0]] = sParameterName[1];
      }
      return obj;
    } else {
      return undefined;
    }
};

// Execute actions on images generated from Markdown pages
let images = $("div#body-inner img").not(".inline");
// Wrap image inside a featherlight (to get a full size view in a popup)
images.wrap(function(){
  let image =$(this);
  if (!image.parent("a").length) {
    return "<a href='" + image[0].src + "' data-featherlight='image'></a>";
  }
});

// Change styles, depending on parameters set to the image
images.each(function(index){
  let image = $(this)
  let o = getUrlParameter(image[0].src);
  if (typeof o !== "undefined") {
    let h = o["height"];
    let w = o["width"];
    let c = o["classes"];
    image.css("width", function() {
      if (typeof w !== "undefined") {
        return w;
      } else {
        return "auto";
      }
    });
    image.css("height", function() {
      if (typeof h !== "undefined") {
        return h;
      } else {
        return "auto";
      }
    });
    if (typeof c !== "undefined") {
      let classes = c.split(',');
      for (const className of classes) {
        image.addClass(className);
      }
    }
  }
});

// Stick the top to the top of the screen when  scrolling
$(document).ready(function(){
  $("#top-bar").sticky({topSpacing:0, zIndex: 1000});
});


jQuery(document).ready(function() {
  // Add link button for every
  let text, clip = new Clipboard('.anchor');
  $("h1~h2,h1~h3,h1~h4,h1~h5,h1~h6").append(function(index, html){
    let element = $(this);
    let url = encodeURI(document.location.origin + document.location.pathname);
    let link = url + "#"+element[0].id;
    return " <span class='anchor' data-clipboard-text='"+link+"'>" +
      "<i class='fas fa-link fa-lg'></i>" +
      "</span>"
    ;
  });

  $(".anchor").on('mouseleave', function(e) {
    $(this).attr('aria-label', null).removeClass('tooltipped tooltipped-s tooltipped-w');
  });

  clip.on('success', function(e) {
      e.clearSelection();
      $(e.trigger).attr('aria-label', 'Link copied to clipboard!').addClass('tooltipped tooltipped-s');
  });

});
