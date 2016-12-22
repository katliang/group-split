class Report < ApplicationRecord
    after_initialize :init

    def init
        self.report_uid ||= SecureRandom.uuid
    end

    validates :name, presence: true,
                     length: { minimum: 1 }
end
