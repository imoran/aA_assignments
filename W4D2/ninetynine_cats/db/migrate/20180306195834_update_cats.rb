class UpdateCats < ActiveRecord::Migration[5.1]
  def change
    rename_column :cats, :birth_data, :birth_date
  end
end
