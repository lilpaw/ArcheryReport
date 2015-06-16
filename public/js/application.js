$(document).ready(function() {


    function searchImages(event){
      event.preventDefault();

      tag = "archery"

      var photoRequest = $.ajax({
        type: "GET",
        dataType: "jsonp",
        cache: false,
        url: "https://api.instagram.com/v1/tags/"+tag+"/media/recent?access_token=",
        success: (function(data) {
          for (var i = 0; i < 4; i++) {
            $(".archery-images-container").append('<a class="archery-image" target="_blank" href="' + data.data[i].link + '"><img src="' + data.data[i].images.low_resolution.url +'"></img></a>');
          };

        })
      });
    };
      $('.searchImgs').on('click', searchImages);
});