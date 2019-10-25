# frozen_string_literal: true

module Admin
  module Controllers
    module Dashboard
      class Index < Admin::Action
        include Dry::Monads::Result::Mixin
        include Import[
          operation: 'talks.operations.list_for_approve'
        ]

        def call(params)
          result = operation.call(page: params[:page])

          case result
          when Success
            @talks = result.value![:result]
            @pager = result.value![:pager]
          when Failure
            # TODO: log to rollbar/sentry
            halt 400, 'Something went wrong'
          end
        end
      end
    end
  end
end
