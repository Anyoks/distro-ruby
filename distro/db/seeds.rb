require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#   Scheme seeds
# ['Ruiru', 'Jacaranda', 'Juja'].each do |schm|
# 	if Scheme.find_by_name("#{schm}").present?
# 		puts "SCH EXISTS #{schm}----------Skipping"
# 	else
#         Scheme.find_or_create_by({name: schm, description: "Water Treatment company"})
#  	end
# end

# Zone

# ['21 Ruiru'].each do |zone|
#     if Zone.find_by_name("#{zone}").present?
#         puts "SCH EXISTS #{zone}----------Skipping"        
#     else
#         Zone.find_or_create_by({name: zone, description: "Water Treatment company"})
#     end

# end

# Sub Zone
# ['006 Thome'].each do |subzone|
#     if Subzone.find_by_name("#{subzone}").present?
#         puts "SCH EXISTS #{subzone}----------Skipping"        
#     else
#         Subzone.find_or_create_by({name: subzone, description: "Water Treatment company"})
#         puts "SUBZONE #{subzone}----------Skipping" 
#     end

# end

# stages

# ['Assign', 'Further Action', 'Pending', 'Complete'].each do |stage|
#     if Stage.find_by_name("#{stage}").present?
#         puts "STAGE EXISTS #{stage}----------Skipping"        
#     else
#         Stage.find_or_create_by({name: stage, description: "This is a stage desc"})
#         puts "Stage #{stage}----------SAVED" 
#     end
# end

# # Departments
# ['Billing', 'Technical' ].each do |departments|
#     if Department.find_by_name("#{departments}").present?
#         puts "STAGE EXISTS #{departments}----------Skipping"        
#     else
#         Department.find_or_create_by({name: departments, description: "This is a stage desc"})
#         puts "Stage #{departments}----------SAVED" 
#     end
# end

# # Subdepartments Billing
# ['Meter Reading'].each do |sudepartment|
#     if Subdepartment.find_by(name: "#{sudepartment}").present?
#         puts "DEPT EXISTS #{sudepartment}----------Skipping"        
#     else
#         Subdepartment.find_or_create_by({name: sudepartment, description: "This is a subDept desc", department_id: Department.find_by(name: 'Billing').id})
#         puts "DEPT #{sudepartment}----------SAVED" 
#     end
# end

# #  Subdepartments Technical
# ['Disconnection', 'NRW'].each do |subdepartment|
#     if Subdepartment.find_by(name: "#{subdepartment}").present?
#         puts "SUBDEPT EXISTS #{subdepartment}----------Skipping"        
#     else
#         Subdepartment.find_or_create_by({name: subdepartment, description: "This is a Subdept desc", department_id: Department.find_by(name: 'Technical').id})
#         puts "SUBDEPT #{subdepartment}----------SAVED" 
#     end
# end

# # Position Billing meter Readers
# ['Meter Readers' ].each do |pos|
#     if Position.find_by(name: "#{pos}").present?
#         puts "STAGE EXISTS #{pos}----------Skipping"        
#     else
#         Position.find_or_create_by({name: pos, description: "This is a stage desc", subdepartment_id: Subdepartment.find_by(name:'Meter Reading' ).id })
#         puts "Position #{pos}----------SAVED" 
#     end
# end

# # Position Technical disconnection
# ['Plumber Disconnection' ].each do |pos|
#     if Position.find_by(name: "#{pos}").present?
#         puts "STAGE EXISTS #{pos}----------Skipping"        
#     else
#         Position.find_or_create_by({name: pos, description: "This is a POS desc", subdepartment_id: Subdepartment.find_by(name:'Disconnection' ).id })
#         puts "Position #{pos}----------SAVED" 
#     end
# end

# # Position Technical NRW
# ['Plumber NRW' ].each do |pos|
#     if Position.find_by(name: "#{pos}").present?
#         puts "STAGE EXISTS #{pos}----------Skipping"        
#     else
#         Position.find_or_create_by({name: pos, description: "This is a POS desc", subdepartment_id: Subdepartment.find_by(name:'NRW' ).id })
#         puts "Position #{pos}----------SAVED" 
#     end
# end

# staff Meter readers position
['Jacob Bingu', 'James Mwangi'].each do |pos|
    firstName   = pos.split(' ')[0]
    lastName    = pos.split(' ')[1]
    position_id = Position.find_by(name: 'Meter Readers').id

    if Staff.find_by(firstName: firstName, lastName: lastName).present?
        puts "STAFF EXISTS #{pos}----------Skipping"        
    else
        Staff.find_or_create_by({firstName: firstName,  lastName: lastName, position_id: position_id })
        puts "STAFF #{pos}----------SAVED" 
    end
end

# staff Plumbers Disconn position
['Brian Ruto', 'Elijah Mwilu' ].each do |pos|
    firstName   = pos.split(' ')[0]
    lastName    = pos.split(' ')[1]
    position_id = Position.find_by(name: 'Plumber Disconnection').id

    if Staff.find_by(firstName: firstName, lastName: lastName).present?
        puts "STAFF EXISTS #{pos}----------Skipping"        
    else
        Staff.find_or_create_by({firstName: firstName,  lastName: lastName, position_id: position_id })
        puts "STAFF #{pos}----------SAVED" 
    end
end

# staff Plumbers NRW position
['Jefta Rotich', 'Peter Luganje' ].each do |pos|
    firstName   = pos.split(' ')[0]
    lastName    = pos.split(' ')[1]
    position_id = Position.find_by(name: 'Plumber NRW').id

    if Staff.find_by(firstName: firstName, lastName: lastName).present?
        puts "STAFF EXISTS #{pos}----------Skipping"        
    else
        Staff.find_or_create_by({firstName: firstName,  lastName: lastName, position_id: position_id })
        puts "STAFF #{pos}----------SAVED" 
    end
end

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Accounts.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   #  Put s the hash to be save
# #   puts row.to_hash
#   if Walkroute.find_by(name: "#{row['Walk Route']}")
#     puts "WALK ROUTE  EXISTS number #{row['Walk Route']}----------Skipping"
#   else
#     Walkroute.create!(name: "#{row['Walk Route']}", subzone_id: Subzone.first.id)
#     puts "WALK ROUTE CREATED #{row['Route']}----------SAVED"
#   end
# end
  
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Accounts.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|

#     if Account.find_by(number: "#{row['Account']}")
#         puts "ACCOUNT EXISTS number #{row['Account']}----------Skipping"
#     else
#         # Create a new Obeject 
#         number        = row['Account']
#         meterSerial   = row['Mtr Serial']
#         name          = row['Account']
#         walkroute_id  = Walkroute.where( name: row['Walk Route']).first.id
#         address       =  "default"
#         latitude      = row['Lat']
#         longitude     = row['Long']      

#         account = Account.create!( number: number, meterSerial: meterSerial, name: name, walkroute_id: walkroute_id, address: address, latitude: latitude, longitude: longitude)
        
#         # Save the obeject
#         if account
#             puts "#{account.number} ==> saved"
#         else
#             puts "#{account.number} ERR:: Failed to Save! "
#             puts "\n"
#             puts "****Error****"
#             puts "#{account.errors.messages}"
#         end
#     end
#   end

