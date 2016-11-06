# create_table "people", force: :cascade do |t|
#   t.string   "name",       null: false
#   t.integer  "house_id",   null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end


class Person < ActiveRecord::Base

  validates :name, presence: true
  validates :house_id, presence: true

  belongs_to :house, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
  }
end
