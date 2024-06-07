module Visible
    extend ActiveSupport::Concern

    VALID_STATUES = ['public','private','archived']

    included do
        validates :status, inclusion: { in: VALID_STATUES}
    end

    def archived?
        status == 'archived'
    end
end