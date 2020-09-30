class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations, id: :uuid do |t|
      t.string :name
      t.string :subdomain

      t.timestamps
    end
  end
end
