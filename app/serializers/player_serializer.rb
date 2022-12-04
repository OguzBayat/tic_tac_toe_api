# frozen_string_literal: true

class PlayerSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :sign
end
