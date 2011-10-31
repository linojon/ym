require Rails.root.join('lib/capitalize_name.rb')

class Person < ActiveRecord::Base
  
  GENDERS = %w{ male female }
  validates :gender, :inclusion => { :in => GENDERS }, :allow_blank => true
  
  PREFIXES = %w{ Ms Miss Mrs Mr Dr Atty Prof Hon Gov Ofc }
  validates :prefix, :inclusion => { :in => PREFIXES }, :allow_blank => true
  
  validates :last_name,   :presence => true, 
                          :length => { :minimum => 2 },
                          :proper_name => true
                          
  validates :first_name,  :presence => true,
                          :proper_name => true
                          
  validates :maiden,      :proper_name => true,
                          :allow_blank => true
                          
  validates :middle_name, :proper_name => true,
                          :allow_blank => true
  
  validate :death_date_cannot_be_before_birth_date

  def death_date_cannot_be_before_birth_date
    if !death_date.blank? and !birth_date.blank? and death_date < birth_date
      errors.add(:death_date, "can't be before birth date")
    end
  end
  
  before_save :strip_and_capitalize_names
  
  def strip_and_capitalize_names
    self.last_name.strip! unless last_name.nil?
    self.first_name.strip! unless first_name.nil?
    self.middle_name.strip! unless middle_name.nil?
    self.maiden.strip! unless maiden.nil?
    
    self.last_name.capitalize_name! if last_name.present?
    self.first_name.capitalize_name! if first_name.present?
    self.middle_name.capitalize_name! if middle_name.present?
    self.maiden.capitalize_name! if maiden.present?
  end
  
end
