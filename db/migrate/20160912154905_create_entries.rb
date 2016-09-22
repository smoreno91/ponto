class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references  :user, foreign_key: true
      t.datetime    :time
      t.integer     :status
      t.text        :obs

      t.timestamps
    end
  end
end
