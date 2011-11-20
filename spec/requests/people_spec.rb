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
    
    it "allows birth year from today back to 200 years ago" do
      visit '/people/new'
      select_year('Birth date', :with => Time.now.year)
      select_year('Birth date', :with => Time.now.year-200)
    end
    
    it "allows death year back to 200 years ago" do
      visit '/people/new'
      select_year('Death date', :with => Time.now.year)
      select_year('Death date', :with => Time.now.year-200)
    end
    
    it "allows hebrew death date" do
      visit '/people/new'
      select(:person_death_hebrew_date_day, :with => 16)
      select(:person_death_hebrew_date_month, :with => 'Av')
      select(:person_death_hebrew_date_year, :with => 5760)
    end
  end
  
  #------------------------
  describe "PUT /people/create" do
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

    describe "death hebrew date" do
      it "can set from form" do
        fill_in 'First Name', :with => 'Josh'
        fill_in 'Last Name', :with => 'Cohen'
        select '16', :from => 'person_death_hebrew_date_day'
        select 'Av', :from => 'person_death_hebrew_date_month'
        select '5760', :from => 'person_death_hebrew_date_year'
        click_button 'Create Person'
        page.should have_content("Yahrzeit: 16 Av 5760")
      end
    end
  end
  
  #------------------------
  describe "POST /people/1/update" do
    let!(:person) { Factory(:person, :death_hebrew_date_day => 16, :death_hebrew_date_month => 'Av', :death_hebrew_date_year => 5760) }
    before :each do
      visit '/people/1/edit'
    end
    describe "death hebrew date" do
      it "can set from form" do
        select '17', :from => 'person_death_hebrew_date_day'
        select 'Elul', :from => 'person_death_hebrew_date_month'
        select '5761', :from => 'person_death_hebrew_date_year'
        click_button 'Update Person'
        page.should have_content("Yahrzeit: 17 Elul 5761")
      end
    end
  end
end
