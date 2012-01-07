class PeopleController < ApplicationController
  respond_to :html, :json, :datatables
  
  #expose(:people) { Person.paginate( :page => (params[:page] || 1), :per_page => 10 ) }
  # expose(:people) { Person.search(params[:search]).paginate(:page => (params[:page] || 1), :per_page=>params[:per_page]) }
  expose(:people) { Person.search(params[:search]).relation }
  expose(:person)
  
  def index
    respond_with people
  end
  def search
    #respond_with people, :locals => {:collection => people}
    # @people = Person.search(params[:search]).paginate(:page => params[:page], :per_page => params[:per_page]).relation
    @people = Person.search(params[:search]).relation
    respond_with @people, :locals => { :collection => @people }
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
