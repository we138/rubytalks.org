# frozen_string_literal: true

require 'dry/system/container'
require 'dry/system/hanami'
require_relative '../lib/core/operation'
require_relative '../lib/types'
require_relative './core_ext'

# General container class for project dependencies
#
# {http://dry-rb.org/gems/dry-system/ Dry-system documentation}
class Container < Dry::System::Container
  extend Dry::System::Hanami::Resolver

  use :env

  #  Core
  register_folder! 'core/repositories'
  register_folder! 'utils'

  register_folder! 'talks/operations'
  register_folder! 'speakers/operations'
  register_folder! 'events/operations'

  register 'web.forms.talk_form' do
    Web::Forms::TalkForm.new
  end

  configure do |config|
    config.env = Hanami.env
  end
end
