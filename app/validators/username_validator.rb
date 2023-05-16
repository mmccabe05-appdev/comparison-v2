class UsernameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && !/\A[a-zA-Z0-9_]+\z/.match(value)
      record.errors.add(attribute, "must contain only letters, numbers, and underscores")
    end
  end
end
