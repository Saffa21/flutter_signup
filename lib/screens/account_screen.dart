import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // 1. Profile Header Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    // Profile Avatar (Default placeholder)
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Color(0xFFF2F3F2),
                      child: Icon(
                        Icons.person,
                        size: 38,
                        color: Color(0xFF7C7C7C),
                      ),
                    ),
                    const SizedBox(width: 20),

                    // User Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Safaa Abdelmoez",
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFF181725),
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF53B175),
                                size: 15,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "safa@gmail.com",
                            style: TextStyle(
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xFF7C7C7C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const Divider(color: Color(0xFFE2E2E2), height: 1, thickness: 1),

              // 2. Options List
              _buildAccountOption(
                icon: Icons.shopping_bag_outlined,
                title: "Orders",
                onTap: () {},
              ),
              _buildAccountOption(
                icon: Icons.badge_outlined,
                title: "My Details",
                onTap: () {},
              ),
              _buildAccountOption(
                icon: Icons.location_on_outlined,
                title: "Delivery Address",
                onTap: () {},
              ),
              _buildAccountOption(
                icon: Icons.credit_card_outlined,
                title: "Payment Methods",
                onTap: () {},
              ),
              _buildAccountOption(
                icon: Icons.confirmation_number_outlined,
                title: "Promo Cord",
                onTap: () {},
              ),
              _buildAccountOption(
                icon: Icons.notifications_none_outlined,
                title: "Notifecations",
                onTap: () {},
              ),
              _buildAccountOption(
                icon: Icons.help_outline,
                title: "Help",
                onTap: () {},
              ),
              _buildAccountOption(
                icon: Icons.
                info_outline,
                title: "About",
                onTap: () {},
              ),

              const SizedBox(height: 25),

              // 3. Log Out Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.58),
                child: SizedBox(
                  width: double.infinity,
                  height: 67,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2F3F2),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Color(0xFF53B175),
                          size: 20,
                        ),
                        SizedBox(width: 40),
                        Text(
                          "Log Out",
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xFF53B175),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          leading: Icon(icon, color: const Color(0xFF181725), size: 20),
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFF181725),
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF181725),
            size: 14,
          ),
          onTap: onTap,
        ),
        const Divider(color: Color(0xFFE2E2E2), height: 1, thickness: 1),
      ],
    );
  }
}