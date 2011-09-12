require 'spec_helper'

describe Person do
  describe "gender" do
    it "should only allow 'male' and 'female'" do
      Factory.build(:person, :gender => 'male').should be_valid
      Factory.build(:person, :gender => 'female').should be_valid
      Factory.build(:person, :gender => 'foo').should_not be_valid      
    end
    it "should not be required" do
      Factory.build(:person, :gender => '').should be_valid
      Factory.build(:person, :gender => nil).should be_valid
    end
    describe "prefix" do
      it "should only allow stanard prefixes" do
        %w{ Ms Miss Mrs Mr Dr Atty Prof Hon Gov Ofc }.each do |prefix|
          Factory.build(:person, :prefix => prefix).should be_valid
        end
      end
      it "should not be required" do
        Factory.build(:person, :prefix => '').should be_valid
        Factory.build(:person, :prefix => nil).should be_valid
      end
    end
  end
end
