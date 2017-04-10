class BorrowersController < ApplicationController

  def index 
    @borrower = Borrower.find(session[:borrower_id])
    if session[:lender_id]
    @lender = Lender.find(session[:lender_id])
    end  
  
    @list = History.joins(:lender).where(borrower_id: session[:borrower_id])
  end   

  
  def create
  	borrower = Borrower.create(borrower_params)
  	if borrower.save
  		redirect_to :root
  	else 	
  		flash[:errors] = borrower.errors.full_messages
  		redirect_to :back
  	end	
  end

  def edit
  	@borrowers = borrower.find(params[:id])
  end	
  def destroy
    reset_session
    redirect_to "/login/index"
   end
  private
  def borrower_params
  	params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation, :need_money, :amount_needed, :description)
  end	
end
