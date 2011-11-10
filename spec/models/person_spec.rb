require 'spec_helper'

describe Person do
  describe "last_name" do
    it "must be > 1 character" do
      Factory.build(:person, :last_name => 'A').should_not be_valid
    end
   it_should_behave_like "a proper name", Factory.build(:person), :last_name
  end
  describe "first_name" do
    it_should_behave_like "a proper name", Factory.build(:person), :first_name
  end
  describe "middle_name" do
    it_should_behave_like "a proper name", Factory.build(:person), :middle_name
  end
  describe "maiden" do
    it_should_behave_like "a proper name", Factory.build(:person), :maiden
  end
  describe "gender" do
    it "only allows 'male' and 'female'" do
      Factory.build(:person, :gender => 'male').should be_valid
      Factory.build(:person, :gender => 'female').should be_valid
      Factory.build(:person, :gender => 'foo').should_not be_valid      
    end
    it "is not required" do
      Factory.build(:person, :gender => '').should be_valid
      Factory.build(:person, :gender => nil).should be_valid
    end
  end
  describe "prefix" do
    it "only allows stanard prefixes" do
      %w{ Ms Miss Mrs Mr Dr Atty Prof Hon Gov Ofc Rabbi Cantor }.each do |prefix|
        Factory.build(:person, :prefix => prefix).should be_valid
      end
    end
    it "is not required" do
      Factory.build(:person, :prefix => '').should be_valid
      Factory.build(:person, :prefix => nil).should be_valid
    end
  end
  describe "death date" do
    it "cannot be before birth date" do
      person = Factory.build(:person)
      person.death_date = person.birth_date - 1.day
      person.should_not be_valid
      person.errors[:death_date].should include("can't be before birth date")
    end
  end
  describe "yahrzeit" do
    # ref: http://www.hebcal.com/converter
    it "is a hebdate" do
      person = Factory.create(:person, :death_date => "2000/08/17")
      person.yahrzeit.class.should == Hebruby::HebrewDate
    end
  end
  describe "yahrzeit_to_s" do
    let(:person) { Factory.create(:person, :death_date => "2000/08/17") }
    
    it "displays day month year" do
      person.yahrzeit_to_s.should == "16 Av 5760"
    end
    it "displays day month" do
      person.yahrzeit_to_s(:day_month).should == "16 Av"
    end
  end
  describe "next_yahrzeit_date" do
    it "calculates yahrzeit within the next year" do
      person = Factory.create(:person, :death_date => "2000/08/17")
      Date.stub(:today).and_return(Date.parse("2011/11/6"))
      person.next_yahrzeit_date.should == Date.parse("2012/8/4")
    end
    it "calculates yahrzeit from a date" do
      person = Factory.create(:person, :death_date => "2000/08/17")
      from = Date.parse("2010/11/6")
      person.next_yahrzeit_date(from).should == Date.parse("2011/8/16")
    end
  end
end
