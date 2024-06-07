class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations,
      comment: "List of organizations" do |t|
      t.string :name, null: false, 
        comment: "The name of the organization"

      t.timestamps null: false
    end
  end
end
