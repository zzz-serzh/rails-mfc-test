require 'rails_helper'

RSpec.describe Address, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "объект создается"  do
    expect(Address.new(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)).to be_valid
  end

  it "mandatory zip code" do
   address = Address.new(zip:nil,country:"komi",settlement:"syk",street:"lenin","house":1)
   expect(address).to_not be_valid
  end

  it "mandatory country" do
   address = Address.new(zip:"123456",country:nil,settlement:"syk",street:"lenin","house":1)
   expect(address).to_not be_valid
  end

  it "mandatory settlement" do
   address = Address.new(zip:"123456",country:"komi",settlement:nil,street:"lenin","house":1)
   expect(address).to_not be_valid
  end

  it "mandatory street" do
   address = Address.new(zip:"123456",country:"komi",settlement:"syk",street:nil,"house":1)
   expect(address).to_not be_valid
  end

  it "mandatory house" do
   address = Address.new(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":nil)
   expect(address).to_not be_valid
  end

  it "zip code length" do
   long_zip = "s"*65
   address = Address.new(zip: long_zip,country:"komi",settlement:"syk",street:"lenin","house":1)
   expect(address).to_not be_valid
  end

  it "country length" do
   long_value = "s"*513
   address = Address.new(zip: "123456",country:long_value,settlement:"syk",street:"lenin","house":1)
   expect(address).to_not be_valid
  end

  it "district length" do
   long_value = "s"*513
   address = Address.new(district: long_value, zip: "123456",country:"komi",settlement:"syk",street:"lenin","house":1)
   expect(address).to_not be_valid
  end

  it "settlement length" do
   long_value = "s"*513
   address = Address.new(zip: "123456",country:"komi",settlement:long_value,street:"lenin","house":1)
   expect(address).to_not be_valid
  end

  it "street length" do
   long_value = "s"*1025
   address = Address.new(zip: "123456",country:"komi",settlement:"syk",street:long_value,"house":1)
   expect(address).to_not be_valid
  end

  it "house length" do
   long_value = "s"*65
   address = Address.new(zip: "123456",country:"komi",settlement:"syk",street:"lenin","house":long_value)
   expect(address).to_not be_valid
  end

  it "building length" do
   long_value = "s"*65
   address = Address.new(zip: "123456",country:"komi",settlement:"syk",street:"lenin","house":"1",building:long_value)
   expect(address).to_not be_valid
  end

  it "saves to db"  do
   # делается как то криво
   # посмотреть на
   # https://github.com/nemilya/rspec-datamapper-example
   DataMapper.setup(:lite, "sqlite3://#{Dir.pwd}/db/mfc_development.db")
   #DataMapper.setup(:lite, "sqlite3://db/mfc_test.db")
   #DataMapper.setup(:lite, 'sqlite::memory:')
   DataMapper.finalize
   DataMapper.repository(:lite).auto_migrate!
   
   DataMapper.repository(:lite) do
    @address = Address.new(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)
    expect(@address.save).to be_truthy
   end 
  end


end
