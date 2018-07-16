User.destroy_all
u1 = User.create :email => 'kenny1@ga.co', :password => 'chiken'
u2 = User.create :email => 'kenny2@ga.co', :password => 'chiken'
u3 = User.create :email => 'kenny3@ga.co', :password => 'chiken'

Busniess.destroy_all
b1 = Busniess.create :name => 'KFC'
b2 = Busniess.create :name => 'Dominos'
b3 = Busniess.create :name => 'mcdonalds'
b4 = Busniess.create :name => 'rebel'
b5 = Busniess.create :name => 'GA'
b6 = Busniess.create :name => 'apple'
b7 = Busniess.create :name => 'facebook'

Admin.destroy_all
a1 = Admin.create :user_id => u1.id, :busniess_id => b1.id
a2 = Admin.create :user_id => u1.id, :busniess_id => b2.id

u1.busniesses << b3
