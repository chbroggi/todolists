class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: {in: %w(male female), message: "Only male and female are allowed"}
  validate :firstname_OR_lastname_null
  validate :male_cantbe_sue

  def male_cantbe_sue
    if gender == "male" && first_name == "Sue"
      errors.add(:first_name, "can't be Sue")
    end
  end

  def firstname_OR_lastname_null
    if first_name == nil && last_name == nil
      errors.add(:first_name, "Can't be NULL")
      errors.add(:last_name, "Can't be NULL")
    end
  end

  def self.get_all_profiles(min_year, max_year)
    self.where("birth_year BETWEEN ? AND ?", min_year, max_year).order(:birth_year)
  end
end
