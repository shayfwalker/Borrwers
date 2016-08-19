class LendersController < ApplicationController
  def index
  end  

  def main
    @lender = Lender.find(session[:lender_id])
    @lenders= Lender.all
    @borrowers= Borrower.all
    # @count = 200
    # @balance_raised= 0
  end 

  def create
  	lender = Lender.create(lender_params)
  	if lender.save
  		redirect_to :root
  	else 	
  		flash[:errors] = lender.errors.full_messages
  		redirect_to :back
  	end	
  end

  def edit
  	@lenders = Lender.find(params[:id])
  end	
  def destroy
    reset_session
    redirect_to "/logins/index"
   end
  private
  def lender_params
  	params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation, :money)
  end	
end
