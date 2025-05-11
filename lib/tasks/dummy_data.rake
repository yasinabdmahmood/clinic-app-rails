# lib/tasks/dummy_data.rake
namespace :db do
    desc "Populate database with dummy patients, cases, visits, and appointments"
    task populate_dummy_data: :environment do
      puts "Starting to create dummy data..."
  
      # Find the users
      doctor = User.find_by(username: 'dr_hassan')
      receptionist = User.find_by(username: 'reception_sara')
  
      unless doctor && receptionist
        puts "Doctor or Receptionist user not found. Please create them first."
        exit
      end

      # clear the existing patients, medical cases, visits, and appointments
      Visit.destroy_all
      Appointment.destroy_all
      MedicalCase.destroy_all
      Patient.destroy_all
  
      # Create some patients
      5.times do |i|
        patient = Patient.create!(
          name: "Patient #{i + 1}",
          gender: %w[Male Female Other].sample,
          date_of_birth: Date.today - (20 + rand(40)) * 365,
          address: "123 Street #{i + 1}",
          email: "patient#{i + 1}@example.com",
          phone: "555-000#{i + 1}",
          notes: "Some notes about patient #{i + 1}",
          emergency_contact: "Emergency Contact #{i + 1}"
        )
  
        puts "Created Patient #{patient.name}"
  
        # Create a category if not already
        category = Category.first || Category.create!(title: "General", status: true)
  
        # Create a medical case for the patient
        medical_case = MedicalCase.create!(
          patient: patient,
          category: category,
          description: "Description of case for #{patient.name}",
          status: :active
        )
  
        puts "  Created MedicalCase for #{patient.name}"
  
        # Create visits for the medical case
        3.times do |j|
          Visit.create!(
            medical_case: medical_case,
            visit_date: Date.today + j,
            notes: "Visit #{j + 1} notes",
            vitals: "BP: 120/80, Temp: 98.6°F",
            treatment: "Treatment plan #{j + 1}",
          )
        end
  
        puts "    Created 3 Visits for #{patient.name}"
  
        # Create appointments for the patient
        2.times do |k|
          Appointment.create!(
            patient: patient,
            appointment_date: Date.today + k,
            start_time: Time.now.change(hour: 9 + k, min: 0),
            end_time: Time.now.change(hour: 10 + k, min: 0),
            status: :scheduled,
            purpose: "Purpose of appointment #{k + 1}",
            notes: "Notes for appointment #{k + 1}",
            created_by: receptionist
          )
        end
  
        puts "    Created 2 Appointments for #{patient.name}"
      end
  
      puts "Dummy data creation completed."
    end
  end
  