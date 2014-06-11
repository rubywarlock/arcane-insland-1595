// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

//= require bootstrap-tab
//= require bootstrap-modal
//= require bootstrap-dropdown
//= require bootstrap-popover
/////= require bootstrap-collapse

/////// require tinymce-jquery
//= require bootstrap-wysihtml5

//= require_tree .



function js_show(acc) {
	cur_attr = $(acc).attr("class");
	//$(".tr_line_dropdown").empty();

	if (cur_attr != "dropdown_box dropdown_open") {

		//$(acc + " .tr_line_dropdown").append(r);

		$(".dropdown_open").slideToggle("fast");
		$(".dropdown_open").attr({class: "dropdown_box"});

		$(acc).slideToggle("fast");
		attr = $(acc).attr("class");
		$(acc).attr({class: attr + ' ' + 'dropdown_open'});
	}

	if (cur_attr == "dropdown_box dropdown_open") {
		$(".dropdown_open").slideToggle("fast");
		$(".dropdown_open").attr({class: "dropdown_box"});
	}
}

