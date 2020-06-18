const mongoose = require("mongoose");
const schema = mongoose.Schema;

const dishSchema = new schema({
  chef: schema.Types.ObjectId,
  name: String,
  chefImage: String,
  dishImages: [String],
  description: String,
  favourites: { type: Number, min: 0, default: 0 },
  ingredients: [String],
  steps: [String],
  healthBenefits: [String],
  comments: {
    chefId: schema.Types.ObjectId,
    comment: String,
    default: {}
  },
});

const Dish = mongoose.model("Dish", dishSchema);

module.exports = Dish;
