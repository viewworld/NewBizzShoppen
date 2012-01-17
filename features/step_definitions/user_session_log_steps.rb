Given /^Count for model (.+) is equal (.+)$/ do |model, count|
  model.constantize.count.should == count.to_i
end

Given /^Last (.+) UserSessionLog is valid after create$/ do |type|
  usl = UserSessionLog.send("#{type}_type".to_sym).last
  usl.start_time.should <= (Time.now.utc + 3.seconds)
  usl.start_time.should >= (Time.now.utc - 6.seconds)
  usl.end_time.should <= (Time.now.utc + 5.minutes + 6.seconds)
  usl.end_time.should >= (Time.now.utc + 5.minutes - 6.seconds)
end

Given /^Last (.+) UserSessionLog is valid after close$/ do |type|
  usl = UserSessionLog.send("#{type}_type".to_sym).last
  usl.end_time.should <= (Time.now + 3.seconds)
  usl.end_time.should >= (Time.now - 3.seconds)
end

Given /^Last (.+) UserSessionLog is valid after invoke some controller action$/ do |type|
  usl = UserSessionLog.send("#{type}_type".to_sym).last
  usl.end_time.should <= (Time.now + 5.minutes + 3.seconds)
  usl.end_time.should >= (Time.now + 5.minutes - 3.seconds)
end
