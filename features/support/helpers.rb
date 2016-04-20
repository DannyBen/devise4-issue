module RailsUrlHelpers
  include Rails.application.routes.url_helpers
end

World(Devise::TestHelpers, RailsUrlHelpers)