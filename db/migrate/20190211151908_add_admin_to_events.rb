class AddAdminToEvents < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:attendances, :user, index: true)
    add_reference(:attendances, :admin, index: true)
  end
end
