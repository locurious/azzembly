class DeviseCreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table(:businesses) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :businesses, :email,                :unique => true
    add_index :businesses, :reset_password_token, :unique => true
    # add_index :businesses, :confirmation_token,   :unique => true
    # add_index :businesses, :unlock_token,         :unique => true
    # add_index :businesses, :authentication_token, :unique => true
  end

  def self.down
    drop_table :businesses
  end
end
