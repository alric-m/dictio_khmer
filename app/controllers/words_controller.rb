class WordsController < ApplicationController
  include ActsAsTaggableOn

  before_filter :get_word, only: [:edit, :update, :destroy]
  before_filter :find_tags, only: [:new, :edit]

  def index
    @words = Word.with_translations(I18n.locale)
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to words_path
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @word.update_attributes(word_params)
      redirect_to words_path
    else
      puts "errors => #{@word.errors.full_messages}"
      render action: "edit"
    end
  end

  def destroy
    @word.destroy
    redirect_to words_path
  end

  def tags
    tags = Word.all_tag_counts.where("name ~* ?", params[:q]).map{|t| {id: t.name, name: t.name }}

    respond_to do |format|
      format.json { render json: tags }
    end
  end

  private

    def get_word
      @word = Word.find(params[:id])
    end

    def find_tags
      @word_tags = params[:id].present? ? Word.find(params[:id]).tags.map{|t| {id: t.name, name: t.name }} : []
    end

    def word_params
      params.require(:word).permit(:definition_fr, :definition_en,
      :definition_kh, :phonetic, :word_type, :tag_list)
    end

end
