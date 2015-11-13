Given(/^there is one shopping list named "([^"]+)" with (\d+) bought random products?$/) do |listName, productNumber|
  list = List.create(:name => listName)

  (0...productNumber.to_i).each do
    product = Product.create(:title => random_product_name())
    product.close!

    list.products << product
  end

  list.save!
end

When(/^"([^"]+)" will be reopened$/) do |listName|
  # Zadanie BDD_5:
  #
  # TODO: Implementacja ponownego otwierania listy.
  #       Pomoc znajdziesz na ściądze i w module 'app/models/list.rb'.
end

Then(/^all products on "([^"]+)" should be not signed as bought$/) do |listName|
  List.where(:name => listName).first.products.select{ |product| product.closed }.count.should == 0
end