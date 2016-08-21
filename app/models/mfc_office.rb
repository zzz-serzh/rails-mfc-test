class MfcOffice

  include DataMapper::Resource

  property :id, Serial
  #график работы.
  #TODO: вынести в отдельный класс? Как эта штука заводится? уточнить
  #property :schedule, String, :length => 128, :required => true

  # категория: бэк или фронт. Может завести общий класс [Справочник]?
  property :type, String, :length => 32, :required => true
  validates_within :type, :set => ['back','front']

  #Регистрационный номер ЕСИА
  property :esia, String, :length => 128, :required => true

  #Реквизиты центра (офиса)
  #Наименование офиса
  property :name, String, :length => 256, :required => true
  #Краткое наименование офиса
  property :short_name, String, :length => 128, :required => true
  #Директор
  property :director, String, :length => 256, :required => true
  #ОГРН
  property :ogrn, String, :length => 13, :required => true
  validates_format_of :ogrn, :with => /^[0-9]{13}$/

  #КПП
  property :kpp, String, :length => 9, :required => true
  validates_format_of :kpp, :with => /^[0-9]{9}$/
  #ОКОГУ
  property :okogu, String, :length => 7, :required => true
  validates_format_of :okogu, :with => /^[0-9]{7}$/
  #ОКПО
  property :okpo, String, :length => 8, :required => true
  validates_format_of :okpo, :with => /^[0-9]{8}$/

  #Юридический адрес  
  #has 1, :address, :required => true
  belongs_to :jur_address, 'Address', :key => true

  #Фактический адрес
  #has 1, :address, :required => true
  belongs_to :actual_address, 'Address', :key => true

  #Телефон
  property :phone, String, :length => 10, :required => true
  validates_format_of :phone, :with => /^[0-9]{10}$/
  #Сайт
  property :site, String, :length => 256 
  #Электронная почта
  property :email, String, :format => :email_address


end
