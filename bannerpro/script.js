let row = 0;
$(document).ready(function(){
    ga('send','event','bob_image_resizer','document_ready');
	var timers = new Array();

	var cnt = 0;
	var myDropzone = new Dropzone("#drophere");

	function showNewProgress(){
		$("#imagestatus .eachimage").each(function(){
			if($(this).find(".bar").attr("data-anim")==0){
				var that = this
				$(this).find(".bar").attr("data-anim",1);
				$(this).find(".bar").animate({"width":"200px"},15000,function(){
					$(that).find(".download").css("visibility","visible");
				});
			}
		});
	}

	myDropzone.on("addedfile",function(file){
		ga('send','event','bob_image_resizer','file_added');
		file.id = new Date().getTime();
		cnt++;
		file.order = cnt;
		var fileNameWithoutExt = file["name"].substr(0, file["name"].lastIndexOf('.')) || file["name"];
		$("#imagestatus").show();
		$("#imagestatus").append("<tr class='eachimage row' id='image"+cnt+"'><td class='fname col-md-5 col-sm12'>"+file.name+"</td><td class='progress col-md-4'><img src='images/progress.gif'></td><td class='download col-md-3'><a id='"+file.id+"' download href=''>Download</a></td></tr>");
		showNewProgress();
	});

	myDropzone.on("complete",function(file){
    	ga('send','event','bob_image_resizer','image_Resizing_complete');
		var imageSize = file.xhr.response;
		document.getElementById(file.id).href = window.location.href+'download?path='+file.xhr.response;
		var order = file.order;
		var fileNameWithoutExt = file["name"].substr(0, file["name"].lastIndexOf('.')) || file["name"];
		console.log(imageSize);
		var ext = file["name"].split('.').pop();

		$("#imagestatus .eachimage:nth-child("+order+") .progress").html("<img src='images/finished.png'>");
		$("#imagestatus .eachimage:nth-child("+order+") .download").css("visibility","visible");
	});

	$("#aboutTab").click(function(){
		console.log("ssese");
	    	ga('send','event','bob_image_resizer','about_click');
	    	$("#resize,#about,#specs,#support,#help").hide();
	    	// $("#orange").animate({"top":"36px"});
	    	$("#about").show();
	    	$("#specsTab,#aboutTab,#supportTab,#helpTab,#resizeTab").removeClass("tabactive");
	    	$("#aboutTab").addClass("tabactive");

	});
	$("#specsTab").click(function(){
	    	ga('send','event','bob_image_resizer','specs_click');
	    	$("#resize,#about,#specs,#support,#help").hide();
	    	// $("#orange").animate({"top":"77px"});
	    	$("#specs").show();
	    	$("#specsTab,#aboutTab,#supportTab,#helpTab,#resizeTab").removeClass("tabactive");
	    	$("#specsTab").addClass("tabactive");
	});
	$("#supportTab").click(function(){
	    	ga('send','event','bob_image_resizer','support_click');
	    	$("#resize,#about,#specs,#support,#help").hide();
	    	// $("#orange").animate({"top":"117px"});
	    	$("#support").show();
	    	$("#specsTab,#aboutTab,#supportTab,#helpTab,#resizeTab").removeClass("tabactive");
	    	$("#supportTab").addClass("tabactive");
	});
	$("#helpTab").click(function(){
	    	ga('send','event','bob_image_resizer','help_click');
	    	$("#resize,#about,#specs,#support,#help").hide();
	    	// $("#orange").animate({"top":"156px"});
	    	$("#help").show();
	    	$("#specsTab,#aboutTab,#supportTab,#helpTab,#resizeTab").removeClass("tabactive");
	    	$("#helpTab").addClass("tabactive");
	});
	$("#resizeTab").click(function(){
	    	ga('send','event','bob_image_resizer','resize_click');
	    	$("#resize,#about,#specs,#support,#help").hide();
	    	// $("#orange").animate({"top":"0px"});
	    	$("#resize").show();
	    	$("#specsTab,#aboutTab,#supportTab,#helpTab,#resizeTab").removeClass("tabactive");
	    	$("#resizeTab").addClass("tabactive");
	});

	$("#clearall").click(function(){
		$("#imagestatus").empty().hide();
	});
})
