# ruby encoding: utf-8
require 'rails_helper'
require 'spec_helper'
require 'helpers'

RSpec.describe Quiz, :type => :model do

  include_context "main helpers"

  before(:all) do
    reset_database
    seed_database
  end

  it "should create quiz" do
    quiz_params = attributes_for(:quiz)
    quiz = Quiz.new(quiz_params)

    expect{ quiz.save }.to change{ Quiz.count }.by(1)
    expect( quiz.questions.count ).to eq(5)
    expect( quiz.questions.map(&:translate_from).uniq ).to eq(["fr"])
    expect( quiz.questions.map(&:translate_to).uniq ).to eq(["kh"])
  end

end
