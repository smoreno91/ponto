class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.belongs_to  :company, index: true
      t.belongs_to  :user, index: true
      t.boolean     :is_active, null: false, default: true
      t.string      :identification
      t.integer     :identification_type
      t.date        :birth_date
      t.float       :balance, default: 0

      t.timestamps
    end
  end
end
