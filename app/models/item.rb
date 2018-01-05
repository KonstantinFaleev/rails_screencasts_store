class Item < ApplicationRecord
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

  belongs_to :category

  after_initialize { puts "initialized" } # Item.new; Item.first
  after_save       { puts "saved" } # Item.save; Item.create; item.update_attributes()
  after_create     { ItemMailer.new_item_created(self).deliver }
  after_create     { category.inc(:items_count, 1) }
  after_update     { puts "updated" }
  after_destroy    { category.inc(:items_count, -1) } # item.destroy

end
