# frozen_string_literal: true

require "test_helper"
require "fixtury/definition"

module Fixtury
  class DefinitionTest < Test

    def test_it_can_be_instantiated
      Fixtury::Definition.new(name: "foo"){}
    end

    def test_the_callable_with_no_arguments_can_be_run_without_a_cache
      dfn = ::Fixtury::Definition.new(name: "foo") { "bar" }
      assert_equal "bar", dfn.call
    end

    def test_the_callable_with_one_argument_can_be_run_with_a_cache
      dfn = ::Fixtury::Definition.new(name: "foo") { |_x| "bar" }
      assert_equal "bar", dfn.call(cache: {})
    end

    def test_the_callable_with_one_argument_errors_when_no_cache_is_provided
      dfn = ::Fixtury::Definition.new(name: "foo") { |_x| "bar" }
      assert_raises { dfn.call }
    end

  end
end
