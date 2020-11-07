class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :sender_name, type: String
  field :message, type: String
  field :profile_image, type: String
  belongs_to :channel
end
