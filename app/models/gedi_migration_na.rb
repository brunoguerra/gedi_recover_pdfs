class GediMigrationNa < ActiveRecord::Base
  attr_accessible :emission, :number, :infraction_id
  belongs_to :infraction, :class_name => GediMigrationInfraction

  attr_accessor :valid

  def invalid(msg)
    @runtime_valid = false
    self.update_attribute(:notes, msg)
  end

  def runtime_valid!
    @runtime_valid = true
  end

  def runtime_valid?
    @runtime_valid
  end
end
