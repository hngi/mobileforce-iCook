const express = require("express")
require('dotenv').config()
const database = require('./database/index')
const cors = require('cors')
const Dish = require('./models/dish') 
const uploadImage = require('./database/storage/uploadImage')


const PORT = process.env.PORT || 5000

const app = express();

//init middleware
//1. Body Parser
app.use(express.json())
app.use(express.urlencoded({extended: false}))
//2. CORS
app.use(cors())

//connect to DB
database.connectDB()

//api routes
app.use("/api/users", require("./routes/user_routes"))
app.use("/api/dishes", require("./routes/dish_routes"))

//start server
app.listen(PORT, () => {
    console.log("Server started on " + PORT)
})