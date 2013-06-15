# :enddoc:
require 'test/unit/testcase'

if defined?(ActionController)
  require 'shoulda/matchers/action_controller'

  class ActionController::TestCase
    include Shoulda::Matchers::ActionController
    extend Shoulda::Matchers::ActionController

    def subject
      @controller
    end
  end
end

if defined?(ActiveRecord)
  require 'shoulda/matchers/active_record'
  require 'shoulda/matchers/active_model'

  module ActiveSupport
    class TestCase
      include Shoulda::Matchers::ActiveRecord
      extend Shoulda::Matchers::ActiveRecord
      include Shoulda::Matchers::ActiveModel
      extend Shoulda::Matchers::ActiveModel
    end
  end
elsif defined?(ActiveModel)
  require 'shoulda/matchers/active_model'

  module ActiveSupport
    class TestCase
      include Shoulda::Matchers::ActiveModel
      extend Shoulda::Matchers::ActiveModel
    end
  end
end

module ActiveSupport
  class TestCase
    # hack for assert_block missing in Minitest.
    # 
    # @param  error_msg [String] optional error message
    # @param  &block [Block] block to assert
    # 
    # @return [type] [description]
    def assert_block(error_msg = nil, &block)
      assert block.call, error_msg
    end
  end
end
