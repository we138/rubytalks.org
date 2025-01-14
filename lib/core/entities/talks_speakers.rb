# frozen_string_literal: true

class TalksSpeakers < Hanami::Entity
  attributes do
    attribute :id, Types::Int

    attribute :talk_id, Types::Int
    attribute :speaker_id, Types::Int
  end
end
