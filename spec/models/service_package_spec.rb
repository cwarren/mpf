require 'spec_helper'

describe ServicePackage do

  before do
    @sp_complete_in_db = ServicePackage.create!({
                                                :title => "complete_sp_db",
                                                :urlname => "sp_db",
                                                :description => "a service package with all fields valid, though not necessarily meaningful",
                                                :icon=> File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png'),
                                                :is_live=>true})
  end
  
  before :each do
    @sp_complete = ServicePackage.new(title:"complete_sp",
                                      urlname:"sp",
                                      description:"a service package with all fields valid, though not necessarily meaningful",
                                      :icon=> File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png'),
                                      is_live:true)
  end

end
