class EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :departments

  def index
    group_by = params[:group_by]
    @employees = Employee.includes(:department).all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end


  def create
    @employee = Employee.create(employee_attributes)
    if @employee.save
      redirect_to employees_path
    else
      flash[:notice] = @employee.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @employee = Employee.update_attributes(employee_attributes)
    @employee.save
  end

  def destroy
    Employee.find(params[:id]).destroy
  end

  private
    def employee_attributes
      params.require(:employee).permit(:badge_id, :first_name, :last_name, :department_id)
    end

    def departments
      @departments = Department.all
    end
end
