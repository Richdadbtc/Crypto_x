import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildTabBar(context),
            _buildTotalValue(context),
            _buildActionButtons(context),
            _buildPortfolioHeader(context),
            Expanded(
              child: _buildPortfolioList(context),
            ),
            _buildSafeguardsBanner(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildTab('Overview', isSelected: true),
          _buildTab('Spot'),
          _buildTab('DEX+'),
          _buildTab('Futures'),
          _buildTab('Fiat'),
          _buildTab('Copy'),
        ],
      ),
    );
  }

  Widget _buildTab(String title, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 20,
            color: isSelected ? Colors.red : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildTotalValue(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Total Value',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.visibility,
                color: Colors.grey.shade600,
                size: 16,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.red,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Earn',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                '0.00572499',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Row(
                children: [
                  const Text(
                    'BTC',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '≈594.29 USD',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey.shade400,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(
            icon: Icons.arrow_downward,
            label: 'Deposit',
            isPrimary: true,
          ),
          _buildActionButton(
            icon: Icons.arrow_upward,
            label: 'Withdraw',
          ),
          _buildActionButton(
            icon: Icons.swap_horiz,
            label: 'Transfer',
          ),
          _buildActionButton(
            icon: Icons.currency_exchange,
            label: 'Convert',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    bool isPrimary = false,
  }) {
    return Container(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isPrimary ? Colors.blue : Colors.grey.shade900,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Portfolio',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.history,
            color: Colors.grey,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildPortfolioItem(
          icon: Icons.circle,
          label: 'Spot',
          value: '0.00572499 BTC',
          showArrow: true,
        ),
        _buildPortfolioItem(
          icon: Icons.circle,
          label: 'DEX+',
          value: '-- USD',
          showArrow: true,
        ),
        _buildPortfolioItem(
          icon: Icons.circle,
          label: 'Futures',
          value: '0 BTC',
          showArrow: true,
        ),
        _buildPortfolioItem(
          icon: Icons.circle,
          label: 'Fiat',
          value: '0 BTC',
          showArrow: true,
        ),
        _buildPortfolioItem(
          icon: Icons.circle,
          label: 'Copy Trade',
          value: '0 BTC',
          showArrow: true,
        ),
      ],
    );
  }

  Widget _buildPortfolioItem({
    required IconData icon,
    required String label,
    required String value,
    bool showArrow = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          if (showArrow) ...[
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 14,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSafeguardsBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(
            Icons.shield_outlined,
            color: Colors.grey,
            size: 16,
          ),
          const SizedBox(width: 8),
          const Text(
            'MEXC Safeguards Asset Security',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 12,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: 4,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_outlined),
          label: 'Markets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz),
          label: 'Trade',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stacked_line_chart),
          label: 'Futures',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallets',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Get.toNamed('/home');
        } else if (index == 1) {
          Get.toNamed('/market');
        } else if (index == 2) {
          Get.toNamed('/trade');
        } else if (index == 3) {
          // Navigate to Futures page when implemented
        } else if (index == 4) {
          // Already on wallet page
        }
      },
    );
  }
}