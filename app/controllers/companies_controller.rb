class CompaniesController < ApplicationController
  def index
    @companies = Company.all.page params[:page]
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
   
    if @company.update(company_params)
      redirect_to companies_path
    else
      @errors = @company.errors
      render :show
    end
  end

	def create
    @company = Company.new(company_params)

    if @company.valid?
      @company.save
      flash[:success] = "Company created"
      redirect_to companies_path
    else
      @errors = @company.errors
      render :new
    end
	end

  private
  def company_params
    params.require(:company).permit(:name, :contact)
  end
end
