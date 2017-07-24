/*
* Copyright (C) 2009 Joel Sutherland
* Licenced under the MIT license
* http://www.newmediacampaigns.com/page/jquery-flickr-plugin
*
* Available tags for templates:
* title, link, date_taken, description, published, author, author_id, tags, image*
*/

(function($) {
	var j = jQuery.noConflict();
	
	j(function(){
		var cookieStartDate = $.cookie('startDate');
		var cookieEndDate = $.cookie('endDate');
		var cookieCityNo = $.cookie('cityNo');
		var cookiePersonNo = $.cookie('personNo');
		if(cookieStartDate == "" && cookieEndDate == ""){
			cookieStartDate = new Date();
			cookieEndDate = new Date();
		}
		if(cookieCityNo != ""){
			cookieCityNo = cookieCityNo*1-1;
			$("#selectBox option:eq("+cookieCityNo+")").attr("selected", "selected");
		}
		if(cookiePersonNo != ""){
			$('input[name="personNo"]').val(cookiePersonNo);
		}
	    j('input[name="dateRange"]').daterangepicker({
	    		locale: {
		    		format : 'YYYY-MM-DD',
		    		cancelLabel : '취소',
		    		applyLabel : '확인'
		    },	
	   		startDate: cookieStartDate, endDate: cookieEndDate
	    }, 
	    function(start, end, label) {
		    /* alert("예약 날짜 : " + start.format('YYYY-MM-DD') + '에서 ' + end.format('YYYY-MM-DD') + '까지 예약하시겠습니까?'); */
		})
	    j('input[name="dateRange"]').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
		});
	});
})(jQuery);