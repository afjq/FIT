
var documentHeight = 0;
var topPadding = 15
$(function() {
	var offset = $(".SonlineBox").offset();
	documentHeight = $(document).height();
	$(window).scroll(function() {
		var sideBarHeight = $(".SonlineBox").height();
		if ($(window).scrollTop() > offset.top) {
			var newPosition = ($(window).scrollTop() - offset.top) + topPadding;
	     	var maxPosition = documentHeight - (sideBarHeight + 368);
			if (newPosition > maxPosition) {
				newPosition = maxPosition;
			}
			$(".SonlineBox").stop().animate({
				marginTop: newPosition
			});
		} else {
			$(".SonlineBox").stop().animate({
				marginTop: 0

			});

		};

	});

});

