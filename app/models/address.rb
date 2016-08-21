class Address
  # частично стырено из UVIS\lib\mfc\address.rb
  # по уму надо делать единый модуль для работы с адресами
  # пилить в нем иерархию и использовать везде
  include DataMapper::Resource
  
  # id
  property :id, Serial, :key => true
  # индекс
  property :zip, String, :length => 64, :required => true
  # регион 
  property :country, String, :length => 512, :required => true
  # район
  property :district, String, :length => 512
  # населенный пункт
  property :settlement, String, :length => 512, :required => true
  # улица
  property :street, String, :length => 1024, :required => true
  # дом
  property :house, String, :length => 64, :required => true
  # корпус
  property :building, String, :length => 64
  # не требуется в юр адресе
  #property :appartment, String, :length => 64

end
