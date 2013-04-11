class EmployeesController < ApplicationController

  def index
    #@employees = Employee.all
    @employees = Employee.page(params[:page]).per_page(12)
  end

  def new
    @employee = Employee.new
    @employee.build_employee_profile
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      redirect_to employees_url
    else
      flash.now[:errors] = @employee.errors.full_messages
      render :new
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.attributes = params[:employee]
    if @employee.save
      redirect_to employee_url(@employee)
    else
      flash.now[:errors] = @employee.errors.full_messages
      render :edit
    end
  end
end
