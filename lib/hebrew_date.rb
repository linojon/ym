class Hebruby::HebrewDate
  include Comparable
  
  def to_s(format = :day_month_year)
    case format
    when :day_month
      "#{day} #{month_name}"
    else # :day_month_year
      "#{day} #{month_name} #{year}"
    end
  end
  
  def ==(other_date)
    jd == other_date.jd if other_date.is_a? Hebruby::HebrewDate
  end

  def <=>(other_date)
    jd <=> other_date.jd if other_date.is_a? Hebruby::HebrewDate
  end
  
  def self.today
    @today ||= Hebruby::HebrewDate.new(Date.today.jd)
  end
  
  def self.months_for_select
    1.upto(13).map {|i| [Hebruby::HebrewDate::MONTH_NAMES[i], i] }
  end
end
