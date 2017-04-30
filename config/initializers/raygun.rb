Raygun.setup do |config|
  config.api_key = "QobcVGR3SIEAk7XzYccYvw=="
  config.filter_parameters = Rails.application.config.filter_parameters

  config.enable_reporting = production_or_staging?
end
