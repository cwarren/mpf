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
  description   { "a generic un-associated mobile service" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  url           { "http://foo#{sn}" }
  is_live       { true }
  is_restricted { false }
end

MobileService.blueprint(:public) do
  id            { "#{sn}".to_i }
  title         { "Service #{sn}" }
  description   { "a generic un-associated mobile service" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  url           { "http://foo#{sn}" }
  is_live       { true }
  is_restricted { false }
end

MobileService.blueprint(:available) do
  id            { "#{sn}".to_i }
  title         { "Service #{sn}" }
  description   { "a generic un-associated mobile service" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  url           { "http://foo#{sn}" }
  is_live       { true }
  is_restricted { true }
end

MobileService.blueprint(:unavailable) do
  id            { "#{sn}".to_i }
  title         { "Service #{sn}" }
  description   { "a generic un-associated mobile service" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  url           { "http://foo#{sn}" }
  is_live       { false }
  is_restricted { false }
end

#-------------------------------------------------------------------------

ServicePackage.blueprint do
  id            { "#{sn}".to_i }
  title         { "Package #{sn}" }
  urlname       { "package#{sn}" }
  icon          { File.new(Rails.root + 'spec/fixtures/images/sample_icon_57_57.png') }
  description   { "a generic empty service package" }
  is_live       { false }
end
