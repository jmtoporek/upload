class CreateFileuploads < ActiveRecord::Migration
  def self.up
    create_table :fileuploads do |t|
      t.string :name
      t.binary :data, :limit => 1.megabyte

      t.timestamps
    end
  end

  def self.down
    drop_table :fileuploads
  end
end
