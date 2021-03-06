module Mutations
  class UpdatePosition < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :name, String, required: true
    argument :description, String, required: true
    argument :id, String, required: true
    # argument :department_id, String, required: true
    argument :subdepartment_ids, [String], required: true
     argument :staff_ids,[ String], required: true

    field :position, Types::PositionType, null: true


    def resolve(name:,description:,id:,subdepartment_ids:,staff_ids:)
      # byebug
      position = Position.find(id)

      if position.present?
          position.update_attributes(name: name,description: description)
          subdepartments = []
          if !subdepartment_ids.empty?
            # iterate and add each position to array
            subdepartment_ids.each do |sub|
              subdepartment = Subdepartment.find(sub)
              if subdepartment
                 subdepartments << subdepartment
              end
            end
            # add all subdepartments to the HABTM join table
            #  byebug
            position.subdepartments = subdepartments
          else
            # remove all subdepartments
            position.subdepartments = subdepartments
          end

          if !staff_ids.empty?
            staffs = []
            staff_ids.each do |id|
              staff =Staff.find(id)
              staffs << staff
            end
            position.staffs = staffs
          else
            staffs = []
            # remove all sfatt
            position.staffs = staffs
         end

          MutationResult.call(
            obj: { position: position },
            success: true,
            errors:  []
          )
      else
          MutationResult.call(
            obj: { },
            success: false ,
            errors: position.errors 
          )
      end
    end


  end
end
