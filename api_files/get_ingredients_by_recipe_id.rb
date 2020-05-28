spoon_recipe_id = 26715

ingredients_by_recipe_url = "https://api.spoonacular.com/recipes/#{spoon_recipe_id}/ingredientWidget.json?apiKey=64dca65eeac74ce69073e6e23ff32ae9"


hash = GetRequester.new(url)

hash["ingredients"].each do |ingredient| 
    ingredient_description = Ingredient.create
    ingredient_description(name) = "#{ingredient["amount"]["us"]["value"]} #{ingredient["amount"]["us"]["unit"]} of #{ingredient["name"]}"
end

# test
# hash["ingredients"].each do |ingredient| 
#     puts "#{ingredient["amount"]["us"]["value"]} #{ingredient["amount"]["us"]["unit"]} of #{ingredient["name"]}"
# end





ingredient_hash = {
    "ingredients": [
        {
            "amount": {
                "metric": {
                    "unit": "g",
                    "value": 222.0
                },
                "us": {
                    "unit": "cups",
                    "value": 1.5
                }
            },
            "image": "blueberries.jpg",
            "name": "blueberries"
        },
        {
            "amount": {
                "metric": {
                    "unit": "",
                    "value": 1.0
                },
                "us": {
                    "unit": "",
                    "value": 1.0
                }
            },
            "image": "egg-white.jpg",
            "name": "egg white"
        },
        {
            "amount": {
                "metric": {
                    "unit": "Tbsps",
                    "value": 2.0
                },
                "us": {
                    "unit": "Tbsps",
                    "value": 2.0
                }
            },
            "image": "flour.png",
            "name": "flour"
        },
        {
            "amount": {
                "metric": {
                    "unit": "g",
                    "value": 150.0
                },
                "us": {
                    "unit": "cup",
                    "value": 0.75
                }
            },
            "image": "sugar-in-bowl.png",
            "name": "granulated sugar"
        },
        {
            "amount": {
                "metric": {
                    "unit": "tsp",
                    "value": 1.0
                },
                "us": {
                    "unit": "tsp",
                    "value": 1.0
                }
            },
            "image": "lemon-juice.jpg",
            "name": "fresh lemon juice"
        },
        {
            "amount": {
                "metric": {
                    "unit": "pinch",
                    "value": 1.0
                },
                "us": {
                    "unit": "pinch",
                    "value": 1.0
                }
            },
            "image": "ground-nutmeg.jpg",
            "name": "nutmeg"
        },
        {
            "amount": {
                "metric": {
                    "unit": "",
                    "value": 2.0
                },
                "us": {
                    "unit": "",
                    "value": 2.0
                }
            },
            "image": "pie-crust.jpg",
            "name": "pie dough round"
        },
        {
            "amount": {
                "metric": {
                    "unit": "Tbsps",
                    "value": 2.0
                },
                "us": {
                    "unit": "Tbsps",
                    "value": 2.0
                }
            },
            "image": "tapioca-pearls.png",
            "name": "quick cooking tapioca"
        },
        {
            "amount": {
                "metric": {
                    "unit": "g",
                    "value": 305.0
                },
                "us": {
                    "unit": "cups",
                    "value": 2.5
                }
            },
            "image": "rhubarb.jpg",
            "name": "trimmed rhubarb"
        },
        {
            "amount": {
                "metric": {
                    "unit": "tsps",
                    "value": 0.333
                },
                "us": {
                    "unit": "tsps",
                    "value": 0.333
                }
            },
            "image": "salt.jpg",
            "name": "salt"
        },
        {
            "amount": {
                "metric": {
                    "unit": "Tbsps",
                    "value": 0.5
                },
                "us": {
                    "unit": "Tbsps",
                    "value": 0.5
                }
            },
            "image": "butter-sliced.jpg",
            "name": "unsalted butter"
        }
    ]
}
