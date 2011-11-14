require 'spec_helper'
require "./lib/hebrew_date.rb"

describe Hebruby::HebrewDate do
  it "should compare ==" do
    date = Hebruby::HebrewDate.new(16,5,5760)
    date2 = Hebruby::HebrewDate.new(16,5,5760)
    (date == date2).should be_true
  end
  it "should compare <" do
    date = Hebruby::HebrewDate.new(16,5,5760)
    date2 = Hebruby::HebrewDate.new(17,5,5760)
    (date < date2).should be_true
  end
  it "should compare >" do
    date = Hebruby::HebrewDate.new(16,5,5760)
    date2 = Hebruby::HebrewDate.new(15,5,5760)
    (date > date2).should be_true
  end
    
  it "should to_s" do
    date = Hebruby::HebrewDate.new(16,5,5760)
    date.to_s.should == "16 Av 5760"
  end
end
