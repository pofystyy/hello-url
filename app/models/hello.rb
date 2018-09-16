class Hello
  include Mongoid::Document
  field :url, type: String
  field :summary, type: String

  before_destroy :delete_tags

  has_and_belongs_to_many :tags
  belongs_to :user

  validates_presence_of :url, :summary

  def all_tags
		self.tags.map(&:name).join(', ')	
	end

	def all_tags=(names)
		self.tags = names.split(',').map do |name|
			Tag.where(name: name.strip).first_or_create!
		end
	end

  private

  def delete_tags
    self.tags.all.each{ |tag| tag.delete if tag.hellos.count == 1 }  
  end

end
