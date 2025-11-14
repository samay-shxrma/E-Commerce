import 'package:flutter/material.dart';
import 'package:myapp/widget/support_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    "assets/images/headphone_icon.png",
    "assets/images/laptop.png",
    "assets/images/watch.png",
    "assets/images/TV.png",
  ];

  List<Map<String, dynamic>> allProducts = [
    {
      'image': "assets/images/headphone2.png",
      'name': "Headphone",
      'price': 100,
    },
    {
      'image':
          "assets/images/watch2.png", // Example image - replace with your actual asset path
      'name': "Apple Watch",
      'price': 300,
    },
    {
      'image':
          "assets/images/laptop2.png", // Example image - replace with your actual asset path
      'name': "Laptop",
      'price': 500,
    },
    // {
    //   'image': "assets/images/shoes.png", // Example image - replace with your actual asset path
    //   'name': "Sneakers",
    //   'price': 80,
    // },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 235, 231),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hey, Samay", style: AppWidget.boldTextFieldStyle()),
                      Text(
                        "Good Morning",
                        style: AppWidget.lightTextFieldStyle(),
                      ),
                    ],
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/boy.jpg",
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                // padding: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: AppWidget.lightTextFieldStyle(),
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories", style: AppWidget.semiboldTextFieldStyle()),

                  Text(
                    "see all",
                    style: TextStyle(color: Color(0xFFfd6f3e), fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  Container(
                    height: 130,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(right: 20),
                    // height: 90,
                    // width: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFFfd6f3e),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'All',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // margin: EdgeInsets.only(left: 20),
                      height: 130,
                      child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(image: categories[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Products",
                    style: AppWidget.semiboldTextFieldStyle(),
                  ),

                  Text(
                    "see all",
                    style: TextStyle(color: Color(0xFFfd6f3e), fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 30),

              Container(
                height: 245, // Set a fixed height for the horizontal ListView
                child: ListView.builder(
                  itemCount:
                      allProducts
                          .length, // Use the length of the allProducts list
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Get the current product data
                    final product = allProducts[index];
                    return Container(
                      margin: EdgeInsets.only(
                        right: 20,
                      ), // Add spacing between items
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ), // Added vertical padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            product['image']!, // Use image from product data
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            product['name']!, // Use name from product data
                            style: AppWidget.semiboldTextFieldStyle(),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "\$${product['price']}", // Use price from product data
                                style: TextStyle(
                                  color: Color(0xFFfd6f3e),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 50),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(0xFFfd6f3e),
                                ),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  String image;

  CategoryTile({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 20),
      // height: 90,
      // width: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image, height: 50, width: 50, fit: BoxFit.cover),

          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
