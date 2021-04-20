require 'dotenv'
Dotenv.load
require 'active_record'
require 'sinatra/activerecord/rake'

require_relative 'reserve_inventory_summary'

namespace :reserve_inventory do

    desc 'Read in CSV files'
    task :read_in_csv_files do |t|
        ReserveInventory::GetInfo.new.read_in_csv_files
    end

end