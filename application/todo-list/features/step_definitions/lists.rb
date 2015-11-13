# coding: utf-8
Given(/^there is one shopping list named "([^"]+)" with (\d+) product to buy by "([^"]+)"$/) do |listName, productNumber, username|
  user = User.where(:username => username).first
  list = List.create(:name => listName)

  (0...productNumber.to_i).each do
    list.products.build(:title => random_product_name())
  end

  list.user = user
  list.save!
end

Given(/^there is one shopping list named "([^"]+)" with one item named "([^"]+)"$/) do |listName, itemName|
  list = List.create(:name => listName)
  list.products.build(:title => itemName)
  list.save!
end

Given(/^there are lists titled "([^"]+)", "([^"]+)"$/) do |firstList, secondList|
  List.create!(:name => firstList)
  List.create!(:name => secondList)
end

Given(/^there is one shopping list named "([^"]+)" with (\d+) random products?$/) do |listName, tasksNumber|
  list = List.create(:name => listName)

  (0...tasksNumber.to_i).each do
    list.products.build(:title => random_product_name())
  end

  list.save!
end

Given(/^there is one empty list with name "([^"]+)"$/) do |listName|
  List.create!(:name => listName)
end

Given(/^"([^"]+)" should see "([^"]+)"$/) do |username, listName|
  User.where(:username => username).first.products.where(:name => listName).count.should == 1
end

Given(/^there are no shopping lists$/) do
  List.delete_all
end

When(/^first visible product in list "([^"]+)" will be signed as bought$/) do |listName|
  list = List.where(:name => listName).first

  list.products.first.close!
  list.products.first.save!
end

When(/^"([^"]+)" will be opened$/) do |listName|
  list = List.where(:name => listName).first

  list.open!
  list.save!
end

When(/^"([^"]+)" will be created$/) do |listName|
  List.create!(:name => listName)
end

When(/^new product with name "([^"]+)" is added to the "([^"]+)"$/) do |taskName, listName|
  list = List.where(:name => listName).first

  product = Product.create(:title => taskName)
  product.list = list
  product.save!
end

Then(/^"([^"]+)" has no products inside$/) do |listName|
  List.where(:name => listName).first.products.count.should == 0
end

Then(/^"([^"]+)" should be available$/) do |listName|
  List.where(:name => listName).first.available.should == true
end

Then(/^"([^"]+)" should not be available$/) do |listName|
  List.where(:name => listName).first.available.should == false
end

Then(/^"([^"]+)" should has today's date$/) do |listName|
  List.where(:name => listName).first.date.should == Date.today
end

Then(/^"([^"]+)" has (\d+) products? inside$/) do |listName, productsNumber|
  List.where(:name => listName).first.products.count.should == productsNumber.to_i
end

Then(/^"([^"]+)" should be in repository$/) do |listName|
  List.where(:name => listName).count == 1
end
