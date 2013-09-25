
namespace :na do
  namespace :utils do
    task :link => :environment do
      NARecover::Linkage.run
    end
  end
end

###############################################################

module NARecover
  class Linkage

    def self.run
      Linkage.new().run
    end

    def run
      Time.zone = -3
      GediMigrationNa.all.each do |na|
        @na = na
        setup
        next unless @na.runtime_valid?
        match = Gedi::Infraction.joins(:event, :infraction_type).where(
          datetime_start: infraction_datetime, 
          equipment_id: @equipment.id,
          Gedi::Event.table_name => {
            speed: @na.infraction.speed_computed
          },
          Gedi::InfractionType.table_name => {
            code: (@na.infraction.code.to_s + @na.infraction.variant.to_s)
          }
        ).first

        if match
          @na.update_attribute(:associated, match.id)
        end
      end
    end

    def setup
      @na.runtime_valid! #yet

      @equipment = Gedi::Equipment.find_by_code @na.infraction.equipment.code
      @na.invalid('Equipment not found') if @equipment.nil?
    end

    def infraction_datetime
      i = @na.infraction
      Time.new(i.date.year,i.date.month,i.date.day, i.hour.hour, i.hour.min, i.hour.sec, 0)
    end
  end
end