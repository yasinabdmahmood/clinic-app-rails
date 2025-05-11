# Clear existing users (optional)
User.destroy_all

# Create doctor user
User.create!(
  username: 'dr_hassan',
  password: 'password123',
  full_name: 'Dr. Hassan',
  role: :doctor
)

# Create receptionist user
User.create!(
  username: 'reception_sara',
  password: 'password123',
  full_name: 'Sara Receptionist',
  role: :receptionist
)

puts "✅ Seeded doctor and receptionist users successfully."
