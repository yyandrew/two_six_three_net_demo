class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all.includes(:departments)
    respond_to do |format|
      format.html
      format.json { render json: @employees.map(&:json) }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @employee.json }
    end
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    department_ids = employee_params.delete("departments")
    @employee = Employee.new(employee_params.except(:departments))

    respond_to do |format|
      if @employee.save
        @employee.departments = Department.where(id: department_ids)
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      department_ids = employee_params.delete("departments")
      if @employee.update(employee_params.except(:departments))
        @employee.departments = Department.where(id: department_ids)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :role, :age, :gender, :phone, :address, :departments => [])
    end
end
