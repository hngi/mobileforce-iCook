const Dish = require('../models/dish');

exports.get_all_dishes = async (req, res, next) => {
    try {
        const dishes = await Dish.find();
        res.json(dishes)
    } catch (err){
        res.status(500).json({message: err.message})
    }
}

exports.get_dishes_by_ID = async (req, res, next) => {
    if(Dish.exists({_id: req.params.id})){
        try {
            const dishes = await Dish.findOne({_id: req.params.id})
            res.json(dishes)
        } catch (err) {
            res.status(500).json({message: err.message})
        }
    } else {
        res.status(404).json({message: `chef with ID of ${req.params.id} not found`})
    }  
}

exports.add_dish = async (req, res, next) => {
    const {chef, name, chefImage, dishImages, description, ingredients, steps, healthBenefits} = req.body;
    try {
        const newDish = new Dish({chef, name, chefImage, dishImages, description, ingredients, steps, healthBenefits})
        await newDish.save();
        res.status(201)
    }
    catch (err){
        res.status(500).json({message: err.message})
    }
}
