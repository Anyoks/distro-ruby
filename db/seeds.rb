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

# names = ['Brigitte Kalondu 0736789809 kalondu@gmail.com', 'Edward Mutiso 0722345467 mutiso@gmail.com', 'Dickson Muteti 0721334412 muteti@gmail.com']
# fill = names
# Position.all.each do |pos|
#   details = fill.last
#   first_name   = details.split(' ')[0]
#   last_name    = details.split(' ')[1]
#   phone_number = details.split(' ')[2]
#   email        = details.split(' ')[3]
#   Staff.create!(first_name: first_name, last_name: last_name, phone_number: phone_number, uid:email ,email: email, password: '1234567', password_confirmation: '1234567', position_id: pos.id)
#   p "#{first_name} , #{last_name}, #{phone_number}, #{email}, #{pos.id}"
#   fill.pop
# end




# Assignment.where("id NOT IN (SELECT  assignment_id FROM Reports)").limit(30).each do |assign|
#   report = Report.new(completed: true, comments: "No issues", further_action_id: "da5f0404-5287-4ad1-a4a6-54d48210cae8", assignment_id: assign.id)
#   if (report.save)
#     p " complete report SAved #{report.id}"
#   else
#     p "complete resort Not SAved :: #{report.errors}"
#   end
  
# end
# counter = 0
# Assignment.where("id NOT IN (SELECT  assignment_id FROM Reports)").limit(30).each do |assign|

#  f = ["4520f5f7-8b67-445c-9712-75f3a7776593",
# "0e77913a-1077-4e0d-8644-f877eaba3a3b",
# "06723a70-c4d8-4fbc-97e8-cb368c1267f3",
# "670d7515-45ff-4dcd-9095-6be89abf4e1c"]
  
#   report = Report.new(completed: true, comments: "No issues", further_action_id: f[counter], assignment_id: assign.id)
#   if (report.save)
#     if (counter < 3)
#       p "F action resort SAved #{report.id}"
#       counter = counter + 1
#     else
#       counter = 0
#     end
#   else
#     p "F action  resort Not SAved :: #{report.errors} "
#   end
  
# end

# counter2 = 0
# Assignment.where("id NOT IN (SELECT  assignment_id FROM Reports)").limit(30).each do |assign|

#  f = ["4520f5f7-8b67-445c-9712-75f3a7776593",
# "0e77913a-1077-4e0d-8644-f877eaba3a3b",
# "06723a70-c4d8-4fbc-97e8-cb368c1267f3",
# "670d7515-45ff-4dcd-9095-6be89abf4e1c"]
  
#   report = Report.new(completed: false, comments: "No issues", further_action_id: f[counter2], assignment_id: assign.id)
#   if (report.save)
#     if (counter2 < 3)
#       p "pending resort SAved #{report.id}"
#       counter2 = counter2 + 1
#     else
#       counter2 = 0
#     end
#   else
#     p "pending  resort Not SAved :: #{report.errors}"
#   end
  
# end

#  days = 30
#  Assignment.all.each do |assign|
#    date = Date.today - days

#    assign.update_attributes(updated_at: date)
#    days = days - 1
#    if days == 0
#      days = 30
#    end
#  end

#############################################################################
#############################################################################
######################## LIVE SERVER SEEDS###################################
#############################################################################
#############################################################################

# puts"#############################################################################
# #############################################################################
# ##########################Further Action#####################################
# #############################################################################"

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Further Action.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#     if FurtherAction.find_by(name: "#{row['Action'].downcase}")
#         puts "Action EXISTS number #{row['Action']}----------Skipping"
#     else
#         # Create a new Obeject 
#         name        = row['Action'].nil? ? row['Action'] : row['Action'].downcase
#         description   = row['Description'].nil? ? row['Description'] : row['Description'].downcase
      
#         object = FurtherAction.new( name: name, description: description)
        
#         # Save the obeject
#         if object.valid?
#             object.save!
#             puts "#{object.name} ==> Ready to be saved"
#         else
#             puts "#{object.name} ERR:: Failed to Save! "
#             puts "\n"
#             puts "****Error****"
#             puts "#{object.errors.messages}"
#         end
#     end
# end

