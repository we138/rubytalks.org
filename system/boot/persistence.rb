# frozen_string_literal: true

Container.boot(:persistence) do
  init do
    TalkRepository.enable_pagination!
  end
end
