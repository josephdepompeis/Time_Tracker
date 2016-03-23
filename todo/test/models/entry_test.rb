require 'test_helper'

class EntryTest < ActiveSupport::TestCase


  test "test entry/dev creation" do
    dev =  Developer.create!(first: "hello", last: "goodbye", email:"hello11", password_digest: "wollo")
    ent =  Entry.create!(developer_id: dev.id, date: Date.current, duration: Time.now, project_id: "1")
    assert dev.id
  end

  test "entry has developers" do
    dev =  Developer.create!(first: "hello", last: "goodbye", email:"hello11", password_digest: "wollo")
    ent =  Entry.create!(developer_id: dev.id, date: Date.current, duration: Time.now, project_id: "1")
    assert dev.id = ent.developer
  end

  test "entry must have duration, developer, date" do
    dev =  Developer.create!(first: "hello", last: "goodbye", email:"hello11", password_digest: "wollo")
    fail_ent1 = Entry.create(developer_id: dev.id, date: Date.current, project_id: "1")
    fail_ent2 = Entry.create(date: Date.current, duration: Time.now, project_id: "1")
    fail_ent3 = Entry.create(developer_id: dev.id, duration: Time.now, project_id: "1")
    success_ent = Entry.create!(developer_id: dev.id, date: Date.current, duration: Time.now, project_id: "1")
    refute fail_ent1.id
    refute fail_ent2.id
    refute fail_ent3.id
    assert success_ent
  end

  end
