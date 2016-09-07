require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do

  let(:valid_attributes) {
    {
      name: Faker::Commerce.name,
      role: 'staff',
      age: 29,
      gender: 'male',
      phone: Faker::PhoneNumber.cell_phone,
      address: Faker::Address.street_address,
      departments: []
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      role: 'staff',
      age: 29,
      gender: 'male',
      phone: Faker::PhoneNumber.cell_phone,
      address: Faker::Address.street_address,
      departments: []
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all employees as @employees" do
      employee = FactoryGirl.create :employee, valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:employees)).to eq([employee])
    end
  end

  describe "GET #show" do
    it "assigns the requested employee as @employee" do
      employee = FactoryGirl.create :employee, valid_attributes
      get :show, params: {id: employee.to_param}, session: valid_session
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe "GET #new" do
    it "assigns a new employee as @employee" do
      get :new, params: {}, session: valid_session
      expect(assigns(:employee)).to be_a_new(Employee)
    end
  end

  describe "GET #edit" do
    it "assigns the requested employee as @employee" do
      employee = FactoryGirl.create :employee, valid_attributes
      get :edit, params: {id: employee.to_param}, session: valid_session
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Employee" do
        expect {
          post :create, params: {employee: valid_attributes}, session: valid_session
        }.to change(Employee, :count).by(1)
      end

      it "assigns a newly created employee as @employee" do
        post :create, params: {employee: valid_attributes}, session: valid_session
        expect(assigns(:employee)).to be_a(Employee)
        expect(assigns(:employee)).to be_persisted
      end

      it "redirects to the created employee" do
        post :create, params: {employee: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Employee.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved employee as @employee" do
        post :create, params: {employee: invalid_attributes}, session: valid_session
        expect(assigns(:employee)).to be_a_new(Employee)
      end

      it "re-renders the 'new' template" do
        post :create, params: {employee: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "andrew" }
      }

      it "updates the requested employee" do
        employee = FactoryGirl.create :employee, valid_attributes
        put :update, params: {id: employee.to_param, employee: new_attributes}, session: valid_session
        employee.reload
        expect(employee.name).to eq("andrew")
      end

      it "assigns the requested employee as @employee" do
        employee = FactoryGirl.create :employee, valid_attributes
        put :update, params: {id: employee.to_param, employee: valid_attributes}, session: valid_session
        expect(assigns(:employee)).to eq(employee)
      end

      it "redirects to the employee" do
        employee = FactoryGirl.create :employee, valid_attributes
        put :update, params: {id: employee.to_param, employee: valid_attributes}, session: valid_session
        expect(response).to redirect_to(employee)
      end
    end

    context "with invalid params" do
      it "assigns the employee as @employee" do
        employee = FactoryGirl.create :employee, valid_attributes
        put :update, params: {id: employee.to_param, employee: invalid_attributes}, session: valid_session
        expect(assigns(:employee)).to eq(employee)
      end

      it "re-renders the 'edit' template" do
        employee = FactoryGirl.create :employee, valid_attributes
        put :update, params: {id: employee.to_param, employee: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested employee" do
      employee = FactoryGirl.create :employee, valid_attributes
      expect {
        delete :destroy, params: {id: employee.to_param}, session: valid_session
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      employee = FactoryGirl.create :employee, valid_attributes
      delete :destroy, params: {id: employee.to_param}, session: valid_session
      expect(response).to redirect_to(employees_url)
    end
  end

end
