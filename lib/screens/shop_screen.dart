import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _selectedIndex = 0;

  // منتجات Exclusive Offer
  final List<Map<String, dynamic>> exclusiveProducts = [
    {
      "name": "Organic Bananas",
      "unit": "7pcs, Priceg",
      "price": 4.99,
      "image": "assets/images/banana.png"
    },
    {
      "name": "Red Apple",
      "unit": "1kg, Priceg",
      "price": 4.99,
      "image": "assets/images/pngfuel1.png"
    },
  ];

  //  Best Selling
  final List<Map<String, dynamic>> bestSellingProducts = [
    {
      "name": "Bell Pepper Red",
      "unit": "1kg, Priceg",
      "price": 2.99,
      "image": "assets/images/pngfuel1.png"
    },
    {
      "name": "Ginger",
      "unit": "250g, Priceg",
      "price": 1.99,
      "image": "assets/images/banana.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Search
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.black54),
                    hintText: "Search Store",
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 20),

              //Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/banner1.pag.png",
                  width: double.infinity,
                  height: 115,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 115,
                    color: Colors.green[100],
                    child: Center(child: Text("Fresh Vegetables - Get Up To 40% OFF")),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Exclusive Offer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Exclusive Offer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("See all", style: TextStyle(color: Color(0xFF53B175), fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exclusiveProducts.length,
                  itemBuilder: (context, index) => _buildProductCard(exclusiveProducts[index]),
                ),
              ),

              SizedBox(height: 20),

              // 4. قسم Best Selling
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best Selling", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("See all", style: TextStyle(color: Color(0xFF53B175), fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestSellingProducts.length,
                  itemBuilder: (context, index) => _buildProductCard(bestSellingProducts[index]),
                ),
              ),
            ],
          ),
        ),
      ),

      //   التنقل  
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF53B175),
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
        ],
      ),
    );
  }

  // ودجت  كارت 
  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Color(0xFFE2E2E2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                product["image"],
                errorBuilder: (context, error, stackTrace) => Icon(Icons.fastfood, size: 50, color: Colors.green),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(product["name"], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text(product["unit"], style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${product["price"]}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF53B175),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.add, color: Colors.white, size: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}