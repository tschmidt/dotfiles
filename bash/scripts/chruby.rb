COMMS = %w(
  erb
  gem
  irb
  rake
  rdoc
  ri
  ruby
  testrb
).freeze.sort

cv = RUBY_VERSION.split('.')[0,2].join('.') == "1.9" ? "1.8" : "1.9"
COMMS.each do |c|
  `sudo unlink "/opt/local/bin/#{c}"` if File.exist?("/opt/local/bin/#{c}")
  `sudo link "/opt/local/bin/#{c}#{cv}" "/opt/local/bin/#{c}"`
end

puts "Current Ruby Version: #{`ruby -v`}"