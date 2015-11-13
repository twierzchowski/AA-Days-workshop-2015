Then(/^"([^"]+)" item will be closed$/) do |productName|
  product = createProductIfNotExist(productName)
  product.close!
  product.save!
end

Then(/^"([^"]+)" item will be opened$/) do |productName|
  product = createProductIfNotExist(productName)
  product.save!
end

Then(/^"([^"]+)" item should be opened$/) do |productName|
  Product.where(:title => productName).first.closed.should == false
end

Then(/^"([^"]+)" item should be closed$/) do |productName|
  Product.where(:title => productName).first.closed.should == true
end

Then(/^(\d+) product in "([^"]+)" is available$/) do |tasksNumber, productName|
  List.where(:name => productName).first.products.count.should == tasksNumber.to_i
end

Then(/^"([^"]+)" item should have today's date$/) do |productName|
  Product.where(:title => productName).first.date.should == Date.today
end