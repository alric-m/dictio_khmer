# ruby encoding: utf-8
require 'rails_helper'
require 'spec_helper'

RSpec.describe 'General test' do

  before(:all) do
    Word.delete_all
    Quiz.delete_all
  end

  it "should create word" do
    word_params = attributes_for(:thanks)
    expect { Word.create(word_params) }.to change{ Word.count }.by(1)
  end

  it "should not create word (word_type missing)" do
    word_params = attributes_for(:type_missing)
    word = Word.new(word_params)
    expect { word.save }.to change{ Word.count }.by(0)
    expect { word.save }.to change{ Word.count }.by(0)
    expect(word.errors.full_messages.count).to eq(1)
  end

  # it "should not create word (definitions missing)" do
  #   word_params = attributes_for(:definition_missing)
  #   word = Word.new(word_params)
  #   expect { word.save }.to change{ Word.count }.by(0)
  #   expect(word.errors.full_messages.count).to eq(2)
  # end

end
