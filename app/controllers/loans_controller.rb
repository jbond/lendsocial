class LoansController < ApplicationController
  # GET /loans/new
  # GET /loans/new.json
  def new
    @loan = Loan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loan }
    end
  end

  # GET /loans/1/edit
  def edit
    @loan = Loan.find(params[:id])
    @loan[:loan_purpose_description] = @loan.loan_purpose.description
  end

  # POST /loans
  # POST /loans.json
  def create
  
  	params[:loan][:loan_purpose] = LoanPurpose.new( {:description => params[:loan][:loan_purpose_description]} )
    @loan = Loan.new( params[:loan] )

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
        format.json { render json: @loan, status: :created, location: @loan }
      else
        format.html { render action: "new" }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loans/1
  # PUT /loans/1.json
  def update
    @loan = Loan.find(params[:id])

    respond_to do |format|
      if @loan.update_attributes(params[:loan]) && @loan.loan_purpose.update_attributes( {:description => params[:loan][:loan_purpose_description]} )
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end
end