class List < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :products
  belongs_to :user

  after_initialize :update_state
  before_save :update_date

  def update_date()
    self.date ||= Date.today

    # All 'before_*' methods have to return true if they have to be applied.
    return true
  end

  def update_state()
    self.available = self.products.select { |product| !product.closed }.count > 0 || self.products.count == 0

    # All 'before_*' methods have to return true if they have to be applied.
    return true
  end

  def open!()
    self.available = true
  end

  def close!()
    self.available = false
  end

  def reopen!()
    self.products.each do |product|
      product.open!
      product.save!
    end

    self.save!
  end
end