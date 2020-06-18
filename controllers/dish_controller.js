const Dish = require("../models/dish");
const uploadImage = require("../database/storage/uploadImage");

exports.get_all_dishes = async (req, res, next) => {
  try {
    const dishes = await Dish.find();
    res.json(dishes);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.get_dishes_by_ID = async (req, res, next) => {
  const doesDishExist = await Dish.exists({ _id: req.params.id });
  if (doesDishExist) {
    try {
      const dish = await Dish.findOne({ _id: req.params.id });
      res.json(dish);
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  } else {
    res
      .status(404)
      .json({ message: `dish with ID of ${req.params.id} not found` });
  }
};

exports.add_dish = async (req, res, next) => {
  const {
    chef,
    name,
    description,
    ingredients,
    steps,
    healthBenefits,
  } = req.body;
  const dishImages = req.files;
  const dishImagesLinks = [];

  try {
    dishImages.forEach((dishImage) => {
      dishImagesLinks.push(uploadImage(dishImage));
    });
    console.log(dishImagesLinks);
    const newDish = new Dish({
      chef,
      name,
      chefImage,
      dishImages,
      description,
      ingredients,
      steps,
      healthBenefits,
    });
    await newDish.save();
    res.status(201);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
