# frozen_string_literal: true

require 'rspec'
require 'rspec/its'
require 'simplecov'

SimpleCov.start

require 'jekyll/liquify_filter'

Jekyll.logger.log_level = :error

RSpec.configure do |config|
  config.order = 'random'

  SOURCE_DIR = File.expand_path('fixtures', __dir__)
  DEST_DIR   = File.expand_path('dest',     __dir__)

  def source_dir(*files)
    File.join(SOURCE_DIR, *files)
  end

  def dest_dir(*files)
    File.join(DEST_DIR, *files)
  end
end
