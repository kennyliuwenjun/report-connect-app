
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

Report.destroy_all
r1 = Report.create :sales => 19.955, :date => DateTime.new(2017,12,1)
r2 = Report.create :sales => 0.1111, :date => DateTime.new(2017,11,23)
r3 = Report.create :sales => 93.444, :expenses => 0.11, :date => DateTime.new(2017,10,1), :comments => 'nothing to say'
r4 = Report.create :sales => 4, :expenses => 0.11, :date => DateTime.new(2017,11,1)
r5 = Report.create :sales => 1, :expenses => 0.9, :date => DateTime.new(2017,11,2)
r6 = Report.create :sales => 2, :expenses => 0.099, :date => DateTime.new(2017,11,3), :comments => 'say'
r7 = Report.create :sales => 3, :expenses => 0.9999, :date => DateTime.new(2017,11,4), :comments => 'nothing'

b1.reports << r1 << r2 << r3 << r4 << r5 << r6 << r7
u1.busniesses << b3
