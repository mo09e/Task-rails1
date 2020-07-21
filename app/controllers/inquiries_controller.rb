class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end
  def create
    @inquiry = Inquiry.new(inquiry_params)
    # @inquiry.create(inquiry_params)
       if @inquiry.save
         redirect_to new_inquiry_path
         flash[:notice] = "お問い合わせを受け付けました"
       else
         render :new
       end
  end

  # Strong Parameters
  private
  def inquiry_params
   params.require(:inquiry).permit(:name, :email, :content)
  end
end
