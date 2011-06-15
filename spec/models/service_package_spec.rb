require 'spec_helper'

describe ServicePackage do
  
  before :each do
    @sp_complete = ServicePackage.make!
  end

  it "should be invalid with no title" do
    @sp_complete.should be_valid
    @sp_complete.title = nil
    @sp_complete.should_not be_valid
  end
  
  it "should be invalid with empty title" do
    @sp_complete.should be_valid
    @sp_complete.title = ""
    @sp_complete.should_not be_valid
  end

  it "should be invalid with a non-unique title" do
    @sp_complete.should be_valid
    sp2 = ServicePackage.make
    sp2.save
    @sp_complete.title = sp2.title
    @sp_complete.should_not be_valid
  end
  
end
