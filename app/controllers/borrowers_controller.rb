class BorrowersController < ApplicationController

  def index
    @borrower = Borrower.find_by(session[:borrower_user])
    @borrowers= Borrower.all
    @balance = "1000" 
    @balance_raised = "0"
    
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
