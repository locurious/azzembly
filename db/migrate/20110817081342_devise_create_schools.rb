class DeviseCreateSchools < ActiveRecord::Migration
  def self.up
    create_table(:schools) do |t|
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

    add_index :schools, :email,                :unique => true
    add_index :schools, :reset_password_token, :unique => true
    # add_index :schools, :confirmation_token,   :unique => true
    # add_index :schools, :unlock_token,         :unique => true
    # add_index :schools, :authentication_token, :unique => true
  end

  def self.down
    drop_table :schools
  end
end
