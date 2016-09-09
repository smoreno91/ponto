class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string  :slug
      t.boolean :is_active
      t.string  :business_name
      t.string  :comercial_name
      t.string  :identification
      t.text    :address
      t.string  :city
      t.string  :state
      t.text    :holidays
      t.text    :business_days

      t.timestamps
    end
    add_index :companies, :slug, unique: true
  end
end
