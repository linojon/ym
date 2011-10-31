require 'spec_helper'

describe "People" do
  #------------------------
  describe "GET /people" do
    let!(:person1) { Factory(:person) }
    let!(:person2) { Factory(:person) }
    
    it "shows list of yahrzeits" do
      visit '/people'
      page.should have_content(person1.last_name)
      page.should have_content(person2.last_name)
    end
  end
  
  #------------------------
  describe "GET /people/new" do
    it "has select list of name prefix" do
      visit '/people/new'
      %w{ Ms Miss Mrs Mr Dr Atty Prof Hon Gov Ofc }.each do |prefix|
        select(prefix, :from => 'Prefix')
      end
    end
    
    it "has select list of genders" do
      visit '/people/new'
      select('Male', :from => 'Gender')
      select('Female', :from => 'Gender')
    end
    
    it "allows birth year from today back to 1800" do
      visit '/people/new'
      select_year('Birth date', :with => Time.now.year)
      select_year('Birth date', :with => 1800)
    end
    
    it "allows death year back to 1800" do
      visit '/people/new'
      select_year('Death date', :with => Time.now.year)
      select_year('Death date', :with => 1800)
    end
  end
  
  #------------------------
  describe "GET /people/create" do
    before :each do
      visit '/people/new'
    end
    
    it "allows blank dates" do
      fill_in 'First Name', :with => 'Josh'
      fill_in 'Last Name', :with => 'Cohen'
      click_button 'Create Person'
      person = Person.last
      person.birth_date.should be_blank
      person.death_date.should be_blank
    end
  
    describe "shows validation error" do
      it "when missing first name" do
        click_button 'Create Person'
        #save_and_open_page
        within("#flash_error") do
          page.should have_content("Person could not be saved. Please check your input.")
        end
        within_input_for "First Name" do
         page.should have_content("can't be blank")
        end 
      end
    
      it "when missing last name" do
        click_button 'Create Person'
        within("#flash_error") do
          page.should have_content("Person could not be saved. Please check your input.")
        end
        within_input_for "Last Name" do
         page.should have_content("can't be blank")
        end 
      end
    
      it "when last name is only one char" do
        fill_in 'Last Name', :with => 'c'
        click_button 'Create Person'
        within("#flash_error") do
          page.should have_content("Person could not be saved. Please check your input.")
        end
        within_input_for "Last Name" do
         page.should have_content("is too short (minimum is 2 characters)")
        end 
      end
      
     it "when names are not properly formed" do
       # not going to check everything, the proper_name validation is a unit test
       fill_in "Last Name", :with => 'Ab2c'
       click_button 'Create Person'
       within("#flash_error") do
         page.should have_content("Person could not be saved. Please check your input.")
       end
       within_input_for "Last Name" do
        page.should have_content("is not a proper name format")
       end 
      end
      
      it "when death date is before birth date" do
        fill_in 'First Name', :with => 'Josh'
        fill_in 'Last Name', :with => 'Cohen'
        select_date 'Birth date', :with => '1960-1-1'
        select_date 'Death date', :with => '1959-1-1'
        click_button 'Create Person'
        within("#flash_error") do
          page.should have_content("Person could not be saved. Please check your input.")
        end
        within_input_for "Death date" do
         page.should have_content("can't be before birth date")
        end 
      end
    end
    
    # JAVASCRIPT VALIDATIONS
    describe "shows client side validations", :js => true do
      it "when missing first name" do
        #click_button 'Create Person'
        fill_in 'First Name', :with => ''
        within_input_for "First Name" do
         page.should have_content("can't be blank")
        end 
      end

      it "when missing last name" do
        fill_in 'Last Name', :with => ''
        within_input_for "Last Name" do
         page.should have_content("can't be blank")
        end 
      end

      it "when last name is only one char" do
        fill_in 'Last Name', :with => 'c'
        within_input_for "Last Name" do
         page.should have_content("is too short (minimum is 2 characters)")
        end 
      end
      
      it "when names are not properly formed" do
        # TODO: unit test the javascript validator as thoroughly as the ruby one
        fill_in "Last Name", :with => 'Ab2c'
        within_input_for "Last Name" do
         page.should have_content("is not a proper name format")
        end 
        fill_in "Last Name", :with => 'Ab+c'
        within_input_for "Last Name" do
         page.should have_content("is not a proper name format")
        end 
        # not fail on leading/trailing spaces
        fill_in "Last Name", :with => ' abc '
        within_input_for "Last Name" do
         page.should_not have_content("is not a proper name format")
        end 
       end
      
    end
  end
end
