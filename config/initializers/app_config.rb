
INSTITUTION = "Williams College"
BASE_TITLE = "#{INSTITUTION} MPF"

if (Rails.env == "development")
  BASE_TITLE = "DEV- "+BASE_TITLE
end