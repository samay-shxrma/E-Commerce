import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/product_detail.dart';
import 'package:myapp/services/database.dart';
import 'package:myapp/widget/support_widget.dart';

class CategoryProduct extends StatefulWidget {
  String category;
  CategoryProduct({required this.category});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  Stream? CategoryStream;

  getontheload() async {
    CategoryStream = await DatabaseMethods().getProducts(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allProducts() {
    return StreamBuilder(
      stream: CategoryStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? GridView.builder(
              padding: EdgeInsets.all(5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return Container(
                  // margin: EdgeInsets.only(
                  //   right: 20,
                  // ), // Add spacing between items
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ), // Added vertical padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Image.network(
                        ds['Image']!, // Use image from product data
                        height: 145,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        ds['Name']!, // Use name from product data
                        style: AppWidget.semiboldTextFieldStyle(),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "\$${ds['Price']}", // Use price from product data
                            style: TextStyle(
                              color: Color(0xFFfd6f3e),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => ProductDetail(
                                        detail: ds["Detail"],
                                        image: ds["Image"],
                                        name: ds["Name"],
                                        price: ds["Price"],
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xFFfd6f3e),
                              ),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      appBar: AppBar(backgroundColor: Color(0xfff2f2f2)),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [Expanded(child: allProducts())]),
      ),
    );
  }
}
