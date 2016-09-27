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


# Santiago => admin
@user1 = User.new(
    :email => 'smoreno91@gmail.com',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
    :names => "Santiago",
    :lastnames => "Moreno Palacio",
    :identification => "1152438883",
    :birth_date => Date.new(1991, 8, 1)
    )
@user1.skip_confirmation!
@user1.company = @company
@user1.save
@user1.add_role "admin"
@user1.save

@entry1 = Entry.new(
    :time => DateTime.now,
    :status => 1,
    :obs => "example"
    )
@entry1.user = @user1
@entry1.save


# Cesar => employee
@user2 = User.new(
    :email => 'cahz@gmail.com',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
    :names => "Cesar",
    :lastnames => "Hurtado",
    :identification => "123456789",
    :birth_date => Date.new(1991, 4, 21)
    )
@user2.skip_confirmation!
@user2.company = @company
@user2.save
@user2.add_role "employee"
@user2.save

@entry2 = Entry.new(
    :time => DateTime.now,
    :status => 1,
    :obs => "example"
    )
@entry2.user = @user2
@entry2.save

# Daniel => employee
@user3 = User.new(
    :email => 'daniel@gmail.com',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
    :names => "Daniel",
    :lastnames => "Restrepo",
    :identification => "321654987",
    :birth_date => Date.new(1992, 1, 5)
    )
@user3.skip_confirmation!
@user3.company = @company
@user3.save
@user3.add_role "employee"
@user3.save

# Carolina => employee
@user4 = User.new(
    :email => 'carolina@gmail.com',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
    :names => "Carolina",
    :lastnames => "Moreno",
    :identification => "41852963",
    :birth_date => Date.new(1995, 9, 15)
    )
@user4.skip_confirmation!
@user4.company = @company
@user4.save
@user4.add_role "employee"
@user4.save