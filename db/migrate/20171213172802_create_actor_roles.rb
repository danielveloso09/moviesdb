class CreateActorRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :actor_roles, id: false do |t|
      t.references :actor
      t.references :movie
      t.timestamps
    end
  end
end
