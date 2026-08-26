import 'dart:async';
import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import 'account_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _selectedIndex = 0;

  
  final PageController _bannerController = PageController();
  int _currentBannerPage = 0;
  Timer? _bannerTimer;

 
  final List<String> bannerImages = [
    "assets/images/banner1.pag.png", 
    "assets/images/banner5.png",     
  ];

  //  Exclusive Offer
  final List<Map<String, dynamic>> exclusiveProducts = [
    {
      "name": "Organic Bananas",
      "unit": "7pcs, Priceg",
      "price": 4.99,
      "image": "assets/images/banana.png", 
    },
    {
      "name": "Red Apple",
      "unit": "1kg, Priceg",
      "price": 4.99,
      "image": "assets/images/pngfuel1.png", 
    },
  ];

  // Best Selling
  final List<Map<String, dynamic>> bestSellingProducts = [
    {
      "name": "Bell Pepper Red",
      "unit": "1kg, Priceg",
      "price": 2.99,
      "image": "assets/images/banner4.png", 
    },
    {
      "name": "Ginger",
      "unit": "250g, Priceg",
      "price": 1.99,
      "image": "assets/images/pngfuel 3.png", 
    },
  ];

  @override
  void initState() {
    super.initState();
    
    _bannerTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentBannerPage < bannerImages.length - 1) {
        _currentBannerPage++;
      } else {
        _currentBannerPage = 0;
      }

      if (_bannerController.hasClients) {
        _bannerController.animateToPage(
          _currentBannerPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.black54),
                    hintText: "Search Store",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

               
              Column(
                children: [
                  SizedBox(
                    height: 115,
                    child: PageView.builder(
                      controller: _bannerController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentBannerPage = index;
                        });
                      },
                      itemCount: bannerImages.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            bannerImages[index],
                            width: double.infinity,
                            height: 115,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: 115,
                              color: Colors.green[100],
                              child: const Center(
                                child: Text("Fresh Vegetables - Get Up To 40% OFF"),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      bannerImages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: _currentBannerPage == index ? 16 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: _currentBannerPage == index
                              ? const Color(0xFF53B175)
                              : const Color(0xFFB3B3B3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Exclusive Offer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Exclusive Offer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("See all", style: TextStyle(color: Color(0xFF53B175), fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exclusiveProducts.length,
                  itemBuilder: (context, index) => _buildProductCard(exclusiveProducts[index]),
                ),
              ),

              const SizedBox(height: 20),

              // Best Selling
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Best Selling", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("See all", style: TextStyle(color: Color(0xFF53B175), fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
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

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountScreen()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF53B175),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
        ],
      ),
    );
  }

  
  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              name: product["name"],
              unit: product["unit"],
              price: product["price"],
              image: product["image"],
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE2E2E2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  product["image"],
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.fastfood, size: 50, color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(product["name"], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text(product["unit"], style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${product["price"]}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF53B175),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}