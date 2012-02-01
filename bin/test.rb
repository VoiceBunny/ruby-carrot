require 'ruby-carrot'

rc = RubyCarrot::VBCarrot.new("testjorge@test.com", 85, "de52c722a40ea875ce89ae134a9ad66071144f5e")
puts("Cantidad de Dinero:" + rc.balance['balance']['amount'].to_s)