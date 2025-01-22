import 'package:flutter/material.dart';
import '../repositories/food_repository.dart';
import '../repositories/cart_repository.dart';
import '../widgets/food_item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _foodRepository = FoodRepository();
  final _cartRepository = CartRepository();
  String _searchQuery = '';
  String _selectedCategory = 'Semua';

  final List<Map<String, dynamic>> _categories = [
    {'icon': '🍚', 'name': 'Semua'},
    {'icon': '🍜', 'name': 'Nasi'},
    {'icon': '🍝', 'name': 'Mie'},
    {'icon': '🍖', 'name': 'Daging'},
    {'icon': '🥗', 'name': 'Sayur'},
    {'icon': '🍹', 'name': 'Minuman'},
  ];

  @override
  Widget build(BuildContext context) {
    // Ambil semua item makanan
    final allFoodItems = _foodRepository.getAllFoodItems();
    
    // Filter berdasarkan pencarian
    final searchedItems = _searchQuery.isEmpty 
        ? allFoodItems 
        : allFoodItems.where((item) =>
            item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            item.description.toLowerCase().contains(_searchQuery.toLowerCase())
          ).toList();

    // Filter berdasarkan kategori
    final filteredItems = _selectedCategory == 'Semua'
        ? searchedItems
        : searchedItems.where((item) {
            switch (_selectedCategory) {
              case 'Nasi':
                return item.name.toLowerCase().contains('nasi');
              case 'Mie':
                return item.name.toLowerCase().contains('mie');
              case 'Daging':
                return item.name.toLowerCase().contains('ayam') || 
                       item.name.toLowerCase().contains('sate');
              case 'Sayur':
                return item.name.toLowerCase().contains('gado') || 
                       item.name.toLowerCase().contains('sayur') ||
                       item.name.toLowerCase().contains('sop');
              case 'Minuman':
                return item.name.toLowerCase().contains('minuman'); 
              default:
                return true;
            }
          }).toList();

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          _buildSearchBar(),
          _buildCategories(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return FoodItemCard(
                  item: item,
                  onAddToCart: () {
                    setState(() {
                      _cartRepository.addItem(item);
                    });
                    
                    // Tampilkan snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} ditambahkan ke keranjang'),
                        action: SnackBarAction(
                          label: 'LIHAT KERANJANG',
                          onPressed: () {
                            // TODO: Navigasi ke halaman keranjang
                          },
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category['name'] == _selectedCategory;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category['name'];
              });
            },
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected 
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      category['icon'],
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category['name'],
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected 
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[600],
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Cari makanan...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
} 