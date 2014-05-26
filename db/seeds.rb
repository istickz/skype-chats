Category.destroy_all
Category.create([
  { alias:'auto', name:'Автомобили' },
  { alias:'business', name:'Бизнес' },
  { alias:'art', name:'Искусство' },
  { alias:'science', name:'Наука' },
  { alias:'Family', name:'Семья и дети' },
  { alias:'humor', name:'Юмор' },
  { alias:'it', name:'IT' },
  { alias:'18+', name:'18+' }
])
