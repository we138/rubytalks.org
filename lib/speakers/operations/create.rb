# frozen_string_literal: true

module Speakers
  module Operations
    class Create < Operation
      include Import[
        speaker_repo: 'repositories.speaker'
      ]

      def call(**speaker_form)
        speaker_form[:slug] = generate_slug(speaker_form[:first_name], speaker_form[:last_name])
        speaker_repo.create(speaker_form)
      end

      private

      def generate_slug(first_name, last_name)
        [first_name, last_name].join('-').downcase
      end
    end
  end
end
