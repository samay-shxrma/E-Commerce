import 'package:flutter/material.dart';
import 'package:myapp/widget/support_widget.dart';

class ProductDetail extends StatefulWidget {
  String image, name, detail, price;
  ProductDetail({
    required this.detail,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef5f1),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: Image.network(
                      widget.image,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: AppWidget.boldTextFieldStyle(),
                        ),
                        Text(
                          "\$" + widget.price,
                          style: TextStyle(
                            color: Color(0xFFfd6f3e),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text("Details", style: AppWidget.semiboldTextFieldStyle()),
                    SizedBox(height: 10),
                    Text(widget.detail),
                    SizedBox(height: 90),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFfd6f3e),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
