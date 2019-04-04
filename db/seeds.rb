roundtable = Room.new(name:                  "RoundTable",
                      password:              "password",
                      password_confirmation: "password")
roundtable.save

User.create!(name:       "Gawain",
             room_id:    roundtable.id,
             is_staying: true)
User.create!(name:       "Tristan",
             room_id:    roundtable.id,
             is_staying: false)