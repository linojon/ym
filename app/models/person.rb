class Person < ActiveRecord::Base
  GENDERS = %w{ male female }
  validates :gender, :inclusion => { :in => GENDERS }, :allow_blank => true
  PREFIXES = %w{ Ms Miss Mrs Mr Dr Atty Prof Hon Gov Ofc }
  validates :prefix, :inclusion => { :in => PREFIXES }, :allow_blank => true
  
  validates :last_name, :presence => true
  validates :first_name, :presence => true
  #allow blank birthdate and deathdate as incomplete records?
end
