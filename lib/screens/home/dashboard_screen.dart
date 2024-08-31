import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 260,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        'User!',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Theme.of(context).colorScheme.onPrimary),
                    onPressed: () {
                      // Handle notification icon tap
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSummaryCard(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      _buildIncomeExpenseChart(context),
                      const SizedBox(height: 24),
                      _buildRevenueHistory(context),
                      const SizedBox(height: 24),
                      _buildRecentTransactions(context),
                      const SizedBox(height: 24),
                      _buildQuickActions(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 8,
      color: colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Balance',
              style: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimary),
            ),
            const SizedBox(height: 8),
            Text(
              '\$5,240.00',
              style: textTheme.headlineMedium?.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMiniSummary(context, 'Income', '\$3,500', Colors.white),
                _buildMiniSummary(context, 'Expenses', '\$2,260', Colors.white70),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniSummary(BuildContext context, String title, String amount, Color color) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.onPrimary.withOpacity(0.2),
              ),
              padding: const EdgeInsets.all(2),
              child: Icon(
                title.toLowerCase().contains('income') ? Icons.arrow_downward : Icons.arrow_upward,
                size: 18,
                color: colorScheme.onPrimary,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary.withOpacity(0.8)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: textTheme.titleMedium?.copyWith(color: color),
        ),
      ],
    );
  }

  Widget _buildIncomeExpenseChart(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Income vs Expenses', style: textTheme.titleLarge),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 4000,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const titles = ['Income', 'Expenses'];
                          return Text(titles[value.toInt()], style: textTheme.bodySmall);
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text('\$${value.toInt()}', style: textTheme.bodySmall);
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(toY: 3500, color: colorScheme.primary),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(toY: 2260, color: colorScheme.secondary),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueHistory(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Sample revenue data
    final revenueData = [
      {'name': 'Salary', 'amount': 3500},
      {'name': 'Freelance Work', 'amount': 800},
      {'name': 'Investment Dividends', 'amount': 300},
      {'name': 'Rental Income', 'amount': 1200},
      {'name': 'Side Project', 'amount': 500},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Revenue History', style: textTheme.titleLarge),
            ElevatedButton.icon(
              onPressed: () => _showAddRevenueDialog(context),
              icon: Icon(Icons.add, color: colorScheme.onPrimary),
              label: Text('Add New'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: revenueData.length,
          itemBuilder: (context, index) {
            final data = revenueData[index];
            return ListTile(
              title: Text(data['name'] as String, style: textTheme.titleMedium),
              trailing: Text(
                '\$${data['amount']}',
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void _showAddRevenueDialog(BuildContext context) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Revenue'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Revenue Name'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement the logic to add the new revenue
                print('New Revenue: ${nameController.text}, Amount: ${amountController.text}');
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Transactions', style: textTheme.titleLarge),
        SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.shopping_cart)),
              title: Text('Transaction ${index + 1}', style: textTheme.titleMedium),
              subtitle: Text('Category', style: textTheme.bodyMedium),
              trailing: Text('\$${(index + 1) * 10}.00', style: textTheme.titleMedium),
            );
          },
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Actions', style: textTheme.titleLarge),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActionButton(context, Icons.add, 'Add Expense'),
            _buildActionButton(context, Icons.bar_chart, 'View Reports'),
            _buildActionButton(context, Icons.settings, 'Settings'),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 8),
        Text(label, style: textTheme.bodySmall),
      ],
    );
  }
}