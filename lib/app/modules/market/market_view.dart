import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'market_controller.dart';

class MarketView extends GetView<MarketController> {
  const MarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1118),
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(context),
            _buildCategoryTabs(context),
            _buildFilterTabs(context),
            _buildColumnHeaders(context),
            Expanded(
              child: _buildCryptoList(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(
              Icons.search,
              color: Colors.grey.shade400,
            ),
            const SizedBox(width: 8),
            Text(
              'Search',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildCategoryTab('Favorites', isSelected: false),
          const SizedBox(width: 24),
          _buildCategoryTab('Swing', isSelected: false),
          const SizedBox(width: 24),
          _buildCategoryTab('Spot', isSelected: true),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String title, {required bool isSelected}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.teal : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        if (isSelected)
          Container(
            height: 3,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
      ],
    );
  }

  Widget _buildFilterTabs(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildFilterTab('All', isSelected: true),
          _buildFilterTab('🔥 Top volume', isSelected: false),
          _buildFilterTab('New listing', isSelected: false),
          _buildFilterTab('Gain', isSelected: false),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String title, {required bool isSelected}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
        border: isSelected ? Border.all(color: Colors.red, width: 1) : null,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.red : Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildColumnHeaders(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          const Text(
            'Name',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          const Text(
            'Last Price',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 40),
          const Text(
            '24h',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCryptoList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        _buildCryptoItem(
          context,
          symbol: 'ETH',
          name: 'USDT',
          price: '2,667.14',
          volume: '90,521.82M USDT',
          change: '+6.93%',
          iconPath: 'assets/images/crypto/eth.png',
          iconColor: const Color(0xFF627EEA),
        ),
        _buildCryptoItem(
          context,
          symbol: 'BTC',
          name: 'USDT',
          price: '103,990.9',
          volume: '1,518.68M USDT',
          change: '+0.87%',
          iconPath: 'assets/images/crypto/btc.png',
          iconColor: const Color(0xFFF7931A),
        ),
        _buildCryptoItem(
          context,
          symbol: 'SOL',
          name: 'USDT',
          price: '183.392',
          volume: '90,123.9M USDT',
          change: '+4.98%',
          iconPath: 'assets/images/crypto/sol.png',
          iconColor: const Color(0xFF00FFA3),
        ),
        _buildCryptoItem(
          context,
          symbol: 'XRP',
          name: 'USDT',
          price: '2.58859',
          volume: '122.18M USDT',
          change: '+1.95%',
          iconPath: 'assets/images/crypto/xrp.png',
          iconColor: const Color(0xFF23292F),
        ),
        _buildCryptoItem(
          context,
          symbol: 'XMR',
          name: 'USDT',
          price: '340.59',
          volume: '40.58M USDT',
          change: '+1.01%',
          iconPath: 'assets/images/crypto/xmr.png',
          iconColor: const Color(0xFFFF6600),
        ),
        _buildCryptoItem(
          context,
          symbol: 'ADA',
          name: 'USDT',
          price: '0.8294',
          volume: '122.18M USDT',
          change: '+0.81%',
          iconPath: 'assets/images/crypto/ada.png',
          iconColor: const Color(0xFF0033AD),
        ),
        _buildCryptoItem(
          context,
          symbol: 'DOGE',
          name: 'USDT',
          price: '0.23979',
          volume: '30.12.3M USDT',
          change: '+2.68%',
          iconPath: 'assets/images/crypto/doge.png',
          iconColor: const Color(0xFFC3A634),
        ),
      ],
    );
  }

  Widget _buildCryptoItem(
    BuildContext context, {
    required String symbol,
    required String name,
    required String price,
    required String volume,
    required String change,
    required String iconPath,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: 20,
                height: 20,
                errorBuilder: (context, error, stackTrace) {
                  return Text(
                    symbol[0],
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                symbol,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                volume,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${price}',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: change.startsWith('+') 
                  ? Colors.green.withOpacity(0.2) 
                  : Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              change,
              style: TextStyle(
                color: change.startsWith('+') ? Colors.green : Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A1118),
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Trade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Swing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Get.offAllNamed('/home');
          } else if (index == 4) {
            Get.toNamed('/profile');
          }
        },
      ),
    );
  }
}