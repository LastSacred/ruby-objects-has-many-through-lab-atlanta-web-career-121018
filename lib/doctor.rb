class Doctor
  @@all = []
  attr_reader :name

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def new_appointment(patient, date)
    Appointment.new(patient, date, self)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self
    end
  end

  def patients
    appointments.map do |appointment|
      appointment.patient
    end
  end


end
