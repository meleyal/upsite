class RemoveAttachments < ActiveRecord::Migration
  def change
    drop_table :attachments do |t|
    end
  end
end
