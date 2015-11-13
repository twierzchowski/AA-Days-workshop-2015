matylda = User.create!(:username => "matylda", :password => "test")
andrzej = User.create!(:username => "andrzej", :password => "test")
krystian = User.create!(:username => "krystian", :password => "test")

list = List.create!(:name => "Test list")
list.products.build(:title => "Test product on opened list")
list.user_id = matylda.id

closed_list = List.create!(:name => "Closed list")
closed_list.user_id = matylda.id

product = Product.create!(:title => "Test product on closed list")
closed_list.products << product

product.close!

product.save!
list.save!
closed_list.save!