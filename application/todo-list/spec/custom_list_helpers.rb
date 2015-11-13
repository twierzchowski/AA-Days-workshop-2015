def buyAllProducts(listName)
  list = List.where(:name => listName).first

  list.products.each do |product|
    product.close!
    product.save!
  end

  list.save!
end

def buyNotAllProducts(listName)
  list = List.where(:name => listName).first

  list.products.each_with_index do |product, index|
    if index != 4
      product.close!
      product.save!
    end
  end

  list.save!
end

def assertListAvailability(listName, value)
  expect(List.where(:name => listName).first.available).to eq(value)
end

def createList(listName)
  list = List.create(:name => listName)

  (0...8).each do |i|
    list.products.build(:title => "Product #{i}")
  end

  list.save!

  return list
end