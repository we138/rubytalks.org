# frozen_string_literal: true

module Talks
  module Operations
    class FindUnapproved < Operation
      include Import[
        talk_repo: 'repositories.talk'
      ]

      def call(id:)
        talk = Try(ROM::TupleCountMismatchError) { talk_repo.find_unapproved(id) }
        talk.to_result
      end
    end
  end
end
