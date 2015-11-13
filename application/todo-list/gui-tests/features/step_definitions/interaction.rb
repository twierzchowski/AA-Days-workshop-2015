Given(/^I opened "([^"]+)"$/) do |listName|
  @page = @page.followByName(listName)
end

Given(/^I typed "([^"]+)" into (.+?)$/) do |text, name|
  @page.type(text, name)
end

Given(/^I clicked (.+?)$/) do |name|
  @page.click(name)
end

Given(/^I cleared (.+?)$/) do |name|
  @page.type("", name)
end

When(/^I click (.+?)$/) do |name|
  @page.click(name)
end

When(/^I type "([^"]+)" into (.+?)$/) do |text, name|
  @page.type(text, name)
end

When(/^I mark checkbox near "([^"]+)"$/) do |name|
  @page.checkNear(name)
end


Given(/^I add "([^"]+)" list$/) do |name|
  @page.type(name, "new list field")
  @page.click("add button")
end

Given(/^I add (\d+) "([^"]+)" product$/) do |quantity, name|
  @page.type(name, "new product name")
  @page.type(quantity, "new product quantity")
  @page.click("add button")
end

When(/^I buy "([^"]+)" and mark this on my list$/) do |name|
  @page.checkNear(name)
  @page.waitForPendingRequests(@page.getSession())
end

Then(/^I should see (\d+) "([^"]+)" product to buy/) do |quantity, name|
  @session = @page.getSession()
  element = @session.find(
      :xpath,
      "//li[@class='task-list__task  cf' and ./span[contains(text(),#{name})] and ./span[contains(text(),#{quantity})]]")
  element.find(:xpath, "//label[contains(text(),'Buy')]")


end

When(/^I can`t buy eggs as they`ve already sold, so I can just drink beer for the morning breakfast$/) do
end