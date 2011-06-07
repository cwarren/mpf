require 'spec_helper'

describe MobileService do
  
  before :each do
    # this makes sure there's no serial number / name collision of the test 
    # objects (not sure why the serial number this doesn't handle this automatically, 
    # but the machinist documentation is sparse
    @ms_complete = MobileService.make(2).last
  end
  
  it "should be invalid with no title" do
    @ms_complete.should be_valid 
    @ms_complete.title = nil
    @ms_complete.should_not be_valid
  end
  
  it "should be invalid with empty title" do
    @ms_complete.should be_valid
    @ms_complete.title = ""
    @ms_complete.should_not be_valid
  end

  
end
