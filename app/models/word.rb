class Word < ActiveRecord::Base

  # Tags
  acts_as_taggable_on :fr_tags, :en_tags

  # Globalize
  translates :definition
  globalize_accessors

  # Relations
  has_many :questions

  # Validations
  validates :word_type,     presence: true

  def fr_tag_list_tokens=(tokens)
    self.fr_tag_list = tokens.gsub("'", "")
  end

  def en_tag_list_tokens=(tokens)
    self.en_tag_list = tokens.gsub("'", "")
  end

end
