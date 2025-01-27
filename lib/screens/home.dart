import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/providers/log_in_provider.dart';
import 'package:jyothi_labs_test/screens/log_in.dart';
import 'package:jyothi_labs_test/utils/fontstyles.dart';
import 'package:jyothi_labs_test/providers/home_screen_provider.dart';
import 'package:jyothi_labs_test/widgets/product_card.dart';
import 'package:jyothi_labs_test/widgets/reusable_snackbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final authProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Products",
                  style: Fontstyles.HeadlineTextStyle(context),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                ),
              ],
            ),

            // Product List
            Expanded(
              child: productProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : productProvider.products.isEmpty
                      ? const Center(child: Text("No products available"))
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            final product = productProvider.products[index];
                            return ProductCard(
                              product: product,
                              onIncrease: () {
                                productProvider.increaseQuantity(product.id);
                              },
                              onDecrease: () {
                                productProvider.decreaseQuantity(product.id);
                              },
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: productProvider.products.length,
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
