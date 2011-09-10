require 'spec_helper'

describe "Pages", :type => :request do
  describe "/" do
    it "should be on the home page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/'
      current_path.should == '/'
    end
  end
  describe "GET /about" do
    it "should be on the About page" do
      visit '/about'
      current_path.should == '/about'
    end
  end
end
