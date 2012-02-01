require 'ruby-carrot'

rc = RubyCarrot::VBCarrot.new("test@test.com", 1, "478c35ec24ff7621c1b2e932d367a41a")
puts(rc.balance)