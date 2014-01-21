SELECT agent_timesheets_value.user_id,
   sum(agent_timesheets_value.value) AS sum,
   agent_timesheets_value.created_at
FROM agent_timesheets_value
GROUP BY agent_timesheets_value.user_id, agent_timesheets_value.created_at;
