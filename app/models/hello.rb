class Hello
  include Mongoid::Document
  field :url, type: String
  field :summary, type: String
end
