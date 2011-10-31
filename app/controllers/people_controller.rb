class PeopleController < ApplicationController
  respond_to :html, :json
  
  expose(:people) { Person.all }
  expose(:person)
  
  def index
    respond_with people
  end

  def show
    respond_with person
  end

  def new
    respond_with person
  end

  def edit
    respond_with person
  end

  def create
    if person.save
      flash[:notice] = 'Person was successfully created.' 
    else
      flash[:error] = 'Person could not be saved. Please check your input.'
    end
    respond_with person
  end

  def update
    if person.update_attributes(params[:person])  
      flash[:notice] = 'Person was successfully updated.'
    else
      flash[:error] = 'Person could not be saved. Please check your input.'
    end  
    respond_with person 
  end  

  def destroy
    person.destroy
    flash[:notice] = 'Person was successfully deleted.'
    respond_with person 
  end
end
