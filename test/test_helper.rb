ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # 指定のワーカー数でテストを並列実行する
  parallelize(workers: :number_of_processors)

  # test/fixtures/*.ymlにあるすべてのfixtureをセットアップする
  fixtures :all
  include ApplicationHelper
  # （すべてのテストで使うその他のヘルパーメソッドは省略）
  def is_logged_in?
    !session[:user_id].nil?
  end
end
