import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'history_controller.dart';
import '../../widgets/transaction_card.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildSummary(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    _buildFilters(),
                    _buildSearchBar(),
                    Expanded(
                      child: _buildTransactionList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 40), // Balance the header
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.arrow_downward, color: Colors.green, size: 16),
                    const SizedBox(width: 4),
                    const Text(
                      'Received',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Obx(() => Text(
                      '\$${controller.totalReceived.value.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey[300],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_upward, color: Colors.red, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        'Sent',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Obx(() => Text(
                        '\$${controller.totalSent.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.filters.length,
          itemBuilder: (context, index) {
            return Obx(() {
              final filter = controller.filters[index];
              final isSelected = controller.selectedFilter.value == filter;
              
              return GestureDetector(
                onTap: () => controller.setFilter(filter),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Export history',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    return Obx(() {
      final transactions = controller.filteredTransactions;
      
      if (transactions.isEmpty) {
        return const Center(
          child: Text('No transactions found'),
        );
      }
      
      // Group transactions by date
      final Map<String, List<dynamic>> groupedTransactions = {};
      
      for (var tx in transactions) {
        final date = tx.fullDate;
        if (!groupedTransactions.containsKey(date)) {
          groupedTransactions[date] = [];
        }
        groupedTransactions[date]!.add(tx);
      }
      
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: groupedTransactions.length,
        itemBuilder: (context, index) {
          final date = groupedTransactions.keys.elementAt(index);
          final txList = groupedTransactions[date]!;
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  date == DateTime.now().day.toString() + ' ' + DateTime.now().month.toString()
                      ? 'Today, $date'
                      : date,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              ...txList.map((tx) => TransactionCard(transaction: tx)).toList(),
            ],
          );
        },
      );
    });
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 1,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Get.offAllNamed('/home');
        } else if (index == 2) {
          Get.toNamed('/profile');
        }
      },
    );
  }
}