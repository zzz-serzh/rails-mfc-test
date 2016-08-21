require 'rails_helper'

RSpec.describe MfcOffice, :type => :model do

 before(:each) do
   #@v_yur_address = Address.new(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)
   #@v_actual_address = Address.new(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)

   DataMapper.setup(:lite, "sqlite3://#{Dir.pwd}/db/mfc_development.db")
   DataMapper.finalize
   DataMapper.repository(:lite).auto_migrate!


   DataMapper.repository(:lite) do
    @v_yur_address = Address.create(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)
    @v_actual_address = Address.create(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)
   end

  end

  #pending "add some examples to (or delete) #{__FILE__}"

  it "объект создается"  do

   #expect(@v_yur_address).to be_valid
   #expect(@v_actual_address).to be_valid   

   # почему я не могу создать MfcOffice без записи Address в базу?
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
	jur_address: @v_yur_address,
	actual_address: @v_actual_address
	)


   #mfcOffice.jur_address = v_yur_address
   #mfcOffice.actual_address = v_actual_address
   expect(mfcOffice).to be_valid
  end

  it "type not in list"  do

   mfcOffice = MfcOffice.new(
        type: "badtype",
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
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )

   #mfcOffice.jur_address = v_yur_address
   #mfcOffice.actual_address = v_actual_address
   expect(mfcOffice).to_not be_valid

  end

  it "esia is mandatory"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: nil,
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
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )

   expect(mfcOffice).to_not be_valid
  end

  it "esia too long"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "1"*129,
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
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "name is null"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: nil,
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "name is too long"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "1"*257,
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "short_name is null"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: nil,
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "short_name is too long"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "1"*129,
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "director is null"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: nil,
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "director is too long"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "1"*257,
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "ogrn is null"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: nil,
        kpp: "123456789",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "ogrn is too long"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1"*14,
        kpp: "123456789",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "ogrn is not a number"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "_23456789012_",
        kpp: "123456789",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "ogrn is too short"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1"*12,
        kpp: "123456789",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "kpp is null"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: nil,
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "kpp is too long"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "1"*10,
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "kpp is too short"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "1"*8,
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "kpp is not a number"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "_2345678_",
        okogu: "1234567",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "okogu is null"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: nil,
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "okogu is too long"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1"*8,
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "okogu is too short"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1"*6,
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "okogu is not a number"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "_23456_",
        okpo: "12345678",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "okpo is null"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1234567",
        okpo: nil,
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "okpo is too long"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1234567",
        okpo: "1"*9,
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "okpo is too short"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1234567",
        okpo: "1"*7,
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "okpo is not a number"  do

   mfcOffice = MfcOffice.new(
        type: "back",
        esia: "123",
        name: "центральный",
        short_name: "центр",
        director: "Феофан Арнольдович Гогенмахер",
        ogrn: "1234567890123",
        kpp: "123456789",
        okogu: "1234567",
        okpo: "1234567F",
        phone: "1234567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "jur_address is null"  do

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
        jur_address: nil,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "actual_address is null"  do

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
        jur_address: @v_yur_address,
        actual_address: nil
        )
   expect(mfcOffice).to_not be_valid
  end


  it "phone is null"  do

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
        phone: nil,
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "phone is too long"  do

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
        phone: "1"*11,
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "phone is too short"  do

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
        phone: "1"*9,
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "phone is not a number"  do

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
        phone: "(2)4567890",
        site: "www.ru",
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "site can be null"  do

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
        site: nil,
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to be_valid
  end

  it "site is too long"  do

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
        site: "1"*257,
        email: "a@b.ru",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end

  it "email can be null"  do

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
        email: nil,
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to be_valid
  end

  it "email must be valid"  do

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
        email: "a@eu",
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   expect(mfcOffice).to_not be_valid
  end


end

