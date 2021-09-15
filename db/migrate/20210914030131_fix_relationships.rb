class FixRelationships < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :tea, foreign_key: true
    remove_reference :teas, :subscription
  end
end
