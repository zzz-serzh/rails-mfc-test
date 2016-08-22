class MfcofficesController < ApplicationController

 def new
 end

 def create
 
  @v_yur_address = Address.create(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)
  @v_actual_address = Address.create(zip:"123456",country:"komi",settlement:"syk",street:"lenin","house":1)
  
  @v_yur_address.save()
  @v_actual_address.save()
  
  #@mfcoffice = MfcOffice.new(params[:mfcoffice],@v_yur_address,@v_yur_address,@v_actual_address)
  #puts "aaaaaaaaaaaaaaaaaaaaaaaa-----------------------------"
  #puts params[:mfcoffice][:name]

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
  #наебалово! возвращает Enumerator
  #@mfcoffice = MfcOffice.find(params[:id])
  @mfcoffice = MfcOffice.find(params[:id]).next
 end

  def index
    @mfcoffices = MfcOffice.all
  end

end
