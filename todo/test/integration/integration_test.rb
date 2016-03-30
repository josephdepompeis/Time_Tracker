require 'test_helper'

class MustLogInTest < ActionDispatch::IntegrationTest
  test "Root path redirects" do
    get root_path
    assert_redirected_to sessions_login_path
    post sessions_login_path email: "lofgin@login.com", password: "password"
    get root_path
    assert_redirected_to sessions_login_path
  end


  test "Login with wrong info fails" do
    get root_path
    assert_redirected_to sessions_login_path
    post sessions_login_path email: "wrong@login.com", password: "passwdfdsord"
    get root_path
    assert_redirected_to sessions_login_path
  end

  test "Login with correct info" do
    get root_path
    assert_redirected_to sessions_login_path
    post sessions_login_path email: "login@login.com", password: "password"
    get root_path
    assert_template "index"
  end


  test "test developer index / create " do
    get root_path
    assert_redirected_to sessions_login_path
    post sessions_login_path email: "login@login.com", password: "password"
    get root_path
    assert_template "index"
    # check developer table exists
    dev_count = Developer.count
    assert_select "tbody tr", dev_count

    #create developer
    get new_developer_path
    post developers_path developer: {first: "new", last: "jawn", password: "whatever"}
    get root_path
    assert_select "tbody tr", (dev_count + 1)

    #edit developer
    patch developer_path :developer, id: Developer.last.id, developer: {first: "old", last: "jaunce", password: "whatever x2 "}

    #delete developer
    delete developer_path :developer, id: Developer.last.id
    get root_path
    assert_select "tbody tr", dev_count
  end

  test "test entries table / create functionality" do
    get root_path
    assert_redirected_to sessions_login_path
    post sessions_login_path email: "login@login.com", password: "password"
    get root_path
    assert_template "index"
    get entries_path
    entry_count = Entry.count
    #checks entries tables exists
    assert_select "tbody tr", entry_count

    #create entries
    get new_entry_path
    post entries_path entry: {developer_id: Developer.first.id, date: Date.current, project_id: Project.first.id, duration: 11}
    get entries_path
    assert_select "tbody tr", (entry_count + 1)

    #edit entry
    patch entry_path :entry, id: Entry.last.id, entry: {developer_id: Developer.first.id, date: Date.current, project_id: Project.second.id, duration: 13}

    #delete entry
    delete entry_path :entry, id: Entry.last.id
    get entries_path
    assert_select "tbody tr", entry_count

  end

  test "test projects table / create functionality" do
    get root_path
    assert_redirected_to sessions_login_path
    post sessions_login_path email: "login@login.com", password: "password"
    get root_path
    assert_template "index"
    get projects_path
    project_count = Project.count
    #checks projects tables exists
    assert_select "tbody tr", project_count

    #create projects
    get new_entry_path
    post projects_path project: {max_time_spent: 21, description: 'test project!'}
    get projects_path
    assert_select "tbody tr", (project_count + 1)

    #edit project
    patch project_path :project, id: Project.last.id, project: {max_time_spent: 31, description: 'whatever!!'}

    #delete project
    delete project_path :project, id: Project.last.id
    get projects_path
    assert_select "tbody tr", project_count
  end
end
