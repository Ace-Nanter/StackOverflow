/**
 * Created by Pierre on 23/01/2017.
 */

$(document).ready(function(){
    alert("prout");
    $(".editable_post .edit_btn").click(function(){
        var submitBtn =$(this).parent(".btn_to_display");
        var display = $(this).parent(".editable_display");

        display.readOnly(!display.readOnly());
        submitBtn.toggleClass("hidden");
    });
});