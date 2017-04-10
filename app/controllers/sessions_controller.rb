class SessionsController < ApplicationController
  

  def new 
  end 	
  def create
  		
    @lender = Lender.find_by_email(params[:email])
   
    if @lender && @lender.authenticate(params[:password])
      session[:lender_id] = @lender.id
      redirect_to '/lenders/main'
      
    elsif
      @borrower = Borrower.find_by_email(params[:email])
   
      if @borrower && @borrower.authenticate(params[:password])
        puts @borrower
      
      session[:borrower_id] = @borrower.id
      redirect_to '/borrowers/index'
      end
    else
      flash[:errors] = ["Invalid"]
      redirect_to '/logins/index'
    end
  end

  
end

