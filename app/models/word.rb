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
  validate  :definitions_presence

  def definitions_presence
    [:kh, :ph, :en, :fr].each do |locale|
      if definition_translations[locale].blank?
        errors.add("definition_#{locale}", " empty")
      end
    end
  end

  def fr_tag_list_tokens=(tokens)
    self.fr_tag_list = tokens.gsub("'", "")
  end

  def en_tag_list_tokens=(tokens)
    self.en_tag_list = tokens.gsub("'", "")
  end

end
