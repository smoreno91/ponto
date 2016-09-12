class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.references  :company,   foreign_key: true
      t.references  :user,      foreign_key: true
      t.boolean     :is_active
      t.string      :identification
      t.integer     :identification_type
      t.date        :birth_date
      t.float       :balance

      t.timestamps
    end
  end
end
