class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :portfolio, :string
    add_column :projects, :pm, :string
    add_column :projects, :arch, :string
    add_column :projects, :dev, :string
    add_column :projects, :sap, :string
    add_column :projects, :contact, :string
    add_column :projects, :description, :string
    add_column :projects, :created_at, :datetime
    add_column :projects, :updated_at, :datetime
  end
end