# puts"#############################################################################
# #############################################################################
# ##########################Schemes#############################################
# #############################################################################"
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Scheme.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#     if Scheme.find_by(name: "#{row['SCHEME'].downcase}")
#         puts "SCHEME EXISTS number #{row['SCHEME']}----------Skipping"
#     else
#         # Create a new Obeject 
#         name        = row['SCHEME'].nil? ? row['SCHEME'] : row['SCHEME'].downcase
#         # description   = row['Description']
      
#         object = Scheme.new( name: name)
        
#         # Save the obeject
#         if object.valid?
#             object.save!
#             puts "#{object.name} ==> Ready to be saved"
#         else
#             puts "#{object.name} ERR:: Failed to Save! "
#             puts "\n"
#             puts "****Error****"
#             puts "#{object.errors.messages}"
#         end
#     end
# end

# puts"#############################################################################
# #############################################################################
# ##########################Zones#############################################
# #############################################################################"
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Zones.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#     if Zone.find_by(name: "#{row['Zones'].downcase}")
#         puts "Zones EXISTS number #{row['Zones']}----------Skipping"
#     else
#         # Create a new Obeject 
#         name        = row['Zones'].nil? ? row['Zones'] : row['Zones'].downcase
#         # description   = row['Description']
#         scheme_name = row['Scheme'].nil? ? row['Scheme'] : row['Scheme'].downcase
#         sub_zone    = row['Sub-Zones'].nil? ? row['Sub-Zones'] : row['Sub-Zones'].downcase
      
#         object = Zone.new( name: name)
        
        
#         # Save the obeject
#         if object.valid?
#             object.save!
#              scheme = Scheme.find_by(name: "#{row['Scheme'].downcase}")
# 			            if scheme.present?
# 			              object.schemes << scheme
# 			               puts "#{object.name} ==>Added "
# 			            end
#             puts "#{object.name} ==> Ready to be saved"
#             # create a subzone

#             if Subzone.find_by(name: sub_zone)
#               puts "Subzone EXISTS  #{sub_zone}----------Skipping"
#             else
              
#               object0 = object.subzones.new(name: sub_zone)
#              if object0.valid? 
#                 object0.save!
#                 puts"#########################################
#                 ########creating subzone for zone ###########"
#                  puts "#{object0.name} ==> Ready to be saved"
#              else
#                 puts "#{object0.name} ERR:: Failed to Save! "
#                 puts "\n"
#                 puts "****Error****"
#                 puts "#{object0.errors.messages}"

#              end
#             end
            

#             # create scheme for it
#               if Scheme.find_by(name: scheme_name)
#                   puts "SCHEME EXISTS number #{scheme_name}----------Skipping"
#               else
#                 # Create a new Obeject             
#                 object1 = object.schemes.new( name: scheme_name)
#                 # Save the obeject
#                 if object1.valid?
#                   object1.save!
#                   puts"#########################################
#                   ########creating Scheme for zone ###########"
#                     puts "#{object1.name} ==> Ready to be saved"
#                 else
#                     puts "#{object1.name} ERR:: Failed to Save! "
#                     puts "\n"
#                     puts "****Error****"
#                     puts "#{object1.errors.messages}"
#                 end
#               end
#         else
#             puts "#{object.name} ERR:: Failed to Save! "
#             puts "\n"
#             puts "****Error****"
#             puts "#{object.errors.messages}"
#         end
#     end
# end

