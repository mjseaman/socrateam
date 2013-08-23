# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
agent = Mechanize.new
agent.get("http://socrates.devbootcamp.com/login")

login_form = agent.page.forms[0]

# login_form[0]

login_form["email"] = "mitchel.seaman@gmail.com"
login_form["password"] = "NachoCheese"
login_form.submit

# 733
(1..733).each do |num|

	result = {}

	begin
		agent.get("http://socrates.devbootcamp.com/users/#{num}")
	rescue Mechanize::ResponseCodeError
		print "x"
	else
		result[:cohort] = agent.page.parser.css('ul.breadcrumb li')[1].content.strip.gsub(/\n\//,"")

		result[:name] = agent.page.parser.css('ul.breadcrumb li')[2].content.strip

		result[:dbc_id] = num

		agent.page.parser.css('dl dd a').size.times do |index|
			key = agent.page.parser.css('dl dt')[index].content
			value = agent.page.parser.css('dl dd')[index].content
			result[key.downcase.gsub(/\s/, "_").to_sym] = value
		end

		Boot.create(result)

		print "."

	end
end