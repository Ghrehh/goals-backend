user = User.create(name: 'admin', password: 'password')
user.goals.create(name: 'Goal 1')
user.goals.create(name: 'Goal 2')
user.goals.create(name: 'Goal 3')

user = User.create(name: 'admin2', password: 'password')
user.goals.create(name: 'Goal 1')
user.goals.create(name: 'Goal 2')
user.goals.create(name: 'Goal 3')
