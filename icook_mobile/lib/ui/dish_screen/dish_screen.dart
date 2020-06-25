import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:icook_mobile/ui/shared/recipe_item.dart';

class MyDishScreen extends StatefulWidget {
  @override
  _MyDishScreenState createState() => _MyDishScreenState();
}

class _MyDishScreenState extends State<MyDishScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
<<<<<<< HEAD
      appBar: AppBar(
    
          leading: IconButton(
    icon: Icon(Icons.arrow_back_ios),
    onPressed: () => Navigator.of(context).pop(),
  ), 
        title: Text('My Dishes'
      ),
        // centerTitle: true,
         
        actions: <Widget>[

           Icon(Icons.keyboard_arrow_left),
          
        IconButton(
          
    icon: new Image.asset('assets/images/filter.png'),
   

      onPressed: () {
        // do something
      },
    ),
    ]),

   

    body:ListView(
    children: <Widget>[
      ListTile(
      title: Text('Filters',
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
      )
      
      
      ),

  
      

    ListTile(

      title:Text('7 days ago',

      style: GoogleFonts.poppins(
          textStyle: TextStyle(
            
      
            backgroundColor: Colors.blue,
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500)
      )
      
         
    ),
   
     ),
    
   
    

    _buildCardItem(
    foodImage: [
    "assets/images/rice.jpg",
    "assets/images/soup.jpg",
    "assets/images/vegetable.jpg",
    ],
    chefImage: "assets/images/chef_emma.jpg",
    chefName: "Chef Emmanuel ",
    delName: "Delete",
    foodName: "Fried Rice",
    foodDescription: "Surprise your family with a different fried rice recipe",
    likes: 4),

    _buildCardItem(
    chefImage: "assets/images/chef_emma.jpg",
    foodImage: [
    "assets/images/soup.jpg",
    "assets/images/rice.jpg",
    "assets/images/vegetable.jpg",
    ],
    chefName: "Chef Emmanuel ",
    delName: "Delete",
    foodName: "African Ewedu soup",
    foodDescription: "Prepare ewedu soup in 15 short steps.",
    likes: 4),

    _buildCardItem(
    chefImage: "assets/images/chef_emma.jpg",
    foodImage: [
   "assets/images/vegetable.jpg",
    "assets/images/rice.jpg",
    "assets/images/soup.jpg",
    
    ],
    chefName: "Chef Emmanuel ",
    delName: "Delete",
    foodName: "Goat meat vegetable soup ",
    foodDescription: "You’ll be amazed!.",
    likes: 4),
       ],
=======
      appBar: AppBar(title: Text('My Dishes'),
          // centerTitle: true,

          actions: <Widget>[
            IconButton(
              icon: new Image.asset(
                'assets/images/filter.png',
                height: 24,
                width: 24,
              ),
              onPressed: () {
                // do something
              },
            ),
          ]),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) => RecipeItem(
          chefImage: "assets/images/avatar.png",
          chefName: "Rosa Nna",
          foodName: "Boiled Rice and Chicken",
          foodDescription:
              "This is just a very very dummy food description for texting",
          likes: 4,
          foodImage: [
            "assets/images/amala.jpeg",
            "assets/images/recipes.png",
            "assets/images/amala.jpeg"
          ],
        ),
>>>>>>> upstream/mobile-flutter-develop
      ),
    );
  }

  Widget _buildCardItem(
      {String chefImage,
      String chefName,
      String delName,
      List<String> foodImage,
      foodName,
      String foodDescription,
      int likes}) {
    print("FoodImage Size ${foodImage.length}");
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(chefImage),
                radius: 25,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                chefName,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333)),
              ),
              SizedBox(
                width: 7,
              ),
              Text(delName,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue,
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Carousel(
              images: foodImage.map((e) => AssetImage(e)).toList(),
              dotSize: 6.0,
              dotIncreaseSize: 1.5,
              dotSpacing: 20.0,
              dotColor: Colors.white,
              dotIncreasedColor: Colors.blue,
              autoplay: false,
              indicatorBgPadding: 5.0,
              radius: Radius.circular(10),
              dotVerticalPadding: 20,
              dotBgColor: Colors.transparent,
              borderRadius: true,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 11.5),
                    child: InkWell(
                      onTap: () {},
                      child: Image(
                        image: AssetImage("assets/images/like_icon.png"),
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 11.5),
                    child: InkWell(
                      onTap: () {},
                      child: Image(
                        image: AssetImage("assets/images/message-circle.png"),
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19, top: 11.5),
                child: InkWell(
                  onTap: () {},
                  child: Image(
                    image: AssetImage("assets/images/share.png"),
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$likes likes",
            style: GoogleFonts.poppins(
                color: Color(0xFF333333),
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            foodName,
            style: GoogleFonts.poppins(
                color: Color(0xFF333333),
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500),
          ),
          Text(
            foodDescription,
            style: GoogleFonts.poppins(
                color: Color(0xFF828282),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

//
