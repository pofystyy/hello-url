class Hello
  include Mongoid::Document
  field :url, type: String
  field :summary, type: String

  validates_presence_of :url, :summary
end
