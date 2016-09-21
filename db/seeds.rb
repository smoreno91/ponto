# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@company = Company.new(
    :business_name => 'Sistemas SA',
    :comercial_name => 'Globant',
    :identification => '32131321-4',
    :address => 'Vizcaya',
    :city => "Medellin",
    :state => "Antioquia"
    )
@company.save

@user = User.new(
    :email => 'smoreno91@gmail.com',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r'
    )
@user.skip_confirmation!
@user.save
@user.add_role "admin"
@user.save

@employee = Employee.new(
    :identification => "1152438883",
    :birth_date => Date.new(1991, 8, 1)
    )
@employee.company = @company
@employee.user = @user
@employee.save

@entry = Entry.new(
    :time => DateTime.now,
    :status => 1,
    :obs => "example"
    )
@entry.employee_id = @employee.id
@entry.save