#reserve_inventory_summary.rb

require 'dotenv'
require 'csv'
#Dotenv.load
require 'active_record'
require "sinatra/activerecord"

Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file }


module ReserveInventory
    class GetInfo

        def initialize
            Dotenv.load
            

        end

        def read_in_csv_files
            puts "Starting read in csv files ..."
            myformat = "%Y-%m-%d %H-%M-%S"

            SummaryReserveInventory.delete_all
            # Now reset index
            ActiveRecord::Base.connection.reset_pk_sequence!('summary_reserve_inventory')


            myfiles = Dir["./csv/**/*.csv"]
            
            myfiles.each do |myfile|
                puts myfile.inspect
                my_datetime_str = myfile[/\d\d\d\d-\d\d-\d\d \d\d-\d\d-\d\d/i]
                puts my_datetime_str
                my_date_time = DateTime.strptime(my_datetime_str, myformat)
                puts my_date_time.inspect
                read_in_csv(myfile, my_date_time)
                
            end

        end

        def read_in_csv(file, my_date_time)
            CSV.foreach(file, :encoding => 'ISO-8859-1', :headers => true) do |row|
                #puts row.inspect
                my_adjustment = row['shopify_adjustment'].to_i
                if my_adjustment < 0
                    puts row.inspect
                    SummaryReserveInventory.create(product_id: row['product_id'], variant_id: row['variant_id', ], product_title: row['product_title'], variant_title: row['variant_title'], sku: row['sku'],  total_reserve_inventory_obligations: row['total_reserve_inventory_obligations'].to_i, received_from_cims: row['received_from_CIMS'].to_i, shopify_adjustment: row['shopify_adjustment'], add_back_pad: row['add_back_pad'], inventory_updated: my_date_time )

                end

            end

        end


    end
end