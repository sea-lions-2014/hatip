require 'spec_helper'

describe Post do
  it { should belong_to :user }
  it { should have_db_column :title }
  it { should have_db_column :youtube_url }
  it { should have_db_column :description }
  it { should have_db_column :hype }
  it { should allow_mass_assignment_of :youtube_url }
  it { should allow_mass_assignment_of :title }
  it { should allow_mass_assignment_of :description }
  it { should allow_mass_assignment_of :hype }
end