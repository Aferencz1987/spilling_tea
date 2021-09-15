class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :subscriptions, :status, :string, default: "active"
  end
end