puts"#############################################################################
#############################################################################
##########################Zones Without schemes##################################
#############################################################################"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'PilotZone.csv'))
# display the wall of text
# puts csv_text  
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    if Zone.find_by(name: "#{row['Zones'].downcase}")
        puts "Zones EXISTS number #{row['Zones']}"
        
        sub_zone =  row['Sub-Zones'].downcase
        zone = Zone.find_by(name: "#{row['Zones'].downcase}")
        # search if its subzone also exists

        if zone.subzones.find_by(name: sub_zone ).present?
            # zone subzone combibation exists
            puts "Subzone + Zone EXISTS  #{sub_zone}----------Skipping"
        else
            # create subzone for zone
            subzone = zone.subzones.new(name: sub_zone )
            if subzone.save!
                puts "Subzone created! #{sub_zone}"
            end

        end
        
    else
        # Create a new Obeject 
        name        = row['Zones'].nil? ? row['Zones'] : row['Zones'].downcase
        # description   = row['Description']
        scheme_name = "unknown"
        sub_zone    = row['Sub-Zones'].nil? ? row['Sub-Zones'] : row['Sub-Zones'].downcase
      
        object = Zone.new( name: name)
        
        
        # Save the object
        if object.valid?
            object.save!
             scheme = Scheme.find_by(name: scheme_name)
			            if scheme.present?
			              object.schemes << scheme
			               puts "#{object.name} ==>Added "
			            end
            puts "#{object.name} ==> Ready to be saved"
            # create a subzone

            if Subzone.find_by(name: sub_zone)
              puts "Subzone EXISTS  #{sub_zone}----------Skipping"
            else
              
              object0 = object.subzones.new(name: sub_zone)
             if object0.valid? 
                object0.save!
                puts"#########################################
                ########creating subzone for zone ###########"
                 puts "#{object0.name} ==> Ready to be saved"
             else
                puts "#{object0.name} ERR:: Failed to Save! "
                puts "\n"
                puts "****Error****"
                puts "#{object0.errors.messages}"

             end
            end
            
        else
            puts "#{object.name} ERR:: Failed to Save! "
            puts "\n"
            puts "****Error****"
            puts "#{object.errors.messages}"
        end
    end
end

# puts"#############################################################################
# #############################################################################
# ##########################Departments#############################################
# #############################################################################"
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Dept.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#     if Department.find_by(name: "#{row['Departments'].downcase}")
#         puts "SCHEME EXISTS number #{row['Departments']}----------Skipping"
#     else
#         # Create a new Obeject 
#         name        = row['Departments'].nil? ? row['Departments'] : row['Departments'].downcase
#         subdept     = row['Sub Department'].nil? ? row['Sub Department'] : row['Sub Department'].downcase
      
#         object = Department.new( name: name)
        
#         # Save the obeject
#         if object.valid?
#             object.save!
#             puts "#{object.name} ==> Ready to be saved"
#             # create scheme for it
#               if Subdepartment.find_by(name: subdept)
#                   puts "SCHEME EXISTS number #{subdept}----------Skipping"
#               else
#                 # Create a new Obeject             
#                 object1 = object.subdepartments.new( name: subdept)
#                 # Save the obeject
#                 if object1.valid?
#                   object1.save!
#                   puts"#########################################
#                   ########creating Subdept for dept ###########"
#                     puts "#{object1.name} ==> Ready to be saved"
#                 else
#                     puts "#{object1.name} ERR:: Failed to Save! "
#                     puts "\n"
#                     puts "****Error****"
#                     puts "#{object1.errors.messages}"
#                 end
#               end
#         else
#             puts "#{object.name} ERR:: Failed to Save! "
#             puts "\n"
#             puts "****Error****"
#             puts "#{object.errors.messages}"
#         end
#     end
# end

# puts"#############################################################################
# #############################################################################
# ##########################Positions#############################################
# #############################################################################"
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Positions.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#     if Position.find_by(name: "#{row['Position Name'].downcase}")
#         puts "Positions EXISTS number #{row['Position Name']}----------Skipping"
#     else
#         # Create a new Obeject 
#         name          =  row['Position Name'].nil? ?  row['Position Name'] : row['Position Name'].downcase
#         description   = row['Description'].nil? ? row['Description'] : row['Description'].downcase
#         subdept_name  = row['Sub Department'].nil? ? row['Sub Department'] : row['Sub Department'].downcase
      
#         subdept  = Subdepartment.where(name:subdept_name).first
        
