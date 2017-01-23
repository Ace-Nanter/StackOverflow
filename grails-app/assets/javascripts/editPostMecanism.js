/**
 * Created by Pierre on 23/01/2017.
 */

$(document).ready(function(){
    $(".edit_btn").click(function(){
        var block_comment = $(this).closest(".block_comment");
        var submitBtn =block_comment.find(".btn_to_display");
        var display = block_comment.find(".editable_display");

        if(display.attr("readonly")=="readonly"){
            display.attr("readonly",null)
                .removeClass("editable_display_no_border");
        }else{
            display.attr("readonly","readonly")
                .addClass("editable_display_no_border")
        }
        submitBtn.toggleClass("hidden");
    });
});