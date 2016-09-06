require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do

  let(:valid_attributes) {
    { name: Faker::Commerce.department, description: Faker::Lorem.sentence(3) }
  }

  let(:invalid_attributes) {
    { name: nil, description: Faker::Lorem.sentence(3) }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all departments as @departments" do
      department = FactoryGirl.create(:department)
      get :index, params: {}, session: valid_session
      expect(assigns(:departments)).to eq([department])
    end
  end

  describe "GET #show" do
    it "assigns the requested department as @department" do
      department = FactoryGirl.create(:department)
      get :show, params: {id: department.to_param}, session: valid_session
      expect(assigns(:department)).to eq(department)
    end
  end

  describe "GET #new" do
    it "assigns a new department as @department" do
      get :new, params: {}, session: valid_session
      expect(assigns(:department)).to be_a_new(Department)
    end
  end

  describe "GET #edit" do
    it "assigns the requested department as @department" do
      department = FactoryGirl.create(:department)
      get :edit, params: {id: department.to_param}, session: valid_session
      expect(assigns(:department)).to eq(department)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Department" do
        expect {
          post :create, params: {department: valid_attributes}, session: valid_session
        }.to change(Department, :count).by(1)
      end

      it "assigns a newly created department as @department" do
        post :create, params: {department: valid_attributes}, session: valid_session
        expect(assigns(:department)).to be_a(Department)
        expect(assigns(:department)).to be_persisted
      end

      it "redirects to the created department" do
        post :create, params: {department: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Department.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved department as @department" do
        post :create, params: {department: invalid_attributes}, session: valid_session
        expect(assigns(:department)).to be_a_new(Department)
      end

      it "re-renders the 'new' template" do
        post :create, params: {department: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "Tech"}
      }

      it "updates the requested department" do
        department = Department.create! valid_attributes
        put :update, params: {id: department.to_param, department: new_attributes}, session: valid_session
        department.reload
        expect(department.name).to eq("Tech")
      end

      it "assigns the requested department as @department" do
        department = Department.create! valid_attributes
        put :update, params: {id: department.to_param, department: valid_attributes}, session: valid_session
        expect(assigns(:department)).to eq(department)
      end

      it "redirects to the department" do
        department = Department.create! valid_attributes
        put :update, params: {id: department.to_param, department: valid_attributes}, session: valid_session
        expect(response).to redirect_to(department)
      end
    end

    context "with invalid params" do
      it "assigns the department as @department" do
        department = Department.create! valid_attributes
        put :update, params: {id: department.to_param, department: invalid_attributes}, session: valid_session
        expect(assigns(:department)).to eq(department)
      end

      it "re-renders the 'edit' template" do
        department = Department.create! valid_attributes
        put :update, params: {id: department.to_param, department: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested department" do
      department = Department.create! valid_attributes
      expect {
        delete :destroy, params: {id: department.to_param}, session: valid_session
      }.to change(Department, :count).by(-1)
    end

    it "redirects to the departments list" do
      department = Department.create! valid_attributes
      delete :destroy, params: {id: department.to_param}, session: valid_session
      expect(response).to redirect_to(departments_url)
    end
  end

end
