class Employee < ApplicationRecord
    resourcify
    belongs_to  :company
    has_many    :entries
end
