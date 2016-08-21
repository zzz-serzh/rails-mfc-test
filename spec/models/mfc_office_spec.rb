require 'rails_helper'

RSpec.describe MfcOffice, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "объект создается"  do

   v_yur_address = Address.new(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)
   v_actual_address = Address.new(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)
   

   expect(v_yur_address).to be_valid
   expect(v_actual_address).to be_valid   

   mfcOffice = MfcOffice.new(
	type: "back",
	esia: "123",
	name: "центральный",
	short_name: "центр",
	director: "Феофан Арнольдович Гогенмахер",
	ogrn: "1234567890123",
	kpp: "123456789",
	okogu: "1234567",
	okpo: "12345678",
	phone: "1234567890",
	site: "www.ru",
	email: "a@b.ru",
	"jur_address": v_yur_address,
	actual_address: v_actual_address
	)

   expect(mfcOffice).to be_valid
  end

end
