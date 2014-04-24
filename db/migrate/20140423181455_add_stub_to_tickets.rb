class AddStubToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :stub, :string
  end
end
