website_recipe_id = 26715

#website_recipe_id= recipe.website_id

instruction_url = "https://api.spoonacular.com/recipes/#{website_recipe_id}/analyzedInstructions?apiKey=64dca65eeac74ce69073e6e23ff32ae9"
source_website_url = "https://api.spoonacular.com/recipes/#{website_recipe_id}/information?apiKey=64dca65eeac74ce69073e6e23ff32ae9"


instructions = GetRequester.new(url).parse_json

def get_source_website(source_website_url)
    info = GetRequester.new(source_website_url).parse_json
    puts "You can read the full recipe and detailed instructions at #{info["sourceUrl"]}"
end

def get_recipe_instructions(instruction_url)
    instructions_array = []
    instructions = GetRequester.new(instruction_url).parse_json
    instructions.reverse.each do |instruction|
        instruction["steps"].each do |step|
            instructions_array << step["step"]
        end
    end
end

def recipe_instructions_and_url(instruction_url, source_website_url)
    if instructions_array.empty?
        get_recipe_url(website_recipe_id)
    else
        instructions_array = []
        get_recipe_instructions(instruction_url)
        instructions_array.each {|instruction| puts instruction}
        get_recipe_url(website_recipe_id)
    end
end





array = [
  {
    "name": "",
    "steps": [
      {
        "number": 1,
        "step": "Preheat the oven to 200 degrees F.",
        "ingredients": [
          
        ],
        "equipment": [
          {
            "id": 404784,
            "name": "oven",
            "image": "oven.jpg",
            "temperature": {
              "number": 200.0,
              "unit": "Fahrenheit"
            }
          }
        ]
      },
      {
        "number": 2,
        "step": "Whisk together the flour, pecans, granulated sugar, light brown sugar, baking powder, baking soda, and salt in a medium bowl.",
        "ingredients": [
          {
            "id": 19334,
            "name": "light brown sugar",
            "image": "light-brown-sugar.jpg"
          },
          {
            "id": 19335,
            "name": "granulated sugar",
            "image": "sugar-in-bowl.png"
          },
          {
            "id": 18372,
            "name": "baking soda",
            "image": "white-powder.jpg"
          },
          {
            "id": 12142,
            "name": "pecans",
            "image": "pecans.jpg"
          },
          {
            "id": 20081,
            "name": "all purpose flour",
            "image": "flour.png"
          },
          {
            "id": 2047,
            "name": "salt",
            "image": "salt.jpg"
          }
        ],
        "equipment": [
          {
            "id": 404661,
            "name": "whisk",
            "image": "whisk.png"
          },
          {
            "id": 404783,
            "name": "bowl",
            "image": "bowl.jpg"
          }
        ]
      },
      {
        "number": 3,
        "step": "Whisk together the eggs, buttermilk, butter and vanilla extract and vanilla bean in a small bowl.",
        "ingredients": [
          {
            "id": 2050,
            "name": "vanilla extract",
            "image": "vanilla-extract.jpg"
          },
          {
            "id": 93622,
            "name": "vanilla bean",
            "image": "vanilla.jpg"
          },
          {
            "id": 1230,
            "name": "buttermilk",
            "image": "buttermilk.jpg"
          },
          {
            "id": 1123,
            "name": "egg",
            "image": "egg.png"
          }
        ],
        "equipment": [
          {
            "id": 404661,
            "name": "whisk",
            "image": "whisk.png"
          },
          {
            "id": 404783,
            "name": "bowl",
            "image": "bowl.jpg"
          }
        ]
      },
      {
        "number": 4,
        "step": "Add the egg mixture to the dry mixture and gently mix to combine. Do not overmix.",
        "ingredients": [
          {
            "id": 1123,
            "name": "egg",
            "image": "egg.png"
          }
        ],
        "equipment": [
          
        ]
      },
      {
        "number": 5,
        "step": "Let the batter sit at room temperature for at least 15 minutes and up to 30 minutes before using.",
        "ingredients": [
          
        ],
        "equipment": [
          
        ],
        "length": {
          "number": 15,
          "unit": "minutes"
        }
      },
      {
        "number": 6,
        "step": "Heat a cast iron or nonstick griddle pan over medium heat and brush with melted butter. Once the butter begins to sizzle, use 2 tablespoons of the batter for each pancake and cook until the bubbles appear on the surface and the bottom is golden brown, about 2 minutes, flip over and cook until the bottom is golden brown, 1 to 2 minutes longer.",
        "ingredients": [
          
        ],
        "equipment": [
          {
            "id": 404645,
            "name": "frying pan",
            "image": "pan.png"
          }
        ],
        "length": {
          "number": 3,
          "unit": "minutes"
        }
      },
      {
        "number": 7,
        "step": "Transfer the pancakes to a platter and keep warm in a 200 degree F oven.",
        "ingredients": [
          
        ],
        "equipment": [
          {
            "id": 404784,
            "name": "oven",
            "image": "oven.jpg",
            "temperature": {
              "number": 200.0,
              "unit": "Fahrenheit"
            }
          }
        ]
      },
      {
        "number": 8,
        "step": "Serve 6 pancakes per person, top each with some of the bourbon butter.",
        "ingredients": [
          {
            "id": 10014037,
            "name": "bourbon",
            "image": "bourbon.png"
          }
        ],
        "equipment": [
          
        ]
      },
      {
        "number": 9,
        "step": "Drizzle with warm maple syrup and dust with confectioners' sugar.",
        "ingredients": [
          {
            "id": 19336,
            "name": "powdered sugar",
            "image": "powdered-sugar.jpg"
          },
          {
            "id": 19911,
            "name": "maple syrup",
            "image": "maple-syrup.png"
          }
        ],
        "equipment": [
          
        ]
      },
      {
        "number": 10,
        "step": "Garnish with fresh mint sprigs and more toasted pecans, if desired.",
        "ingredients": [
          {
            "id": 12142,
            "name": "pecans",
            "image": "pecans.jpg"
          }
        ],
        "equipment": [
          
        ]
      }
    ]
  },
  {
    "name": "Bourbon Molasses Butter",
    "steps": [
      {
        "number": 1,
        "step": "Combine the bourbon and sugar in a small saucepan and cook over high heat until reduced to 3 tablespoons, remove and let cool.",
        "ingredients": [
          {
            "id": 10014037,
            "name": "bourbon",
            "image": "bourbon.png"
          },
          {
            "id": 19335,
            "name": "sugar",
            "image": "sugar-in-bowl.png"
          }
        ],
        "equipment": [
          {
            "id": 404669,
            "name": "sauce pan",
            "image": "sauce-pan.jpg"
          }
        ]
      },
      {
        "number": 2,
        "step": "Put the butter, molasses, salt and cooled bourbon mixture in a food processor and process until smooth.",
        "ingredients": [
          {
            "id": 19304,
            "name": "molasses",
            "image": "molasses.jpg"
          },
          {
            "id": 10014037,
            "name": "bourbon",
            "image": "bourbon.png"
          },
          {
            "id": 2047,
            "name": "salt",
            "image": "salt.jpg"
          }
        ],
        "equipment": [
          {
            "id": 404771,
            "name": "food processor",
            "image": "food-processor.png"
          }
        ]
      },
      {
        "number": 3,
        "step": "Scrape into a bowl, cover with plastic wrap and refrigerate for at least 1 hour to allow the flavors to meld.",
        "ingredients": [
          
        ],
        "equipment": [
          {
            "id": 404730,
            "name": "plastic wrap",
            "image": "plastic-wrap.jpg"
          },
          {
            "id": 404783,
            "name": "bowl",
            "image": "bowl.jpg"
          }
        ]
      },
      {
        "number": 4,
        "step": "Remove from the refrigerator about 30 minutes before using to soften.",
        "ingredients": [
          
        ],
        "equipment": [
          
        ],
        "length": {
          "number": 30,
          "unit": "minutes"
        }
      }
    ]
  }
]
