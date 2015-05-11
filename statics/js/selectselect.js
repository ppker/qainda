$(document).ready(function(){
							
	$("#select1 dd").click(function (e) {
		//e.preventDefault();
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectA").remove();
		} else {
			var copyThisA = $(this).clone();
			if ($("#selectA").length > 0) {
				$("#selectA a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisA.attr("id", "selectA"));
			}
		}
	});
	
	$("#select2 dd").click(function (e) {
		//e.preventDefault();
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectB").remove();
		} else {
			var copyThisB = $(this).clone();
			if ($("#selectB").length > 0) {
				$("#selectB a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisB.attr("id", "selectB"));
			}
		}
	});
	
	$("#select3 dd").click(function (e) {
		//e.preventDefault();
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectC").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectC").length > 0) {
				$("#selectC a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectC"));
			}
		}
	});

	$("#select4 dd").click(function (e) {
		//e.preventDefault();
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectD").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectD").length > 0) {
				$("#selectD a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectD"));
			}
		}
	});
	
	$("#select5 dd").click(function (e) {
		//e.preventDefault();
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectE").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectE").length > 0) {
				$("#selectE a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectE"));
			}
		}
	});

	$("#select6 dd").click(function (e) {
		//e.preventDefault();
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectF").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectF").length > 0) {
				$("#selectF a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectF"));
			}
		}
	});

	$("#select7 dd").click(function (e) {
		//e.preventDefault();
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectG").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectG").length > 0) {
				$("#selectG a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectG"));
			}
		}
	});


	$(document).on("click","#selectA",function(){
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$(document).on("click","#selectB",function(){
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$(document).on("click","#selectC",function(){
		$(this).remove();
		$("#select3 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$(document).on("click","#selectD",function(){
		$(this).remove();
		$("#select4 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$(document).on("click","#selectE",function(){
		$(this).remove();
		$("#select5 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$(document).on("click","#selectF",function(){
		$(this).remove();
		$("#select6 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$(document).on("click","#selectG",function(){
		$(this).remove();
		$("#select7 .select-all").addClass("selected").siblings().removeClass("selected");
	});
/*-----------------*/
	$(document).on("click",".select dd",function(){
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});	
});