require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

MobileService.blueprint do
  id            { "#{sn}".to_i }
  title         { "Service #{sn}" }
  urltitle      { "service#{sn}" }  
  description   { "a generic un-associated mobile service" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  url           { "http://foo#{sn}" }
  is_live       { true }
  is_restricted { false }
  service_packages(0)
end

MobileService.blueprint(:public) do
  id            { "#{sn}".to_i }
  title         { "Service #{sn}" }
  urltitle      { "service#{sn}" }  
  description   { "a generic un-associated mobile service" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  url           { "http://foo#{sn}" }
  is_live       { true }
  is_restricted { false }
  service_packages(0)
end

MobileService.blueprint(:available) do
  id            { "#{sn}".to_i }
  title         { "Service #{sn}" }
  urltitle      { "service#{sn}" }  
  description   { "a generic un-associated mobile service" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  url           { "http://foo#{sn}" }
  is_live       { true }
  is_restricted { true }
  service_packages(0)
end

MobileService.blueprint(:unavailable) do
  id            { "#{sn}".to_i }
  title         { "Service #{sn}" }
  urltitle      { "service#{sn}" }  
  description   { "a generic un-associated mobile service" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  url           { "http://foo#{sn}" }
  is_live       { false }
  is_restricted { false }
  service_packages(0)
end

MobileService.blueprint(:with_2_packages) do
  id            { "#{sn}".to_i }
  title         { "Service #{sn}" }
  urltitle      { "service#{sn}" }  
  description   { "a generic un-associated mobile service" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  url           { "http://foo#{sn}" }
  is_live       { true }
  is_restricted { false }
  service_packages(2)
end

#-------------------------------------------------------------------------

ServicePackage.blueprint do
  id            { "#{sn}".to_i }
  title         { "Package #{sn}" }
  urltitle      { "package#{sn}" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  description   { "a generic empty service package" }
  is_live       { false }
  mobile_services(0)
end

ServicePackage.blueprint(:with_2_services) do
  id            { "#{sn}".to_i }
  title         { "Package #{sn}" }
  urltitle      { "package#{sn}" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  description   { "a generic empty service package" }
  is_live       { true }
  mobile_services(2)
end

#-------------------------------------------------------------------------

User.blueprint do
  id            { "#{sn}".to_i }
  username      {"user#{sn}"}
  first_name    {"Firstname#{sn}"}
  last_name     {"Lastname#{sn}"}
end
