require Rails.root.join('lib/capitalize_name.rb')

class Person < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  GENDERS = %w{ male female }
  validates :gender, :inclusion => { :in => GENDERS }, :allow_blank => true
  
  PREFIXES = %w{ Ms Miss Mrs Mr Dr Atty Prof Hon Gov Ofc Rabbi Cantor }
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
  
  def yahrzeit
    return unless death_date
    h = Hebruby::HebrewDate.new(death_date)
    "#{h.day} #{h.month_name}"
  end
  memoize :yahrzeit
  
  # get next yahrzeit date on or after "from" date
  def yahrzeit_date(from=Date.today)
    return unless death_date
    h_from = Hebruby::HebrewDate.new(from)
    h_death = Hebruby::HebrewDate.new(death_date)
    # yarhzeit date from year
    h_yahrzeit = Hebruby::HebrewDate.new(h_death.day, h_death.month, h_from.year)
    date = Date.jd(h_yahrzeit.jd)
    if date < from
      h_yahrzeit = Hebruby::HebrewDate.new(h_death.day, h_death.month, h_from.year+1)
      date = Date.jd(h_yahrzeit.jd)
    end
    date
  end
end
