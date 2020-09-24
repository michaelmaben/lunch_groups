class EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    group_by = params[:group_by]
    # @employees = Employee.includes(:department).sales if group_by == 'dept'
    @employees = Employee.includes(:department).all
  end

  def show
    @employee = Employee.find(params[:id])
    # render json: @employee
  end

  def create
    @employee = Employee.create(employee_attributes)
    @employee.save
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
end
