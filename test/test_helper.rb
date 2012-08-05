if RUBY_VERSION != "1.8.7"
  require 'simplecov'
  SimpleCov.start do
    add_filter "/test/"
  end
end
$:.unshift File.expand_path('../../lib/', __FILE__)
require 'active_support/testing/setup_and_teardown'
require 'public_activity'
require 'public_activity/store_controller'
require 'minitest/autorun'
require 'minitest/pride' if ENV['WITH_PRIDE']
require 'mocha'
require 'active_record'
require 'active_record/connection_adapters/sqlite3_adapter'

require 'stringio'        # silence the output
$stdout = StringIO.new    # from migrator
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')
ActiveRecord::Migrator.migrate(File.expand_path('../migrations', __FILE__))
$stdout = STDOUT

def article(options = {})
  Class.new(ActiveRecord::Base) do
    self.abstract_class = true
    self.table_name = 'articles'
    include PublicActivity::Model
    # holds calling #tracked when options are set explicitly to nil
    tracked options unless options.nil?

    def self.name
      "Article"
    end
  end
end

class User < ActiveRecord::Base; end

class ViewSpec < MiniTest::Spec
  include ActiveSupport::Testing::SetupAndTeardown
  include ActionView::TestCase::Behavior
end
MiniTest::Spec.register_spec_type(/Rendering$/, ViewSpec)
