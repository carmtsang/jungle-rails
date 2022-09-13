class CreateWidgets < ActiveRecord::Migration[6.1]
  def change
    create_table :widgets do |t|

      t.timestamps
    end
  end
end
