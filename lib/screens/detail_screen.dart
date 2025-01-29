import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/models/product_model.dart';
import 'package:jyothi_labs_test/providers/detail_screen_provider.dart';
import 'package:jyothi_labs_test/utils/fontstyles.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailScreenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          // Product Image
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.thumbnail,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, size: 100),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ),

          // Product Name
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              product.title,
              style: Fontstyles.BodyTextStyle(context).copyWith(fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Product Price
              Text(
                "Price: \$${product.totalPrice.toStringAsFixed(2)}",
                style:
                    Fontstyles.BodyTextStyle3(context).copyWith(fontSize: 18),
              ),
              // Quantity Controls
              Row(
                children: [
                  IconButton(
                    onPressed: product.quantity > 1
                        ? () => provider.decreaseQuantity(product.id)
                        : null,
                    icon: const Icon(Icons.remove_circle_outline),
                    color: product.quantity > 1
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    "${product.quantity}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  IconButton(
                    onPressed: product.quantity < product.stock
                        ? () => provider.increaseQuantity(product.id)
                        : null,
                    icon: const Icon(Icons.add_circle_outline),
                    color: product.quantity < product.stock
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
