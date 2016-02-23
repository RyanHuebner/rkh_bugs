require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @bug = Bug.create(title: "a title", description: "This describes the bug.")
  end
 
  test "bug must be valid" do
    assert @bug.valid?
  end
  
  test "title must be present" do
    @bug.title = ""
    assert_not @bug.valid?
  end
  
  test "description must be present" do
    @bug.description = ""
    assert_not @bug.valid?
  end
  
  test "default value for issue_type should be feature" do
    assert_equal "feature", @bug.issue_type
  end  
  
  test "issue_type must be valid" do
    invalid_issue_type = [-10, -1, 3, 10]
    invalid_issue_type.each do |iit|
    begin
      @bug.issue_type = iit
      assert false, "#{iit} should be invalid"
    rescue
      assert true
    end
    end
  end  
  
  test "default value for priority should be medium" do
    assert_equal "medium", @bug.priority
  end  
  
  test "priority must be valid" do
    invalid_priorities = [-10, -1, 3, 10]
    invalid_priorities.each do |ip|
    begin
      @bug.priority = ip
      assert false, "#{ip} should be invalid"
    rescue
      assert true
    end
    end
  end  
  
  test "default value for status should be open" do
    assert_equal "open", @bug.status
  end  
  
  test "statusmust be valid" do
    invalid_statuses = [-10, -1, 3, 10]
    invalid_statuses.each do |is|
    begin
      @bug.status = is
      assert false, "#{is} should be invalid"
    rescue
      assert true
    end
    end
  end  
  
end
