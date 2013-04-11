class AddPhotoColumnToEmployees < ActiveRecord::Migration
  def change
    add_attachment :employees, :photo
  end
end
