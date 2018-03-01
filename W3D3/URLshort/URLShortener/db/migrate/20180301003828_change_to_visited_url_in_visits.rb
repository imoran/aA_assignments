class ChangeToVisitedUrlInVisits < ActiveRecord::Migration[5.1]
  def change
    rename_column :visits, :shortened_url_id, :visited_url_id
  end
end
