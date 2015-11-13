def createPageObject(pageName)
  case pageName
    when 'log in'
      LoginPage.new(Capybara.current_session)

    when 'lists'
    	ListsPage.new(Capybara.current_session)

    else
      fail("There is no page object for '#{pageName}'!")
  end
end

Given(/^I am on (.+)? page$/) do |pageName|
  @page = createPageObject(pageName)
  @page.visit
end

When(/^I go to (.+?) page$/) do |pageName|
  @page = createPageObject(pageName)
  @page.visit
end

#When(/^I wait until pending requests will finish$/) do
#  @page.waitForPendingRequests(@page.getSession())
#end

Given(/^I am logged in as "([^"]+)" with password "([^"]+)"$/) do |username, password|
  @login_page = createPageObject("log in")
  @login_page.visit
  @login_page.type(username, "username field")
  @login_page.type(password, "password field")
  @login_page.click("log in button")
end

When(/^I enter correct login "([^"]+)" with password "([^"]+)"$/) do |username, password|
  @page.type(username, "username field")
  @page.type(password, "password field")
  @page.click("log in button")
end
