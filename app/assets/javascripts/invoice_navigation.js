$(document).ready(
    function () {
        $('#invoice_creation_date').change(function() {
            $('#invoice_sale_date').attr('value',$('#invoice_creation_date').attr('value'));
            fixDeadlineDate($('#invoice_sale_date').attr('value'));
        });
        $('#invoice_sale_date').change(function() {
            fixDeadlineDate($('#invoice_sale_date').attr('value'));
        });
        $('#check_all_invoice_lines').click(function(){
           var checked_status = this.checked;            
           $('input[scope$="invoice_line_payable_update"]').each(function()
           {
            this.checked = checked_status;
            addIdToPayablesSet(this);
           });
        })

    }
);

function fixDeadlineDate(date){
    $('#invoice_payment_deadline_date').attr('value',addDays(new Date(date),14));

}

function addDays(myDate,days) {
    var da = new Date(myDate.getTime() + days*24*60*60*1000);
    var dy = da.getFullYear();	// Get full year (as opposed to last two digits only)
    var dm = da.getMonth() + 1;	// Get month and correct it (getMonth() returns 0 to 11)
    var dd = da.getDate();	// Get date within month
    if ( dy < 1970 ) dy = dy + 100;	// We still have to fix the millennium bug
    var ys = new String(dy);	// Convert year, month and date to strings
    var ms = new String(dm);
    var ds = new String(dd);
    if ( ms.length == 1 ) ms = "0" + ms;	// Add leading zeros to month and date if required
    if ( ds.length == 1 ) ds = "0" + ds;
    ys = ys + "-" + ms + "-" + ds;
    return ys;
}

function extendedNavigation(event){
    if(!event.target){
        return;
    }
    var this_id = event.target.id;
    var scope = $('#'+event.target.id).attr('scope');
    // this is in case of up arrow on keyboard
    if(event.which == '38'){
        $('#'+findPrevId(this_id,scope)).focus()
    }
    // this is in case of down arrow on keyboard
    if(event.which == '40'){
        $('#'+findNextId(this_id,scope)).focus();       
    }
    // this is in case of Tab key on keyboard
    // if this is last netto value field
    if(event.which == '9'){
        if(scope=='invoice_line_brutto_value'){
            if(findNextId(this_id,scope)==this_id){
                recalcBruttoValues();
                $("#add_fields_invoice_lines").click();
            }
        }
    }
}

function findNextId(this_id, scope){
    var next_id = this_id;
    var next_found = false;
    var next_seen = false;
    $('input[scope$="'+scope+'"]').each(function(){
       if($(this).is(":visible")){
           if(!next_found ){
             if(next_seen){
               next_id = $(this).attr("id");
               next_found = true;
             }else{
               if($(this).attr('id')==this_id){
                   next_seen = true;
               }
             }
           }
       }
    });
    return next_id;
}

function findPrevId(this_id, scope){
    var prev_id = this_id;
    var prev_found = false;

    $('input[scope$="'+scope+'"]').each(function(){
        if($(this).is(":visible")){
           if(!prev_found){
              if($(this).attr("id")==this_id){
                  prev_found = true;
              }else{
                  prev_id = $(this).attr("id");
              }
           }
        }
    });
    return prev_id;
}