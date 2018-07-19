
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
r1 = Report.create :sales => 1000, :expenses => 200.11, :date => DateTime.new(2017,11,1)
r2 = Report.create :sales => 900, :expenses => 300.11, :date => DateTime.new(2017,11,2)
r3 = Report.create :sales => 800.56, :expenses => 2000, :date => DateTime.new(2017,11,4), :comments => 'employee salary pay'
r4 = Report.create :sales => 700, :expenses => 200.55, :date => DateTime.new(2017,11,14)
r5 = Report.create :expenses => 100, :date => DateTime.new(2017,11,23), :comments => 'holiday'
r6 = Report.create :sales => 900, :expenses => 2222.22, :date => DateTime.new(2018,7,1), :comments => 'electricity bill'
r8 = Report.create :sales => 900, :expenses => 50, :date => DateTime.new(2018,7,2)
r9 = Report.create :sales => 900, :expenses => 10, :date => DateTime.new(2018,7,3)
r10 = Report.create :sales => 700, :expenses => 100, :date => DateTime.new(2018,7,4)
r11 = Report.create :sales => 789, :expenses => 22.22, :date => DateTime.new(2018,7,5)
r12 = Report.create :sales => 1000, :expenses => 2221.2, :date => DateTime.new(2018,7,19), :comments => 'purchases'

b1.reports << r1 << r2 << r3 << r4 << r5 << r6 << r8 << r9 << r10 << r11 << r12
u1.busniesses << b3
