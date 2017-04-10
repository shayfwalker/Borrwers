class HistoriesController < ApplicationController
 def create

 		# render :json => session[:user_id]
		amount = params[:amount].to_i
		lender = Lender.find(params[:lender])
		borrower = Borrower.find(params[:borrower])
		history = History.new(amount: amount, lender_id: params[:lender], borrower_id: params[:borrower])
		
		if history.save

			borrower.update_attribute("raised", borrower.raised.to_i + amount)
			lender.update_attribute("money", lender.money.to_i - amount)
			borrower.update_attribute("amount_needed", borrower.amount_needed.to_i - amount)
			redirect_to :back
		else 
			flash[:errors] = history.errors.full_messages
			redirect_to "lenders/main"
		end			
	end

end
# \\\borrow.raised + amount 
# lender.amount - amount