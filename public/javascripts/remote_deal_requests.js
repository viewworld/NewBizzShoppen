//Functions for getting the deal for member via other user like agent
//Requires:
//rendered partial shared/remote_deal_requests/deals_selection


function select_deals_for_request(subscription_plan_id, requested_deal_ids, dest_field){
    $('#modal_remote_deal_requests_container').html(I18n.t("common.js.loading"));
    $.get('/remote_deal_requests.js', { subscription_plan_id: subscription_plan_id, requested_deal_ids: requested_deal_ids.split(","), dest_field: dest_field} );
    $('#modal_remote_deal_requests').dialog('open');
}

function set_deals_as_requested(dest_field){
    selected_deal_ids = [];
    $('input[type=checkbox][id^=deal_links]:checked').each(function(){
        selected_deal_ids.push($(this).val())
    });

    $('#' + dest_field).val(selected_deal_ids);
}

function display_deals_info_forms(user_id, requested_deal_ids){
    $.get('/remote_deal_requests/new.js', { user_id: user_id, requested_deal_ids: requested_deal_ids.toString().split(",") } );
    $('#modal_remote_deal_requests_info').dialog('open');
}