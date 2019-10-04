require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#   ROles seeds
# ['admin','moderator', 'employee'].each do |role|
# 	if Role.find_by(name: role).present?
# 		puts "ROLE EXISTS #{role}----------Skipping"
# 	else
#          Role.find_or_create_by({name: role})
#          puts "ROLE CREATED #{role}----------SAVED"
#  	end
# end

# # Further action seeds
# ['revisit to complete job','none','disconnect', 'disconnect from mains', 'reconnect', 'other'].each do |role|
# 	if FurtherAction.find_by(name: role).present?
# 		puts "Action EXISTS #{role}----------Skipping"
# 	else
# 		FurtherAction.find_or_create_by({name: role})
#          puts "Action CREATED #{role}----------SAVED"
#  	end
# end

# # Task  seeds
# ['verify'].each do |role|
# 	if Task.find_by(name: role).present?
# 		puts "Task EXISTS #{role}----------Skipping"
# 	else
# 		Task.find_or_create_by({name: role, subdepartment_id: 'a3726ba8-fafd-40f3-9ddc-0ec22cb7a815'})
#          puts "Task CREATED #{role}----------SAVED"
#  	end
# end

# # Task  seeds
# ['disconnect', 'disconnect from mains', 'reconnect', 'new connection'].each do |role|
# 	if Task.find_by(name: role).present?
# 		puts "Task EXISTS #{role}----------Skipping"
# 	else
# 		Task.find_or_create_by({name: role, subdepartment_id: '7aad0c94-a32e-44e5-a888-c9c4e2bc8751'})
#          puts "Task CREATED #{role}----------SAVED"
#  	end
# end

# # Assignments seed
# Task.all.order("RANDOM()").each do |task|
#     Staff.all.order("RANDOM()").each do |staff|
#       Account.all.order("RANDOM()").first(10).each do |acc|
# 		p "#{task.name} == #{staff.first_name} == #{acc.name}"
# 		Assignment.create!(staff_id: staff.id, task_id: task.id, account_id: acc.id)
#       break
#       end
#     break
#     end
#   end
	

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

# # Position
# ['Billing', 'Technician' ].each do |stage|
#     if Position.find_by_name("#{stage}").present?
#         puts "STAGE EXISTS #{stage}----------Skipping"        
#     else
#         Position.find_or_create_by({name: stage, description: "This is a stage desc"})
#         puts "Stage #{stage}----------SAVED" 
#     end
# end


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

names = ['Brigitte Kalondu 0736789809 kalondu@gmail.com', 'Edward Mutiso 0722345467 mutiso@gmail.com', 'Dickson Muteti 0721334412 muteti@gmail.com']
fill = names
Position.all.each do |pos|
  details = fill.last
  first_name   = details.split(' ')[0]
  last_name    = details.split(' ')[1]
  phone_number = details.split(' ')[2]
  email        = details.split(' ')[3]
  Staff.create!(first_name: first_name, last_name: last_name, phone_number: phone_number, uid:email ,email: email, password: '1234567', password_confirmation: '1234567', position_id: pos.id)
  p "#{first_name} , #{last_name}, #{phone_number}, #{email}, #{pos.id}"
  fill.pop
end
