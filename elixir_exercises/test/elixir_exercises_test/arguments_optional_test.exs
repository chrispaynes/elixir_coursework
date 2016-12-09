defmodule ArgumentsOptionalTest do
    use ExUnit.Case, async: true
    alias ArgumentsOptional

    test 'should sum integer arguments' do
      assert ArgumentsOptional.addTogether(2, 3) == 5
    end

    test 'should sum float arguments' do
      assert ArgumentsOptional.addTogether(3.3, 4.3) == 7.6
    end

    test 'should return nil for non-numerical arguments' do
      assert ArgumentsOptional.addTogether('a', 3) == nil
      assert ArgumentsOptional.addTogether(3, 'a') == nil
      assert ArgumentsOptional.addTogether("http://bit.ly/IqT6zt") == nil
    end

     test 'should return nil when adding numbers written as strings' do
      assert ArgumentsOptional.addTogether(2, "3") == nil
     end

    test 'should return nil when adding a number inside an array' do
      assert ArgumentsOptional.addTogether(2, [3]) == nil
    end

    test 'should return nil for empty string arguments' do
      assert ArgumentsOptional.addTogether("", "") == nil
    end

    test 'should return nil for null arguments' do
      assert ArgumentsOptional.addTogether(nil, nil) == nil
    end

end


