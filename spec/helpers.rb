require 'rake'
DictioKhmer::Application.load_tasks


RSpec.shared_context "main helpers" do

  def reset_database
    Rake::Task["db:test:prepare"].invoke #FIXME do better. Try database_cleaner

    User.destroy_all
    Word.destroy_all
    Quiz.destroy_all
  end

  def seed_database
    Rake::Task["db:seed"].invoke
  end

end
