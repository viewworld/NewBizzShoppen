$('#subscription_plan_automatic_downgrade_subscription_plan_id option').each(function () {
    if ($(this).text() != "") {
        $(this).remove();
    }
});

<% @subscription_plans.each do |sp| %>
    var content = $("<option></option>").attr("value", "<%= sp.id %>").text("<%= sp.name %>");
    $('#subscription_plan_automatic_downgrade_subscription_plan_id').append(content);
<% end %>
