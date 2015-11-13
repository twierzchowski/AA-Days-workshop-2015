def random_password()
  (0...8).map { (65 + rand(26)).chr }.join
end

def random_product_name()
  (0...24).map { (65 + rand(26)).chr }.join
end

def createProductIfNotExist(taskName)
  product = Product.where(:title => taskName).first

  if !product
    product = Product.create(:title => taskName)
  end

  return product
end