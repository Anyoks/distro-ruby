module Types
  class MutationType < Types::BaseObject
    field :createFormQuestionDatum, mutation: Mutations::CreateFormQuestionDatum
    field :createFormQuestion, mutation: Mutations::CreateFormQuestion
    field :createForm, mutation: Mutations::CreateForm
    field :uploadReportFurtherActionImage, mutation: Mutations::UploadReportFurtherActionImage
    field :uploadIllegalUseImage, mutation: Mutations::UploadIllegalUseImage
    field :createReportFurtherAction, mutation: Mutations::CreateReportFurtherAction
    field :createAccountReport, mutation: Mutations::CreateAccountReport
    field :createBuildingInfo, mutation: Mutations::CreateBuildingInfo
    field :createConnectionInfo, mutation: Mutations::CreateConnectionInfo
    field :createAnomally, mutation: Mutations::CreateAnomally
    field :uploadAnomallyPicture, mutation: Mutations::UploadAnomallyPicture
    field :uploadLandmarkImage, mutation: Mutations::UploadLandmarkImage
    field :uploadBurstImage, mutation: Mutations::UploadBurstImage
    field :createBurstAndLeaks, mutation: Mutations::CreateBurstAndLeaks
    field :uploadMeterInfoImage, mutation: Mutations::UploadMeterInfoImage
    field :createMeterInfo, mutation: Mutations::CreateMeterInfo
    field :createZoneReport, mutation: Mutations::CreateZoneReport
    field :createDmaReport, mutation: Mutations::CreateDmaReport
    field :createDmaAssignment, mutation: Mutations::CreateDmaAssignment
    field :createZoneAssignment, mutation: Mutations::CreateZoneAssignment
    field :updateStaff, mutation: Mutations::UpdateStaff
    field :updateStaffPosition, mutation: Mutations::UpdateStaffPosition
    field :updatePosition, mutation: Mutations::UpdatePosition
    field :createPosition, mutation: Mutations::CreatePosition
    field :updateSubdepartment, mutation: Mutations::UpdateSubdepartment
    field :createSubdepartment, mutation: Mutations::CreateSubdepartment
    field :updateDepartment, mutation: Mutations::UpdateDepartment
    field :createDepartment, mutation: Mutations::CreateDepartment
    field :updateTask, mutation: Mutations::UpdateTask
    field :createTask, mutation: Mutations::CreateTask
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
