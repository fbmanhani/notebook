namespace :utils do
  desc "Popula os dados não fixos do banco de dados;"
  task seed: :environment do
    puts "Criando os contatos..."
    100.times do
      Contact.create!(name: Faker::Name.name, email: Faker::Internet.email, kind: Kind.all.sample, rmk: LeroleroGenerator.sentence(2))
    end
    puts "Criando os contatos...[OK]"

    puts "Criando os endereços..."
    Contact.all.each do |c|
      Address.create(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: c
      )
    end
    puts "Criando os endereços...[OK]"

    puts "Criando os telefones..."
    Contact.all.each do |c|
      Random.rand(1..3).times do
        Phone.create(
            phone: Faker::PhoneNumber.phone_number,
            contact: c
        )
      end
    end
    puts "Criando os telefones...[OK]"

  end
end
