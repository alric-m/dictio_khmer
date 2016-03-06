class Quiz < ActiveRecord::Base

  has_many  :questions, dependent: :destroy

  scope :done,     -> { where(done: true) }
  scope :not_done, -> { where(done: false) }

  validates :questions_count, presence: true
  validates :timer, inclusion: { in: 5..61 }, unless: "timer.blank?"

  def next_question
    questions.not_done.first
  end

  def build_questions
    words = Word.all

    words = words.tagged_with(default_tags) unless default_tags.blank?
    words = words.where(word_type: default_word_type) unless default_word_type.blank?

    words = words.sort_by { rand }.slice(0, questions_count)
    words.each do |word|
      translate_from = translate_from_default || [I18n.locale.to_s, "kh", "ph"].shuffle[0]
      if translate_to_default
        translate_to = translate_to_default
      elsif ["fr", "en"].include?(translate_from)
        translate_to = ["kh", "ph"].shuffle[0]
      else
        translate_to = I18n.locale.to_s
      end
      word_type = default_word_type || Word.all.map(&:word_type).uniq.shuffle[0]
      tags = default_tags || Word.all_tags.shuffle[0]
      q = Question.create!(quiz_id: self.id, word: word, translate_from: translate_from, translate_to: translate_to, word_type: word_type, themes: tags, answer: word.definition(translate_to))
    end
  end

  def correct!
    score = @quiz.questions.good_answered.count
    done = true
    save!
  end

end
