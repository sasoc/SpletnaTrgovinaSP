require 'watir-webdriver'


browser = Watir::Browser.new :chrome

puts browser.goto 'http://localhost:3000'



browser.link(:text =>"Log in").click
browser.div(:id => "login").present?
#failed login
browser.text_field(:id => "user_email").set('test@testas.si')
browser.text_field(:id => "user_password").set('12345678')
browser.form(:id,'login-form').submit
puts "Login failed :" +browser.text_field(:id => "user_email").present?.to_s

#successful login
browser.text_field(:id => "user_email").set('test@test.si')
browser.text_field(:id => "user_password").set('12345678')
browser.form(:id,'login-form').submit
puts "Login successful: " + (!browser.text_field(:id => "user_email").present?).to_s

#users records acces
browser.link(:text =>"Profile").click
puts "Access to user's records successful: " +(browser.div(:class => "main-body").present?).to_s


#edit own record
browser.link(:text =>"Edit").click
puts "Access to edit record successful: " +(browser.div(:class => "main-body").present?).to_s

#acces to new PL and CD
browser.link(:text =>"Add PL").click
puts "Access to new PL record successful: " +(browser.div(:class => "main-body").present?).to_s
browser.link(:text =>"Add CD").click
puts "Access to new CD record successful: " +(browser.div(:class => "main-body").present?).to_s



#deny access to edit other user's record
browser.goto 'http://localhost:3000/records/1/edit'
puts "Access to edit other user's record denied: " +(!browser.div(:class => "main-body").present?).to_s

#deny access for admin only page
browser.goto 'http://localhost:3000/records/all'
puts "Access to all records(admin only) denied: " +(!browser.div(:class => "main-body").present?).to_s
















