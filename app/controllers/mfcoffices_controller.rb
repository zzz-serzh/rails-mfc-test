class MfcofficesController < ApplicationController

 def new
 end

 def create
 
  #@v_yur_address = Address.create(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)
  #FIXME: перед созданием адреса пробовать его найти и использовать заново.
  @v_yur_address = Address.create(
	zip: params[:mfcoffice][:jur_address_zip],
	country: params[:mfcoffice][:jur_address_country],
	settlement: params[:mfcoffice][:jur_address_settlement],
	street: params[:mfcoffice][:jur_address_street],
	house: params[:mfcoffice][:jur_address_house])

  @v_actual_address = Address.create(
        zip: params[:mfcoffice][:actual_address_zip],
        country: params[:mfcoffice][:actual_address_country],
        settlement: params[:mfcoffice][:actual_address_settlement],
        street: params[:mfcoffice][:actual_address_street],
        house: params[:mfcoffice][:actual_address_house])


  #@v_actual_address = Address.create(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)
  
  # save проиходит при create
  #@v_yur_address.save()
  #@v_actual_address.save()
  
  #@mfcoffice = MfcOffice.new(params[:mfcoffice],@v_yur_address,@v_yur_address,@v_actual_address)
  #puts "aaaaaaaaaaaaaaaaaaaaaaaa-----------------------------"
  #puts params[:mfcoffice][:name]
 

   #FIXME: может можно как то поизящнее передать все параметры?
   @mfcoffice = MfcOffice.new(
        type: params[:mfcoffice][:type],
        esia: params[:mfcoffice][:esia],
        name: params[:mfcoffice][:name],
        short_name: params[:mfcoffice][:short_name],
        director: params[:mfcoffice][:director],
        ogrn: params[:mfcoffice][:ogrn],
        kpp: params[:mfcoffice][:kpp],
        okogu: params[:mfcoffice][:okogu],
        okpo: params[:mfcoffice][:okpo],
        phone: params[:mfcoffice][:phone],
        site: params[:mfcoffice][:site],
        email: params[:mfcoffice][:email],
        jur_address: @v_yur_address,
        actual_address: @v_actual_address
        )
   #puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
   #puts @mfcoffice.id
   #@mfcoffice.save

   if @mfcoffice.save
    #puts "ok"
    #puts @mfcoffice.id
    #puts @mfcoffice.name
   else
     @mfcoffice.errors.each do |e|
       puts e
    end
   end

  #@redirect_to @mfcoffice_url
  redirect_to(mfcoffice_path(@mfcoffice.id))
 end

 def show
  #puts params[:id]
  #наебалово! возвращает Enumerator
  #@mfcoffice = MfcOffice.find(params[:id])
  #FIXME: если вернул nil, то что будет?
  #@mfcoffice = MfcOffice.find(params[:id]).next

  #wtf получаю ошибку 
  #The number of arguments for the key is invalid, expected 3 but was 1
  # дока врет? у меня только один ключ
  #@mfcoffice = MfcOffice.get(params[:id])
  #FIXME: так делать неправильно(?) разобраться, почему не работает get
  @mfcoffice = MfcOffice.first(:id => params[:id])
 end

  def index
    @mfcoffices = MfcOffice.all
  end

end
