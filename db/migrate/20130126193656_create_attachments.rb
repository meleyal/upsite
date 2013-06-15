class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :page
      t.attachment :upload
      t.timestamps
    end
  end
end
