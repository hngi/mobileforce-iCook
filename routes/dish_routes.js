const express = require('express');
const router = express.Router();
const dish_controller = require('../controllers/dish_controller')

router.get('/', dish_controller.get_all_dishes)

router.get('/:id', dish_controller.get_dishes_by_ID)

router.post('/', dish_controller.add_dish)

module.exports = router;