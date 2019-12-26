class AdminAccount < ActiveRecord::Migration[6.0]
  def change
    User.create!(email: "a@a.a", password:"112211", admin: true) 
  end
end
