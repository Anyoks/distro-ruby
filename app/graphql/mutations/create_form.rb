module Mutations
  class CreateForm < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    field :form, Types::FormType, null: true

    # TODO: define arguments
    # argument :name, String, required: true

    argument :task_id, String, required: true
    argument :name, String, required: true
    argument :description, String, required: true

    # the form questions should be in an array 
    argument :form_questions, GraphQL::Types::JSON, required: false
    # argument :query, String, required: true
    # argument :position, Int, required: true
    # argument :response_type, String, required: true
    # argument :options, GraphQL::Types::JSON, required: false

    # TODO: define resolve method
    def resolve(task_id:,name:,description:,form_questions:)
      # { post: ... }
      byebug
      form = Form.new({
        name: name,
        task_id: task_id,
        description: description
      })

      if form.save
        # iterate through the hash and create the questions

        # question  =  form.form_questions.new({
        #   query: query,
        #   position: position,
        #   response_type: response_type,
        #   options: options
        # })
        saved_questions = []
        failed_questions = []
        form_questions['queries'].each do |question|
          var_question  =  form.form_questions.new({
            query: question['query'],
            position: question['position'],
            response_type: question['response_type'],
            options: question['options']
          })

            if var_question.save
              saved_questions << var_question
            else
              failed_questions << var_question
            end
            byebug
        end

        if failed_questions.length < 1
          {
            form: form,
            success: true,
            errors: []
          }
        else
          {
            form: nil,
            success: false,
            errors:  form.errors.messages
          }
        end
       
        
      else
        {
          form: nil,
          success: false,
          errors:  form.errors.messages
        }
      end
    end
  end
end
