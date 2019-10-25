# frozen_string_literal: true

Hanami::Container.boot(:oembed) do |container|
  init do
    require 'oembed'

    OEmbed::Providers.register_all

    container.register('oembed', OEmbed::Providers)
  end
end
