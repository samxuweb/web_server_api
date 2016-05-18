json.status @status
json.info do
  json.completion_list @completions, :date, :complete if @completions
  json.currentday_list @completion, :total_time, :total_step, :distance, :calorie, :complete if @completion
end