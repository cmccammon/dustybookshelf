
Table.all.each do |course|
  5.times do
    Student.create({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      gpa: random_gpa,
      course_id: course.id
    })
  end
end
create_table :orders do |t|
      t.string :item_id
      t.string :user_id
      t.string :quantity, null: false

create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age, default: 0
