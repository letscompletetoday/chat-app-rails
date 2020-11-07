class Channel
  include Mongoid::Document
  field :title, type: String
  field :description, type: String

  has_many :messages
end
