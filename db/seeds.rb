roundtable = Room.new(name:                  "RoundTable",
                      password:              "password",
                      password_confirmation: "password",
                      url_token:             "994f147e64daf74ebe5e")
roundtable.save

User.create!(name:       "Gawain",
             room_id:    roundtable.id,
             is_staying: true,
             url_token:  "994f147e64daf74ebe5d")
User.create!(name:       "Tristan",
             room_id:    roundtable.id,
             is_staying: false,
             url_token:  "994f147e64daf74ebe5f")