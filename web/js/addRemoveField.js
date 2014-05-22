/**
    by Saran Chamling
    from http://www.sanwebe.com/2013/03/addremove-input-fields-dynamically-with-jquery/comment-page-1

    modified by Bonita Ramadhani
 **/
$(document).ready(function() {

var MaxInputs       = 15; //maximum input boxes allowed for supply
var MaxInputsStep   = 20; //maximum input boxes alowed for step
var MaxInputsLink   = 999;
var InputsWrapper   = $("#supply"); //Input boxes wrapper ID for supply
var Step            = $("#step"); // Input boxes wrapper ID for step
var Link            = $("#link");
var AddButton       = $("#AddMoreFileBox"); //Add button ID for supply
var AddStep         = $("#addStep"); //Add button ID for step
var AddLink         = $("#addLink");

var x = 3; //initial text box for supply
var y = 3; //initial text box for step
var z = 1;
var FieldCount=1; //to keep track of text box added

$(AddButton).click(function (e)  //on add input button click
{
        if(x <= MaxInputs) //max input box allowed
        {
            FieldCount++; //text box added increment
            //add input box
            $(InputsWrapper).append('<div class="row mbottom-10">' +
                                        '<div class="col-sm-11 nopadr"><input class="form-control" type="text" name="supply"></div><a href="#" class="btn btn-danger removeclass">&times;</a>' +
                                    '</div>');
            x++; //text box increment
        }
return false;
});

$(AddStep).click(function (e)  //on add input button click
{
        if(y <= MaxInputsStep) //max input box allowed
        {
            //add input box
            $(Step).append('<div class="row mbottom-10">' +
                                '<div class="col-sm-4">' +
                                    '<input type="file" id="featured_img" name="tutStepImage">' +
                                '</div>' +
                                '<div class="col-sm-7 nopadr">' +
                                    '<textarea class="form-control" rows="8" name="tutStep"></textarea>' +
                                '</div>' +
                                '<a href="#" class="btn btn-danger removestep">&times;</a>' +
                           '</div>');
            y++; //text box increment
        }
return false;
});

$(AddLink).click(function (e)  //on add input button click
{
        if(z <= MaxInputsLink) //max input box allowed
        {
            //add input box
            $(Link).append('<div class="mbottom-10">' +
                                '<input type="text" class="form-control" placeholder="Label">' +
                                '<input name="link" type="text" class="form-control" placeholder="URL">' +
                                '<a href="#" class="btn btn-danger removelink">&times;</a>' +
                           '</div>');
            z++; //text box increment
        }
return false;
});

$("body").on("click",".removeclass", function(e){ //user click on remove text
        if( x > 1 ) {
                $(this).parent('div').remove(); //remove text box
                x--; //decrement textbox
        }
return false;
});

$("body").on("click",".removestep", function(e){ //user click on remove text
        if( y > 1 ) {
                $(this).parent('div').remove(); //remove text box
                y--; //decrement textbox
        }
return false;
});

$("body").on("click",".removelink", function(e){ //user click on remove text
        if( z > 1 ) {
                $(this).parent('div').remove(); //remove text box
                z--; //decrement textbox
        }
return false;
});

});