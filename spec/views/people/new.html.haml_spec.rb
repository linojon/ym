require 'spec_helper'

describe "people/new.html.haml" do
  before(:each) do
    assign(:person, stub_model(Person,
      :last_name => "MyString",
      :first_name => "MyString",
      :middle_name => "MyString",
      :maiden => "MyString",
      :prefix => "Prefix",
      :suffix => "Suffix",
      :gender => "MyString"
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path, :method => "post" do
      assert_select "input#person_last_name", :name => "person[last_name]"
      assert_select "input#person_first_name", :name => "person[first_name]"
      assert_select "input#person_middle_name", :name => "person[middle_name]"
      assert_select "input#person_maiden", :name => "person[maiden]"
      assert_select "input#person_prefix", :name => "person[prefix]"
      assert_select "input#person_suffix", :name => "person[suffix]"
      assert_select "input#person_gender", :name => "person[gender]"
    end
  end
end
