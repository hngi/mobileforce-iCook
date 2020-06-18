const mongoose = require("mongoose");
const schema = mongoose.Schema;

const userSchema = new schema({
  name: String,
  email: String,
  userImage: String,
  country: String,
  phoneNumber: String,
  favourites: [String], //array of dish IDs
  followers: { type: Number, min: 0, default: 0 },
  following: { type: Number, min: 0, default: 0 },
});

const User = mongoose.model("User", userSchema);

module.exports = User;
