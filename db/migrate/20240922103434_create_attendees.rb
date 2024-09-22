class CreateAttendees < ActiveRecord::Migration[7.2]
  def change
    drop_table :attendees

    create_table :attendees do |t|
      t.references :attendee, null: false, foreign_key: {to_table: :users}
      t.references :attended_event, null: false, foreign_key: {to_table: :events}

      t.timestamps
    end
  end
end
