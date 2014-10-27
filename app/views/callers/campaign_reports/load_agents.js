$('#call_centre_agent_ids option').each(function () {
    $(this).remove();
});

<% @call_centre_agents.each do |agent| %>
    var content = $("<option></option>").attr("value", "<%= agent.id %>").text("<%= agent.email %>")
    $("#call_centre_agent_ids").append(content);
<% end %>

$("#call_centre_agent_ids option").each(function() {
    $(this).attr("selected", "selected");
});
