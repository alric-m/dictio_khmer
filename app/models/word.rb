class Word < ActiveRecord::Base

  # Tags
  acts_as_taggable

  # Globalize
  translates :definition
  globalize_accessors

  # Validations
  validates :phonetic, :presence => true
  # validates :name_kh, presence: true, uniqueness: true

  def tag_list_tokens=(tokens)
    self.tag_list = tokens.gsub("'", "")
  end

end
