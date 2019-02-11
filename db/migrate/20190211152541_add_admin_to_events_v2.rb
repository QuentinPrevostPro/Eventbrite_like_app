class AddAdminToEventsV2 < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:attendances, :admin, index: true)
    add_reference(:events, :admin, index: true)
    add_reference(:attendances, :attendee, index: true)
  end
end
