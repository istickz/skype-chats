# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.destroy_all
categories = Category.create([
  { alias:'auto', name:'Автомобили' },
  { alias:'business', name:'Бизнес' },
  { alias:'art', name:'Искусство' },
  { alias:'science', name:'Наука' },
  { alias:'Family', name:'Семья и дети' },
  { alias:'humor', name:'Юмор' },
  { alias:'it', name:'IT' },
  { alias:'18+', name:'18+' }
])
