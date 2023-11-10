import 'package:flutter/material.dart';
import 'package:mobile/pages/cart/ui/pages/cart_page.dart';
import 'package:mobile/pages/produtos/ui/pages/produtos_page.dart';
import 'package:mobile/shared/app_colors.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int currentIndex = 0;
  final screens = [
    ProdutosPage(),
    Scaffold(
      backgroundColor: Colors.black,
    ),
    CartPage(),
    Scaffold(
      backgroundColor: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      extendBody: false,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.azulBorda,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Produtos',
            backgroundColor: AppColors.azulClaro,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Perfil',
            backgroundColor: AppColors.azulClaro,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
            label: 'Carrinho',
            backgroundColor: AppColors.azulClaro,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
            label: 'Menu',
            backgroundColor: AppColors.azulClaro,
          ),
        ],
      ),
    );
  }
}
