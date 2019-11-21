module Types
  class MutationType < Types::BaseObject
    field :uploadImage, mutation: Mutations::UploadImage
    field :createAssignment, mutation: Mutations::CreateAssignment
    field :createReport, mutation: Mutations::CreateReport

    field :register_user, mutation: Mutations::RegisterUser
    field :sign_in, mutation: Mutations::SignIn
    field :sign_out, mutation: Mutations::SignOut

    field :register_staff, mutation: Mutations::RegisterStaff
    field :staff_sign_in, mutation: Mutations::StaffSignIn
    field :staff_sign_out, mutation: Mutations::StaffSignOut

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
