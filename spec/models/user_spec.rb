require 'spec_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :encrypted_password }
  it { should have_db_column :stage_name }
  it { should have_db_column :twitter_handle }
  it { should have_db_column :verified }
  it { should have_db_column :city }
  it { should have_db_column :state }
  it { should have_db_column :country }
  it { should have_db_column :category }
  it { should have_db_column :tagline }
  it { should have_db_column :story }
  it { should have_db_column :profile_image_url }
  it { should have_many :posts }
end