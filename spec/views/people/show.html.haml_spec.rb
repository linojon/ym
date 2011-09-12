require 'spec_helper'

describe "people/show.html.haml" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :last_name => "Last Name",
      :first_name => "First Name",
      :middle_name => "Middle Name",
      :maiden => "Maiden",
      :prefix => "Prefix",
      :suffix => "Suffix",
      :gender => "Gender"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Middle Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Maiden/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Prefix/)
    rendered.should match(/Suffix/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Gender/)
  end
end
