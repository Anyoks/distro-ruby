module Mutations
  class CreateReport < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :completed, Boolean, required: true
    argument :comments, String, required: true
    argument :further_action_id, String, required: true
    argument :assignment_id, String, required: true
    argument :other_comment, String, required: false
    argument :picture, String, required: false # base 64 string

    field :report, Types::ReportType, null: false
    field :errors, [String], null: false
    field :other, String, null: true


    def resolve(completed:,comments:,further_action_id:,assignment_id:, other_comment:, picture:)
      report = Report.new(completed: completed ,comments: comments,further_action_id: further_action_id,assignment_id: assignment_id)
      # byebug
      if report.save

        upload = upload_picture(report, picture)

        # byebug
        if upload
          
          if other_comment.length != 0
            Other.create!(name: other_comment, further_action_id: further_action_id)
            # Successful creation, return the created object with no errors
            {
              report: report,
              other: 'yes',
              picture: 'yes',
              errors: [],
            }
          else
            {
              report: report,
              other: nil,
              picture: 'yes',
              errors: [report.errors.full_messages],
            }
           end
        else
          {
              report: report,
              other: nil,
              picture: nil,
              errors: [upload],
          }
        end
        
      else
        # Failed save, return the errors to the client
        # raise GraphQL::ExecutionError, report.errors.full_messages.join(", ")
      end
      # raise GraphQL::ExecutionError, report.errors.full_messages.join(", ")
    ensure
      # makes sure the temp files are cleaned
      clean_tempfile 
    end

    def upload_picture(report, picture)
      filename = report.assignment.staff.first_name

        @tempfile = Tempfile.new(filename)
        @tempfile.binmode
        @tempfile.write Base64.decode64(picture)
        @tempfile.rewind
        content_type = `file --mime -b #{@tempfile.path}`.split(";")[0]
        extension = content_type.match(/gif|jpeg|png/).to_s
        
        @tempfile2 = Tempfile.new([filename, ".#{extension}"])
        @tempfile2.binmode
        @tempfile2.write Base64.decode64(picture)
        @tempfile2.rewind
        # byebug
        pic = report.pictures.create!(picture: @tempfile2 )
        if pic
          return true
        else
          return pic.errors.full_messages
        end

        # byebug
    end

    def clean_tempfile
      Rails.logger.info("Cleaning Temp files")
      if @tempfile
        @tempfile.close
        @tempfile.unlink
      end

      if @tempfile2
        @tempfile2.close
        @tempfile2.unlink
      end
    end
  end
end
