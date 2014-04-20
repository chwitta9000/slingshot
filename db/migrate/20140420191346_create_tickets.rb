class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user
      t.string :title
      t.decimal :price
      t.date :date
      t.time :time
      t.string :description

      t.timestamps
    end
    add_index :tickets, :user_id
  end
end
