class Profile < ActiveRecord::Base
  belongs_to :user
  validate :has_at_least_one_name
  validates :gender, inclusion: ["male", "female"]
  validate :no_men_named_sue
  
  def has_at_least_one_name
    if first_name.nil? && last_name.nil?
      errors.add(:first_name, "Add a first name or a last name")
    end
  end


  def no_men_named_sue
    if gender == 'male' && first_name == 'Sue'
      errors.add(:gender, "Are you sure? Is Sue a man?")
    end
  end
  
  def self.get_all_profiles(min_birth_year, max_birth_year)
  	Profile.where("birth_year BETWEEN :min_birth_year AND :max_birth_year", min_birth_year: min_birth_year, max_birth_year: max_birth_year).order(birth_year: :asc)
  end
  
end