#         if subdept.present?
#           object = Position.new( name: name, description: description, subdepartment_id: subdept.id)
#           # Save the obeject
#           if object.valid?
#               object.save!
#               puts "#{object.name} ==> Ready to be saved"
#           else
#               puts "#{object.name} ERR:: Failed to Save! "
#               puts "\n"
#               puts "****Error****"
#               puts "#{object.errors.messages}"
#           end
#         else
#            puts "Subdepartment DOES NOT EXIST  #{row['Position Name']}----------Skipping"
#         end
        
#     end
# end


# puts"#############################################################################
# #############################################################################
# ##########################Tasks#############################################
# #############################################################################"
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Tasks.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#     if Task.find_by(name: "#{row['Tasks'].downcase}")
#         puts "Task EXISTS  #{row['Tasks']}----------Skipping"
#     else
#         # Create a new Obeject 
#         name          = row['Tasks'].nil? ? row['Tasks'] : row['Tasks'].downcase
#         # description   = row['Description'].downcase
#         subdept_name  = row['Sub Department'].nil? ? row['Sub Department'] : row['Sub Department'].downcase
      
#         subdept  = Subdepartment.where(name:subdept_name).first
        
#         if subdept.present?
#           object = Task.new( name: name, subdepartment_id: subdept.id)
#           # Save the obeject
#           if object.valid?
#               object.save!
#               puts "#{object.name} ==> Ready to be saved"
#           else
#               puts "#{object.name} ERR:: Failed to Save! "
#               puts "\n"
#               puts "****Error****"
#               puts "#{object.errors.messages}"
#           end
#         else
#            puts "SDEPARTMENT DOES NOT EXIST For task  #{row['Task']}----------Skipping"
#         end
        
#     end
# end

# puts"#############################################################################
# #############################################################################
# ##########################WalkRoute#############################################
# #############################################################################"
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Walkroutes.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#     if Walkroute.find_by(name: "#{row['Walk-routes'].downcase}")
#         puts "Walk-routes EXISTS  #{row['Walk-routes']}----------Skipping"
#     else
#         # Create a new Obeject 
#         name          = row['Walk-routes'].nil? ? row['Walk-routes'] : row['Walk-routes'].downcase
#         # description   = row['Description'].downcase
#         subzone_name  = row['Subzone'].nil? ? row['Subzone'] : row['Subzone'].downcase
      
#         subzone  = Subzone.where(name:subzone_name).first
        
#         if subzone.present?
#           object = Walkroute.new( name: name, subzone_id: subzone.id)
#           # Save the obeject
#           if object.valid?
#               object.save!
#               puts "#{object.name} ==> Ready to be saved"
#           else
#               puts "#{object.name} ERR:: Failed to Save! "
#               puts "\n"
#               puts "****Error****"
#               puts "#{object.errors.messages}"
#           end
#         else
#            puts "Subzone DOES NOT EXIST For walkroute  #{row['Walk-routes']}----------Skipping"
#         end
        
#     end
# end


# puts"#############################################################################
# #############################################################################
# ##########################Staff#############################################
# #############################################################################"
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Staff.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#     if Staff.find_by(phone_number: "#{row['Phone Number']}")
#         puts "Staff EXISTS  #{row['Phone Number']}----------Skipping"
#     else
#         # Create a new Obeject 
#         phone_number          = row['Phone Number']
#         first_name          = row['First Name'].nil? ? row['First Name'] : row['First Name'].strip.downcase
#         last_name          =  row['Last Name'].nil? ? row['Last Name'] : row['Last Name'].downcase
#         position_name         = row['Position'].nil? ? row['Position'] : row['Position'].downcase
#         password                = "#{first_name}" + "." + "#{last_name}"
        
      
#         position  = Position.where(name:position_name).first
        
