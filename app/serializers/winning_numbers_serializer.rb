# frozen_string_literal: true

class WinningNumbersSerializer
  include JSONAPI::Serializer
  attributes :id, :numbers
end
