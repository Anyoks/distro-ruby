module Mutations
  class UpdateForm < GraphQL::Schema::RelayClassicMutation
    field :form, Types::FormType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true

    # TODO: define arguments
    # argument :name, String, required: true

    argument :task_id, String, required: false
    argument :form_id, String, required: true
    argument :name, String, required: true
    argument :description, String, required: true

    # remove questions
    argument :questions_to_remove, [String], required: false
    # the form questions should be in an array 
    argument :form_questions, GraphQL::Types::JSON, required: false

    def resolve(task_id:,form_id:,name:,description:,form_questions:,questions_to_remove:)
      form = Form.find(form_id)

      if form.present?
        # iterate through the hash and create the questions
        form.update_attributes({
          name: name,
          task_id: task_id,
          description: description
        })
        
        # remove questions
        if questions_to_remove.length > 0
          questions_to_remove.each do |question|
            form.form_questions.find(question.id).destroy
          end
        end

        # update questions
        unless form_questions['queries'] == nil
          form_questions['queries'].each do |question|
          var_question = form.form_questions.find(question['id'])
            var_question.update_attributes({
              query: question['query'],
              position: question['position'],
              response_type: question['response_type'],
              options: question['options']
            })

          end
        end
     

        {
          form: form,
          success: true,
          errors:  []
        }
        
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