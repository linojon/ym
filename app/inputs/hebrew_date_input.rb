class HebrewDateInput < SimpleForm::Inputs::Base
  def input
    # TODO: :start_year, :end_year
    start_year = Hebruby::HebrewDate.today.year
    end_year = start_year - 200
    @builder.fields_for :death_hebrew_date, :validate => false do |form|
      form.select(:day, 1..30, :include_blank => true) + ' ' +
      form.select(:month, Hebruby::HebrewDate.months_for_select, :include_blank => true) + ' ' +
      form.select(:year, start_year.downto(end_year).map {|i| i}, :include_blank => true)
    end
  end
end

