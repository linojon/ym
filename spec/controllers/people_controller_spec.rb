require 'spec_helper'

describe PeopleController do
  
  let!(:person) { Factory(:person) }
  
  def valid_attributes
    Factory.attributes_for(:person)
  end
  def invalid_attributes
    {:last_name => ''}
  end

  describe "GET index" do
    it "has people" do
      get :index
      controller.people.should eq([person])
    end
  end

  describe "GET show" do
    it "has person" do
      get :show, :id => person.id.to_s
      controller.person.should eq(person)
    end
  end

  describe "GET new" do
    it "has new person" do
      get :new
      controller.person.should be_a_new(Person)
    end
  end

  describe "GET edit" do
    it "assigns the requested person as @person" do
      get :edit, :id => person.id.to_s
      controller.person.should eq(person)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Person" do
        expect {
          post :create, :person => valid_attributes
        }.to change(Person, :count).by(1)
      end

      it "has a newly created person" do
        post :create, :person => valid_attributes
        controller.person.should be_a(Person)
        controller.person.should be_persisted
      end

      it "redirects to the created person" do
        post :create, :person => valid_attributes
        response.should redirect_to(Person.last)
      end
    end

    describe "with invalid params" do
      it "has a newly created but unsaved person" do
        # Trigger the behavior that occurs when invalid params are submitted
        Person.any_instance.stub(:save).and_return(false)
        post :create, :person => {}
        controller.person.should be_a_new(Person)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        # NOTE respond_with seems to ignore these stubs, just allow required fields to fail
        # Person.any_instance.stub(:save).and_return(false)
        # Person.any_instance.stub(:valid?).and_return(false)
        post :create, :person => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested person" do
        attrs = {'first_name' => 'Newname'}
        Person.any_instance.should_receive(:update_attributes).with(attrs)
        put :update, :id => person.id, :person => attrs
      end

      it "has the requested person" do
        put :update, :id => person.id, :person => valid_attributes
        controller.person.should eq(person)
      end

      it "redirects to the person" do
        put :update, :id => person.id, :person => valid_attributes
        response.should redirect_to(person)
      end
    end

    describe "with invalid params" do
      it "has the person" do
        put :update, :id => person.id.to_s, :person => invalid_attributes
        controller.person.should eq(person)
      end

      it "re-renders the 'edit' template" do
        put :update, :id => person.id.to_s, :person => invalid_attributes
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested person" do
      expect {
        delete :destroy, :id => person.id.to_s
      }.to change(Person, :count).by(-1)
    end

    it "redirects to the people list" do
      delete :destroy, :id => person.id.to_s
      response.should redirect_to(people_url)
    end
  end

end
