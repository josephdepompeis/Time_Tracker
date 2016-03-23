require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase

  test "test dev creation" do
    dev =  Developer.create!(first: "hello", last: "goodbye", email:"hello11", password_digest: "wollo")
    assert dev.id
  end

  test "developers have entries" do
    dev =  Developer.create!(first: "hello", last: "goodbye", email:"hello11", password_digest: "wollo")
    ent =  Entry.create!(developer_id: dev.id, date: Date.current, duration: Time.now, project_id: "1")
    assert_equal dev.entries.first.id, ent.id
  end

  test "developer has unique email" do
    dev1 =  Developer.create!(first: "hello", last: "goodbye", email:"hello11", password_digest: "wollo")
    dev2 =  Developer.create(first: "hello", last: "goodbye", email:"hello11", password_digest: "wollo")
    refute dev2.id
    assert dev1.id
  end

end
