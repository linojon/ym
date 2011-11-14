class Hebruby::HebrewDate
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
  def <(other_date)
    jd < other_date.jd if other_date.is_a? Hebruby::HebrewDate
  end
  def >(other_date)
    jd > other_date.jd if other_date.is_a? Hebruby::HebrewDate
  end
  def <=>(other_date)
    jd <=> other_date.jd if other_date.is_a? Hebruby::HebrewDate
  end
end
