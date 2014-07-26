namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(name: "Vitaly", email: "vsting@inbox.ru", password: "f0udl7z6A", password_confirmation: "f0udl7z6A", admin: true)
	end
end