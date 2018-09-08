class Tagging
  include Mongoid::Document
  belongs_to :hello
  belongs_to :tag
end