#         if position.present?
#           object = Staff.new( email: "#{first_name + '@'+'test.com'}",first_name: first_name, last_name: last_name, phone_number: phone_number, password: password, password_confirmation: password, position_id: position.id)
#           # Save the obeject
#           if object.valid?
#               object.save!
#               puts "#{object.first_name} ==> Ready to be saved"
#           else
#               puts "#{object.first_name} ERR:: Failed to Save! "
#               puts "\n"
#               puts "****Error****"
#               puts "#{object.errors.messages}"
#           end
#         else
#            puts "Postion DOES NOT EXIST For Staff  #{row['Position']}----------Skipping"
#         end
        
#     end
# end


# Meter Serial,Account,Account Name,Walk Route,Long,Lat

# puts"#############################################################################
# #############################################################################
# ##########################Accounts#############################################
# #############################################################################"
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Accounts C.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#     if Account.find_by(meter_serial: "#{row['Meter Serial']}")
#         puts "Account EXISTS  #{row['Meter Serial']}----------Skipping"
#     else
#         # Create a new Obeject 
#         meter_serial          = row['Meter Serial']
#         acc_name          = row['Account Name']
#         acc_no          = row['Account']
#         walkroute_name         = row['Walk Route'].nil? ? row['Walk Route'] : row['Walk Route'].downcase
#         longitude               = row['Long']
#         latitude                = row['Lat']
        
      
#         walkroute  = Walkroute.where(name:walkroute_name).first
        
#         if walkroute.present?
          
#           object = Account.new( number:acc_no, meter_serial: meter_serial, name: acc_name, walkroute_id: walkroute.id, latitude: latitude, longitude: longitude  )
#           # Save the obeject
#           if object.valid?
#               object.save!
#               puts "#{object.name} ==> Ready to be saved"
#           else
#               puts "#{object.name} ERR:: Failed to Save! "
#               puts "\n"
#               puts "****Error****"
#               puts "#{object.errors.messages}"
#           end
#         else
#            puts "WalkROUTE DOES NOT EXIST For aCCOUNT  #{row['Walk Route']}----------Skipping"
#         end
        
#     end
# end

