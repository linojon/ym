require 'spec_helper'

describe "Pages", :type => :request do
  describe "GET /" do
    it "is on the home page" do
      visit '/'
      current_path.should == '/'
    end
    it "supports js", :js => true do
      visit root_path
      click_link "test js"
      page.should have_content("js works")
    end
  end
  describe "GET /about" do
    it "is on the About page" do
      visit '/about'
      current_path.should == '/about'
    end
    it "contains stuff" do
      visit about_path
      page.should have_content('Stuff.')
    end
  end
end
