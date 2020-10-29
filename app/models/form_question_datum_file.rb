class FormQuestionDatumFile < ApplicationRecord
    belongs_to :form_question_datum, dependent: :destroy
    mount_uploader :picture, PictureUploader # using carrier wave

    def filename
        self.picture.file.filename
    end

    def url
        self.picture.url
    end
end
