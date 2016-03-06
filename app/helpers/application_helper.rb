module ApplicationHelper

  def word_count
    Word.all.count
  end

  def getTypes
    [
      [t('word_type.noun'), "noun"],
      [t('word_type.adjectif'), "adjectif"],
      [t('word_type.verb'), "verb"],
    ]
  end

  def getQuestionTypes
    [
      [t('locale.fr'), "fr"],
      [t('locale.en'), "en"],
      [t('locale.ph'), "ph"],
      [t('locale.kh'), "kh"]
    ]
  end

  def getThemes
    if I18n.locale == :fr
      tags = Word.tag_counts_on(:fr_tags)
    else
      tags = Word.tag_counts_on(:en_tags)
    end
    tags
  end

end
