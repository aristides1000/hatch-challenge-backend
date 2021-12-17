class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :external_number
      t.string :internal_number
      t.string :postal_code
      t.string :colony
      t.string :municipality
      t.string :city
      t.string :state
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end
