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

  def fr_tags
    tags = Word.tag_counts_on(:fr_tags).where("name ~* ?", params[:q]).map{|t| {id: t.name, name: t.name }}

    respond_to do |format|
      format.json { render json: tags }
    end
  end

  def en_tags
    tags = Word.tag_counts_on(:en_tags).where("name ~* ?", params[:q]).map{|t| {id: t.name, name: t.name }}

    respond_to do |format|
      format.json { render json: tags }
    end
  end

  private

    def get_word
      @word = Word.find(params[:id])
    end

    def find_tags
      @word_fr_tags = params[:id].present? ? Word.find(params[:id]).fr_tags.map{|t| {id: t.name, name: t.name }} : []
      @word_en_tags = params[:id].present? ? Word.find(params[:id]).en_tags.map{|t| {id: t.name, name: t.name }} : []
    end

    def word_params
      params.require(:word).permit(:definition_fr, :definition_en,
      :definition_kh, :definition_ph, :word_type, :fr_tag_list, :en_tag_list)
    end

end
