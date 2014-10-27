module CsvExportable

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def records_to_csv(records = [])
      CSV.generate(:force_quotes => true) do |csv|
        csv << self::CSV_ATTRS.map(&:humanize)
        records.each do |record|
          csv << self::CSV_ATTRS.map { |attr| StringUtils.clear_for_export(record.send(attr)) }
        end
      end
    end

  end

end
