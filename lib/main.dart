import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';


void main() {
  runApp(const KalanApp());
}

class KalanApp extends StatelessWidget {
  const KalanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalan',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainTabScreen(),
        '/product': (context) => const ProductDetailScreen(),
        '/cart': (context) => const CartScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/tracking': (context) => const OrderTrackingScreen(),
        '/notifications': (context) => const NotificationsScreen(),
      },
    );
  }
}

class AppColors {
  static const Color primary = Color(0xFFFFB300); // Yellow/Orange
  static const Color dark = Color(0xFF000000);    // Black
  static const Color light = Color(0xFFFFF3E0);   // Light Orange
  static const Color bg = Color(0xFFF9FAFB);      // Light Grey/White
  static const Color textPrimary = Color(0xFF111827);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color danger = Color(0xFFFF5252);
}

class AppTypography {
  static TextStyle display(BuildContext context, {Color color = AppColors.textPrimary, double fontSize = 24, FontWeight fontWeight = FontWeight.w700}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  static TextStyle body(BuildContext context, {Color color = AppColors.textPrimary, double fontSize = 14, FontWeight fontWeight = FontWeight.w400}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  static TextStyle price(BuildContext context, {Color color = AppColors.textPrimary, double fontSize = 18, FontWeight fontWeight = FontWeight.w700}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.dark,
        surface: AppColors.white,
        background: AppColors.bg,
        error: AppColors.danger,
      ),
      useMaterial3: true,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
          image: DecorationImage(
            image: NetworkImage('https://source.unsplash.com/1200x800/?grocery,shopping'),
            fit: BoxFit.cover,
            opacity: 0.15,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 96,
                        height: 96,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          LucideIcons.shoppingBag,
                          color: AppColors.primary,
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Kalan',
                        style: AppTypography.display(context, color: AppColors.white, fontSize: 48),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Fresh groceries delivered to your door.',
                        textAlign: TextAlign.center,
                        style: AppTypography.body(context, color: AppColors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/main');
                        },
                        child: Text(
                          'Get Started',
                          style: AppTypography.body(context, color: AppColors.primary, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.white, width: 1),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Login',
                          style: AppTypography.body(context, color: AppColors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        leading: IconButton(
          icon: Icon(LucideIcons.arrowLeft, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isLogin ? 'Welcome back' : 'Create account',
              style: AppTypography.display(context, fontSize: 32),
            ),
            const SizedBox(height: 8),
            Text(
              isLogin ? 'Enter your details to proceed.' : 'Sign up to get started.',
              style: AppTypography.body(context, color: AppColors.textMuted),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isLogin = true),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isLogin ? AppColors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(999),
                                boxShadow: isLogin ? [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  )
                                ] : null,
                              ),
                              alignment: Alignment.center,
                              child: Text('Login', style: AppTypography.body(context, color: isLogin ? AppColors.primary : AppColors.textMuted)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isLogin = false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: !isLogin ? AppColors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(999),
                                boxShadow: !isLogin ? [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  )
                                ] : null,
                              ),
                              alignment: Alignment.center,
                              child: Text('Sign Up', style: AppTypography.body(context, color: !isLogin ? AppColors.primary : AppColors.textMuted)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (!isLogin) ...[
                    _buildInput(LucideIcons.user, 'Full Name'),
                    const SizedBox(height: 16),
                  ],
                  _buildInput(LucideIcons.mail, 'Email Address'),
                  const SizedBox(height: 16),
                  _buildInput(LucideIcons.lock, 'Password', obscureText: true),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                        elevation: 0,
                      ),
                      onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
                      child: Text(isLogin ? 'Login' : 'Sign Up', style: AppTypography.body(context, color: AppColors.white)),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('OR', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
                      ),
                      const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFE5E7EB)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                      ),
                      onPressed: () {},
                      child: Text('Continue with Google', style: AppTypography.body(context)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(IconData icon, String placeholder, {bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textMuted, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              obscureText: obscureText,
              style: AppTypography.body(context),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: AppTypography.body(context, color: AppColors.textMuted),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text('Profile')),
    const Center(child: Text('Favorites')),
    const Center(child: Text('Cart')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_currentIndex],
          Positioned(
            bottom: 30,
            left: 24,
            right: 24,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.dark,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.dark.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(LucideIcons.layoutGrid, 0),
                  _buildNavItem(LucideIcons.user, 1),
                  _buildNavItem(LucideIcons.heart, 2),
                  _buildNavItem(LucideIcons.shoppingBag, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Icon(
          icon,
          color: isSelected ? AppColors.primary : AppColors.white,
          size: 24,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120), // space for floating nav
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(context),
              _buildSearchBar(context),
              _buildCategories(context),
              const SizedBox(height: 24),
              _buildPopularItems(context),
              const SizedBox(height: 32),
              _buildFavoriteRestaurants(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Icon(LucideIcons.menu, color: AppColors.textPrimary, size: 20),
          ),
          Text('Search Food', style: AppTypography.display(context, fontSize: 18)),
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://source.unsplash.com/100x100/?portrait,man'),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Row(
                children: [
                  Icon(LucideIcons.search, color: AppColors.textMuted, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Healty Food',
                        hintStyle: AppTypography.body(context, color: AppColors.textPrimary),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Icon(LucideIcons.slidersHorizontal, color: AppColors.textPrimary, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24.0),
      child: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildCategoryChip(context, 'Fast Food', true, '🍕'),
            const SizedBox(width: 12),
            _buildCategoryChip(context, 'Fruites', false, '🍓'),
            const SizedBox(width: 12),
            _buildCategoryChip(context, 'Drinks', false, '🍹'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label, bool isSelected, String emoji) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.circular(999),
        boxShadow: isSelected ? [
          BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))
        ] : [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
            child: Text(emoji, style: const TextStyle(fontSize: 14)),
          ),
          const SizedBox(width: 8),
          Text(label, style: AppTypography.body(context, color: isSelected ? AppColors.white : AppColors.textMuted, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400)),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget _buildPopularItems(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        scrollDirection: Axis.horizontal,
        children: [
          _buildItemCard(context, 'Grilled skewers', 'Spicy mutton', '\$36.00', 'https://source.unsplash.com/200x200/?skewer,meat', true),
          const SizedBox(width: 16),
          _buildItemCard(context, 'Thai Spaghetti', 'Fresh Tomato', '\$12.00', 'https://source.unsplash.com/200x200/?spaghetti,pasta', false),
        ],
      ),
    );
  }

  Widget _buildItemCard(BuildContext context, String title, String subtitle, String price, String imgUrl, bool isFavorite) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipOval(
                child: Image.network(imgUrl, width: 100, height: 100, fit: BoxFit.cover),
              ),
            ),
            const Spacer(),
            Text(title, style: AppTypography.display(context, fontSize: 14)),
            const SizedBox(height: 4),
            Text(subtitle, style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 11)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: AppTypography.price(context, fontSize: 16)),
                Icon(
                  isFavorite ? LucideIcons.heart : LucideIcons.heart, // filled vs outline ideally
                  color: isFavorite ? AppColors.danger : AppColors.textPrimary,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteRestaurants(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Favorite Restaurants', style: AppTypography.display(context, fontSize: 16)),
              Text('See all', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRestaurantCard(context, 'Foodcave Restaurants', 'New York, Australia'), // matching the weird image typo
                const SizedBox(width: 16),
                _buildRestaurantCard(context, 'Downtown Resto', 'New York, USA'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(BuildContext context, String title, String location) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.network('https://source.unsplash.com/80x80/?restaurant,food', width: 56, height: 56, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: AppTypography.display(context, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(5, (index) => Icon(LucideIcons.star, color: AppColors.primary, size: 10)),
                ),
                const SizedBox(height: 4),
                Text(location, style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildFilterBar(context),
            Expanded(child: _buildGrid(context)),
            _buildApplyButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Food Category', style: AppTypography.display(context, color: AppColors.white, fontSize: 32)),
          const SizedBox(height: 8),
          Text('Explore the best meals around you.', style: AppTypography.body(context, color: AppColors.light)),
        ],
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context) {
    final filters = ['Price', 'Rating', 'Distance'];
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: filters.map((f) => Chip(
          label: Row(
            children: [
              Text(f, style: AppTypography.body(context, fontSize: 12)),
              const SizedBox(width: 4),
              Icon(LucideIcons.chevronDown, size: 14),
            ],
          ),
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
            side: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    final items = [
      {'name': 'Cheese Burger', 'price': '\$12.99', 'img': 'burger'},
      {'name': 'Pepperoni Pizza', 'price': '\$14.99', 'img': 'pizza'},
      {'name': 'Pasta Bolognese', 'price': '\$10.50', 'img': 'pasta'},
      {'name': 'Caesar Salad', 'price': '\$8.00', 'img': 'salad'},
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/product'),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      'https://source.unsplash.com/400x300/?${item['img']},food',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name']!, style: AppTypography.display(context, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Text(item['price']!, style: AppTypography.price(context, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildApplyButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
          ),
          onPressed: () {},
          child: Text('Apply Filter', style: AppTypography.body(context, color: AppColors.white)),
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageAndStats(context),
                    const SizedBox(height: 24),
                    _buildDetails(context),
                    const SizedBox(height: 24),
                    _buildToppings(context),
                  ],
                ),
              ),
            ),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary, size: 20),
            ),
          ),
          Icon(LucideIcons.heart, color: AppColors.primary, size: 24), // Heart should be yellow/orange filled
        ],
      ),
    );
  }

  Widget _buildImageAndStats(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ClipOval(
            child: Image.network(
              'https://source.unsplash.com/600x600/?salad,bowl',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(LucideIcons.star, color: AppColors.primary, size: 16),
                    const SizedBox(width: 8),
                    Text('5.0', style: AppTypography.display(context, fontSize: 14)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: [
                    BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6)),
                  ],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () { if (_quantity > 1) setState(() => _quantity--); },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('-', style: TextStyle(fontSize: 18, color: AppColors.dark, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Text('0$_quantity', style: AppTypography.display(context, color: AppColors.dark, fontSize: 16)),
                    GestureDetector(
                      onTap: () => setState(() => _quantity++),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('+', style: TextStyle(fontSize: 18, color: AppColors.dark, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text('Spicy Chicken\nRicemix', style: AppTypography.display(context, fontSize: 24, fontWeight: FontWeight.w800)),
              ),
              Row(
                children: [
                  Icon(LucideIcons.clock, color: AppColors.danger, size: 16),
                  const SizedBox(width: 4),
                  Text('10-15 Mins', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Grilled meat skewers, shish kebab and healthy to vegetable salad of fresh tomato cucumbe.',
            style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 13),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildToppings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Toping for you', style: AppTypography.display(context, fontSize: 16)),
              Text('Clear', style: AppTypography.body(context, color: AppColors.danger, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 70,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollDirection: Axis.horizontal,
            children: [
              _buildToppingItem('https://source.unsplash.com/100x100/?meat', true),
              const SizedBox(width: 12),
              _buildToppingItem('https://source.unsplash.com/100x100/?broccoli', false),
              const SizedBox(width: 12),
              _buildToppingItem('https://source.unsplash.com/100x100/?onion', null),
              const SizedBox(width: 12),
              _buildToppingItem('https://source.unsplash.com/100x100/?tomato', null),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToppingItem(String imgUrl, bool? isAdded) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Image.network(imgUrl, width: 40, height: 40, fit: BoxFit.contain),
          ),
        ),
        if (isAdded != null)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isAdded ? AppColors.dark : AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isAdded ? LucideIcons.plus : LucideIcons.minus,
                color: isAdded ? AppColors.white : AppColors.dark,
                size: 10,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Total Price', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
              Row(
                children: [
                  Text('\$', style: AppTypography.display(context, color: AppColors.primary, fontSize: 20)),
                  Text(' 36.00', style: AppTypography.display(context, fontSize: 24, fontWeight: FontWeight.w800)),
                ],
              ),
            ],
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.dark,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            icon: Icon(LucideIcons.shoppingCart, size: 18),
            label: Text('Go To Cart', style: AppTypography.body(context, color: AppColors.white, fontWeight: FontWeight.w600)),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Text('My\nCart List', style: AppTypography.display(context, fontSize: 32, fontWeight: FontWeight.w800)),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCartItem(context, 'Grilled skewers', '\$13.99', 2, 'https://source.unsplash.com/100x100/?skewer,meat'),
                    const SizedBox(height: 24),
                    _buildCartItem(context, 'Thai Spaghetti', '\$30.99', 2, 'https://source.unsplash.com/100x100/?spaghetti,pasta'),
                    const SizedBox(height: 32),
                    _buildDiscountCode(context),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            _buildBottomSheet(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary, size: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Icon(LucideIcons.trash2, color: AppColors.textPrimary, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, String name, String price, int qty, String imgUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(imgUrl, width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTypography.display(context, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(price, style: AppTypography.display(context, fontSize: 14)),
                    const SizedBox(width: 8),
                    Text('x$qty', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: const [
                Icon(LucideIcons.plus, color: AppColors.white, size: 14),
                SizedBox(height: 8),
                Icon(LucideIcons.minus, color: AppColors.white, size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountCode(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(LucideIcons.badgePercent, color: AppColors.danger, size: 20),
        const SizedBox(width: 8),
        Text('Do you have any discount code?', style: AppTypography.body(context, color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow(context, 'Subtotal', '\$ 96.00'),
          const SizedBox(height: 12),
          _buildSummaryRow(context, 'Est.Tax', '2.00'),
          const SizedBox(height: 12),
          _buildSummaryRow(context, 'Delivery', 'Free'),
          const SizedBox(height: 24),
          const Divider(color: Color(0xFFE5E7EB), thickness: 1, height: 1), // Ideally dashed, but solid works for now
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: AppTypography.display(context, fontSize: 18)),
              Text('\$ 98.00', style: AppTypography.display(context, fontSize: 18, fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 0,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Checkout', style: AppTypography.body(context, color: AppColors.dark, fontWeight: FontWeight.w600, fontSize: 16)),
                  const SizedBox(width: 8),
                  Icon(LucideIcons.arrowRight, color: AppColors.dark, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTypography.body(context, color: AppColors.textMuted)),
        Text(value, style: AppTypography.body(context, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedMethod = 0;
  bool _showSuccess = false;

  @override
  Widget build(BuildContext context) {
    if (_showSuccess) return _buildSuccessScreen(context);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        leading: IconButton(
          icon: Icon(LucideIcons.arrowLeft, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Payment', style: AppTypography.display(context, fontSize: 20)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAddressCard(context),
                const SizedBox(height: 32),
                Text('Payment Method', style: AppTypography.display(context, fontSize: 18)),
                const SizedBox(height: 16),
                _buildPaymentTabs(context),
                const SizedBox(height: 24),
                _buildPaymentForm(context),
                const SizedBox(height: 32),
                _buildOrderSummary(context),
              ],
            ),
          ),
          _buildBottomCTA(context),
        ],
      ),
    );
  }

  Widget _buildAddressCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(LucideIcons.mapPin, color: AppColors.primary, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Home Address', style: AppTypography.body(context, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text('123 Main Street, Apt 4B\nNew York, NY 10001', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 14)),
              ],
            ),
          ),
          Icon(LucideIcons.edit2, color: AppColors.primary, size: 20),
        ],
      ),
    );
  }

  Widget _buildPaymentTabs(BuildContext context) {
    final tabs = ['Card', 'UPI/Wallet', 'Cash'];
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = _selectedMethod == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedMethod = index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.light : Colors.transparent,
                  borderRadius: BorderRadius.circular(999),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index], 
                  style: AppTypography.body(context, color: isSelected ? AppColors.primary : AppColors.textMuted, fontSize: 14)
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPaymentForm(BuildContext context) {
    if (_selectedMethod == 0) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            _buildInput(context, 'Card Number', '0000 0000 0000 0000'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildInput(context, 'Expiry Date', 'MM/YY')),
                const SizedBox(width: 16),
                Expanded(child: _buildInput(context, 'CVV', '123')),
              ],
            ),
          ],
        ),
      );
    } else if (_selectedMethod == 1) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: _buildInput(context, 'UPI ID', 'username@bank'),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text('Pay with cash when your order is delivered.', style: AppTypography.body(context, color: AppColors.textMuted)),
      );
    }
  }

  Widget _buildInput(BuildContext context, String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.body(context, fontSize: 12, color: AppColors.textMuted)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: AppTypography.body(context, color: const Color(0xFFD1D5DB)),
              border: InputBorder.none,
            ),
            style: AppTypography.body(context),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    return ExpansionTile(
      title: Text('Order Summary', style: AppTypography.display(context, fontSize: 16)),
      childrenPadding: const EdgeInsets.all(16),
      collapsedBackgroundColor: AppColors.white,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1x Classic Cheese Burger', style: AppTypography.body(context, color: AppColors.textMuted)),
            Text('\$12.99', style: AppTypography.price(context, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('2x French Fries', style: AppTypography.body(context, color: AppColors.textMuted)),
            Text('\$9.00', style: AppTypography.price(context, fontSize: 14)),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomCTA(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
            ),
            onPressed: () {
              setState(() => _showSuccess = true);
            },
            child: Text('Pay \$23.99', style: AppTypography.body(context, color: AppColors.white)),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(LucideIcons.checkCircle2, color: AppColors.primary, size: 64),
              ),
              const SizedBox(height: 32),
              Text('Order Placed!', style: AppTypography.display(context, fontSize: 32)),
              const SizedBox(height: 8),
              Text('Your order ID is #KLN-84392', style: AppTypography.body(context, color: AppColors.textMuted)),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                  ),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/tracking'),
                  child: Text('Track Order', style: AppTypography.body(context, color: AppColors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        title: Text('Track Order', style: AppTypography.display(context, fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildMapPlaceholder(context),
            const SizedBox(height: 32),
            _buildEstimatedTime(context),
            const SizedBox(height: 32),
            _buildStepper(context),
            const SizedBox(height: 32),
            _buildDeliveryPerson(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMapPlaceholder(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage('https://source.unsplash.com/800x400/?city,map'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.color),
        ),
      ),
    );
  }

  Widget _buildEstimatedTime(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.clock, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Text('Estimated Delivery: ', style: AppTypography.body(context, color: AppColors.textMuted)),
          Text('20 Min', style: AppTypography.body(context, fontWeight: FontWeight.w500, color: AppColors.primary)),
        ],
      ),
    );
  }

  Widget _buildStepper(BuildContext context) {
    final steps = ['Order Placed', 'Confirmed', 'Preparing', 'Out for Delivery', 'Delivered'];
    final activeStep = 3; // Out for delivery

    return Column(
      children: List.generate(steps.length, (index) {
        final isActive = index <= activeStep;
        final isLast = index == steps.length - 1;
        
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.light,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 2),
                  ),
                  child: isActive ? Icon(LucideIcons.check, color: AppColors.white, size: 12) : null,
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 40,
                    color: isActive ? AppColors.primary : AppColors.light,
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                steps[index],
                style: AppTypography.body(
                  context,
                  color: isActive ? AppColors.textPrimary : AppColors.textMuted,
                  fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildDeliveryPerson(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage('https://source.unsplash.com/100x100/?portrait,person&sig=2'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Driver', style: AppTypography.display(context, fontSize: 16)),
                const SizedBox(height: 4),
                Text('Delivery Partner', style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.bg,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.light),
            ),
            child: Icon(LucideIcons.messageSquare, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(LucideIcons.phoneCall, color: AppColors.white, size: 20),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        title: Text('Profile', style: AppTypography.display(context, fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 32),
            _buildMenu(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.light,
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: NetworkImage('https://source.unsplash.com/100x100/?portrait,person'),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: AppColors.white, width: 4),
          ),
        ),
        const SizedBox(height: 16),
        Text('Jane Doe', style: AppTypography.display(context, fontSize: 24)),
        const SizedBox(height: 4),
        Text('jane.doe@example.com', style: AppTypography.body(context, color: AppColors.textMuted, fontWeight: FontWeight.w300)),
      ],
    );
  }

  Widget _buildMenu(BuildContext context) {
    final menuItems = [
      {'icon': LucideIcons.package, 'title': 'My Orders', 'route': '/tracking'},
      {'icon': LucideIcons.mapPin, 'title': 'Saved Addresses', 'route': null},
      {'icon': LucideIcons.creditCard, 'title': 'Payment Methods', 'route': '/payment'},
      {'icon': LucideIcons.bell, 'title': 'Notifications', 'route': '/notifications'},
      {'icon': LucideIcons.helpCircle, 'title': 'Help & Support', 'route': null},
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ...menuItems.map((item) => _buildMenuRow(
            context, 
            item['icon'] as IconData, 
            item['title'] as String,
            onTap: item['route'] != null ? () => Navigator.pushNamed(context, item['route'] as String) : null,
          )),
          _buildLogoutRow(context),
        ],
      ),
    );
  }

  Widget _buildMenuRow(BuildContext context, IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary, size: 20),
      title: Text(title, style: AppTypography.body(context)),
      trailing: Icon(LucideIcons.chevronRight, color: AppColors.textMuted, size: 20),
      onTap: onTap,
    );
  }

  Widget _buildLogoutRow(BuildContext context) {
    return ListTile(
      title: Text('Logout', style: AppTypography.body(context, color: AppColors.danger)),
      onTap: () => Navigator.pushReplacementNamed(context, '/login'),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        leading: IconButton(
          icon: Icon(LucideIcons.arrowLeft, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Notifications', style: AppTypography.display(context, fontSize: 20)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Mark all as read', style: AppTypography.body(context, color: AppColors.primary, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildNotification(context, 'Order Arrived!', 'Your order #KLN-84392 has arrived at your location.', LucideIcons.package, 'Just now', isUnread: true),
          const SizedBox(height: 16),
          _buildNotification(context, '50% OFF Promo', 'Use code KALAN50 to get 50% off your next order.', LucideIcons.tag, '2 hours ago', isUnread: true),
          const SizedBox(height: 16),
          _buildNotification(context, 'Order Confirmed', 'Your order #KLN-84391 has been confirmed.', LucideIcons.checkCircle, 'Yesterday'),
        ],
      ),
    );
  }

  Widget _buildNotification(BuildContext context, String title, String body, IconData icon, String time, {bool isUnread = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? AppColors.bg : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: isUnread ? Border.all(color: AppColors.light) : null,
        boxShadow: isUnread ? null : [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUnread ? AppColors.white : AppColors.bg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: AppTypography.display(context, fontSize: 16)),
                    Text(time, style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(body, style: AppTypography.body(context, color: AppColors.textMuted, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
