module Mutations
  class CreateForm < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    field :form, Types::FormType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true

    # TODO: define arguments
    # argument :name, String, required: true

    argument :task_id, String, required: true
    argument :name, String, required: true
    argument :description, String, required: true

    # the form questions should be in an array 
    argument :form_questions, GraphQL::Types::JSON, required: false

    # TODO: define resolve method
    def resolve(task_id:,name:,description:,form_questions:)
      form = Form.new({
        name: name,
        task_id: task_id,
        description: description
      })

      if form.save
        # iterate through the hash and create the questions
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
# mutation ($taskId: String!, $name: String!, $formQuestions: JSON) {
#   createForm(input:{
#     name: $name,
#     taskId: $taskId,
#     description: "This is a test form 111",
#     formQuestions: $formQuestions
  
#   }){
# 	form{
#       id
#       name 
# 			formQuestions{
#         id
#         options
#         query
#         responseType
#       }    
#   	}
#   }
# {
#    "queries":[
#       {
#          "query":"sample query",
#          "position":"2",
#          "response_type":"text",
#          "options":{
#             "type":"select",
#             "value":[
#                "able",
#                "unable"
#             ]
#          }
#       },
#       {
#          "query":"sample query 2",
#          "position":"1",
#          "response_type":"text",
#          "options":{
#             "type":"select",
#             "value":[
#                "able1",
#                "unable2"
#             ]
#          }
#       }
#    ]
#   }