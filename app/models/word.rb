class Word < ActiveRecord::Base

  # Tags
  acts_as_taggable

  # Globalize
  translates :definition
  globalize_accessors

  # Relations
  has_many :questions

  # Validations
  validates :phonetic, :presence => true

  def tag_list_tokens=(tokens)
    self.tag_list = tokens.gsub("'", "")
  end

end
