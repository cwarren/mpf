require 'spec_helper'

describe MobileService do
  
  before do
    @ms_complete_in_db = MobileService.create!({
                                                :title => "complete_ms_db",
                                                :description => "a mobile service with all fields valid, though not necessarily meaningful",
                                                :icon=>"msicons/foo.png",
                                                :url=>"http://foo/ms",
                                                :is_live=>true,
                                                :is_restricted=>false})
  end
  
  before :each do
    @ms_complete = MobileService.new(title:"complete_ms",
                                     description:"a mobile service with all fields valid, though not necessarily meaningful",
                                     icon:"msicons/foo.png",
                                     url:"http://foo/ms",
                                     is_live:true,
                                     is_restricted:false)
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

  it "should be invalid with a non-unique title" do
    @ms_complete.should be_valid
    @ms_complete.title = "complete_ms_db"
    @ms_complete.should_not be_valid
  end
  
end
