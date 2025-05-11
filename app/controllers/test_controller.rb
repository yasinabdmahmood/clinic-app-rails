class TestController < ApplicationController
  skip_before_action :authenticate_user!, only: [:dummy_patients]

  def dummy_patients
    dummy_data = [
      {
        id: 1,
        name: "John Doe",
        gender: "Male",
        date_of_birth: "1990-01-01",
        address: "123 Main St, City",
        email: "john@example.com",
        phone: "123-456-7890",
        notes: "Regular checkup patient",
        emergency_contact: "Jane Doe (Wife) - 123-456-7891"
      },
      {
        id: 2,
        name: "Jane Smith",
        gender: "Female",
        date_of_birth: "1985-05-15",
        address: "456 Oak Ave, Town",
        email: "jane@example.com",
        phone: "987-654-3210",
        notes: "Allergic to penicillin",
        emergency_contact: "John Smith (Husband) - 987-654-3211"
      },
      {
        id: 3,
        name: "Robert Johnson",
        gender: "Male",
        date_of_birth: "1978-11-30",
        address: "789 Pine Rd, Village",
        email: "robert@example.com",
        phone: "555-123-4567",
        notes: "Diabetic patient",
        emergency_contact: "Mary Johnson (Sister) - 555-123-4568"
      }
    ]

    render json: { patients: dummy_data }, status: :ok
  end
end 