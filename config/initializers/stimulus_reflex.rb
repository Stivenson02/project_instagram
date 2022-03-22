# frozen_string_literal: true

# The ActionCable logger is REALLY noisy, and might even impact performance.
# Uncomment the line below to silence the ActionCable logger.

# ActionCable.server.config.logger = Logger.new(nil)

StimulusReflex.configure do |config|
  config.on_failed_sanity_checks = :warn
end
