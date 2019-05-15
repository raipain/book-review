namespace :db do
    desc "Adatbázis kiürítése és új adatokkal feltöltése"
    task :populate => :environment do
      require 'populator'
      require 'faker'
      require_relative('populator_fixes.rb')
      
      [User, Book, Category, Review].each(&:delete_all)
         
      password = "password"

      User.populate 15 do |user|
        user.email    = Faker::Internet.email
        user.encrypted_password = User.new(:password => password).encrypted_password
        Category.populate 1 do |category|
            category.name = Populator.words(1..5).titleize
            category.created_at = 2.years.ago..Time.now
            Book.populate 5 do |book|
                book.category_id = category.id
                book.title = Populator.words(1..10).titleize
                book.description = Populator.sentences(100..150)
                book.author = Faker::Name.name
                book.created_at = 2.years.ago..Time.now
                book.user_id = user.id
                Review.populate 3 do |review|
                    review.book_id = book.id
                    review.user_id = user.id
                    review.comment = Populator.sentences(5...20)
                    review.created_at = 2.years.ago..Time.now
                end
            end
        end
      end
    end
  end