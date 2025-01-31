# frozen_string_literal: true

module Web
  module Controllers
    module Speakers
      class Index
        include Web::Action
        include Dry::Monads::Result::Mixin
        include Import[
          operation: 'speakers.operations.list'
        ]

        expose :speakers

        def call(params)
          result = operation.call(params)

          case result
          when Success
            @speakers = result.value!
          when Failure
            halt 400, 'Something went wrong'
          end
        end
      end
    end
  end
end
