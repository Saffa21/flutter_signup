import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String name;
  final String unit;
  final double price;
  final String image;

  const ProductDetailsScreen({
    Key? key,
    required this.name,
    required this.unit,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Header Image + Navigation Buttons Area
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2F3F2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        widget.image,
                        width: 250,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.fastfood, size: 100, color: Colors.green),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 15,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF181725)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 15,
                    child: IconButton(
                      icon: const Icon(Icons.ios_share, color: Color(0xFF181725)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  Product Name + Heart Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF181725),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border, color: Color(0xFF7C7C7C)),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    // Product Weight / Subtitle
                    Text(
                      widget.unit,
                      style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF7C7C7C),
                      ),
                    ),

                    const SizedBox(height: 30),

                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.
                      spaceBetween,
                      children: [
                        Row(
                          children: [
                            
                            GestureDetector(
                              onTap: () {
                                if (quantity > 1) setState(() => quantity--);
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Color(0xFFB3B3B3),
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 15),

                            
                            Container(
                              width: 45.67,
                              height: 45.67,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(color: const Color(0xFFE2E2E2)),
                              ),
                              child: Text(
                                '$quantity',
                                style: const TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF181725),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),

                            
                            GestureDetector(
                              onTap: () => setState(() => quantity++),
                              child: const Icon(
                                Icons.add,
                                color: Color(0xFF53B175),
                                size: 28,
                              ),
                            ),
                          ],
                        ),

                        // Price
                        Text(
                          '\$${widget.price}',
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF181725),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),
                    const Divider(color: Color(0xB3E2E2E2), thickness: 1),

                    //  Product Details Section
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        title: const Text(
                          'Product Detail',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF181725),
                          ),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF181725)),
                        children: const [
                          Text(
                            'Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For Your Heart. As Part Of A Healthful And Varied Diet.',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xFF7C7C7C),
                              height: 1.4,
                            ),
                            ),
                        ],
                      ),
                    ),

                    const Divider(color: Color(0xB3E2E2E2), thickness: 1),

                    //  Nutritons Section
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          const Text(
                            'Nutritons',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFF181725),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2E2E2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              '100gr',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w600,
                                fontSize: 9,
                                color: Color(0xFF7C7C7C),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF181725)),
                        ],
                      ),
                    ),

                    const Divider(color: Color(0xB3E2E2E2), thickness: 1),

                    //  Review Section
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          const Text(
                            'Review',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFF181725),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Color(0xFFF3603F),
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF181725)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    //  Add To Basket Button
                    SizedBox(
                      width: double.infinity,
                      height: 67,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF53B175),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Add To Basket',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xFFFFF9FF),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
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