puts"#############################################################################
#############################################################################
##########################Accounts with subzones & acc numbers####################
#############################################################################"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'PilotAccounts_RUJWASCO.csv'))
# display the wall of text
# puts csv_text  
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    acc = Account.find_by(number: "#{row['New Acc']}")
    # puts row.to_hash
    if acc.present?
        puts "Account EXISTS  #{row['New Acc']}----------Update"

        # New Acc,Old Acc. Number,Acc.Name,Meter No.,Phone No.,Zone,Sub-Zone,Longitude,Latitude ,
        # Walkroute,Water,Sewer,Connection Status,Tarriff,Building Type,House Type,Hse. Units
        old_acc         = row['Old Acc. Number']
        acc_name          = row['New Acc']
        acc_no          = row['New Acc']
        walkroute_name         = row['Walkroute'].nil? ? row['Walkroute'] : row['Walkroute'].downcase
        longitude               = row['Longitude']
        latitude                = row['Latitude']
        sub_zone_name        = row['Sub-Zone'].downcase
        
        subzone = Subzone.find_by(name: sub_zone_name)

        if subzone.present?
            puts "Subzone EXISTS  #{sub_zone_name}----------Check walk route"
            walkroute = subzone.walkroutes.find_by(name: walkroute_name)
            if walkroute.present?
                puts "Walk route EXISTS  #{walkroute_name}----------Update account"
                # update
                 acc.update_attributes(old_account_number: old_acc, longitude: longitude, latitude: latitude, walkroute_id: walkroute.id, name: acc_name )
            else
                 puts "Walk route DOES NOT EXIST  #{walkroute_name}----------create walkroute"
                # create walkroute
                new_walkroute = subzone.walkroutes.new(name: walkroute_name)
                if new_walkroute.save!
                    puts "Walk Created  #{walkroute_name}----------Update Account"
                    acc.update_attributes(old_account_number: old_acc, longitude: longitude, latitude: latitude, walkroute_id: new_walkroute.id, name: acc_name )
                else
                    puts "Error saving Walkroute  #{walkroute_name}---------- ERROR"
                    puts "#{new_walkroute.errors.messages}"
                    puts "--------------"
                end
                
            end
        else 
            # subzone is absent.
            puts "Subzone DOES NOT EXIST  #{sub_zone_name}----------DOING NOTHING"
        end
         #<Account id: nil, number: nil, meter_serial: nil, name: nil, walkroute_id: nil, address: nil, 
        #  latitude: nil, longitude: nil, created_at: nil, updated_at: nil, old_account_number: nil, sewer: nil, 
        # water: nil, connection_status: nil, tariff: nil, building_type: nil, house_type: nil, house_units: nil> 
       
        
    else
         puts "Account DOES NOT EXIST  #{row['New Acc']}----------CREATE"

        # New Acc,Old Acc. Number,Acc.Name,Meter No.,Phone No.,Zone,Sub-Zone,Longitude,Latitude ,
        # Walkroute,Water,Sewer,Connection Status,Tarriff,Building Type,House Type,Hse. Units
        old_acc         = row['Old Acc. Number']
        acc_name          = row['New Acc']
        acc_no          = row['New Acc']
        walkroute_name         = row['Walkroute'].nil? ? row['Walkroute'] : row['Walkroute'].downcase
        longitude               = row['Longitude']
        latitude                = row['Latitude']
        sub_zone_name        = row['Sub-Zone'].downcase
        
        subzone = Subzone.find_by(name: sub_zone_name)
        
      


         if subzone.present?
            puts "Subzone EXISTS  #{sub_zone_name}----------Check walk route"
            walkroute = subzone.walkroutes.find_by(name: walkroute_name)
            if walkroute.present?
                puts "Walk route EXISTS  #{walkroute_name}----------CREATE account"
                # create
                 Account.create!(number: acc_no,  old_account_number: old_acc, longitude: longitude, latitude: latitude, walkroute_id: walkroute.id, name: acc_name )
            else
                 puts "Walk route DOES NOT EXIST  #{walkroute_name}----------create walkroute"
                # create walkroute
                new_walkroute = subzone.walkroutes.new(name: walkroute_name)
                if new_walkroute.save!
                    puts "Walk Created  #{walkroute_name}----------create Account"
                   Account.create!(number: acc_no,  old_account_number: old_acc, longitude: longitude, latitude: latitude, walkroute_id: new_walkroute.id, name: acc_name )
                else
                    puts "Error saving Walkroute  #{walkroute_name}---------- ERROR"
                    puts "#{new_walkroute.errors.messages}"
                    puts "--------------"
                end
                
            end
        else 
            # subzone is absent.
            puts "Subzone DOES NOT EXIST  #{sub_zone_name}----------DOING NOTHING"
        end        
    end
end

# puts"#############################################################################
# #############################################################################
# ##########################Admin#############################################
# #############################################################################"
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Admin.csv'))
# # display the wall of text
# # puts csv_text  
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#     if User.find_by(email: "#{row['Email']}")
#         puts "Staff EXISTS  #{row['Phone Number']}----------Skipping"
#     else
#         # Create a new Obeject 
#         phone_number          = row['Phone Number']
#         email                 = row['Email']
#         id_number             = row['ID Number']
#         first_name          = row['First Name'].nil? ? row['First Name'] : row['First Name'].strip.downcase
#         last_name          =  row['Last Name'].nil? ? row['Last Name'] : row['Last Name'].downcase
#         position_name         = row['Position'].nil? ? row['Position'] : row['Position'].downcase
#         password                = id_number
        
      
#         # position  = Position.where(name:position_name).first
#         # role = Role.f
#         # if position.present?
#           object = User.new( email: email ,first_name: first_name, last_name: last_name, password: password, password_confirmation: password)
#           # Save the obeject
#           if object.valid?
#               object.save!
#               puts "#{object.first_name} ==> Ready to be saved"
#           else
#               puts "#{object.first_name} ERR:: Failed to Save! "
#               puts "\n"
#               puts "****Error****"
#               puts "#{object.errors.messages}"
#           end
#         # else
#           #  puts "Postion DOES NOT EXIST For Staff  #{row['Position']}----------Skipping"
#         # end
        
#     end
# end
