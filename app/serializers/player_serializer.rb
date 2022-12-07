# frozen_string_literal: true

class PlayerSerializer
  include JSONAPI::Serializer
  attributes :name, :sign
end
