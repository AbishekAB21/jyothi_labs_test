import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/screens/detail_screen.dart';
import 'package:jyothi_labs_test/utils/fontstyles.dart';
import 'package:jyothi_labs_test/providers/home_screen_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const ProductCard({
    super.key,
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                product: product,
              ),
            ));
      },
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              // Thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.thumbnail,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: 60,
                      height: 60,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      color: Theme.of(context).colorScheme.tertiary,
                      child: Icon(
                        Icons.broken_image,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),

              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: Fontstyles.BodyTextStyle(context),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Price: \$${product.price}",
                      style: Fontstyles.BodyTextStyle3(context),
                    ),
                    Text(
                      "Stock: ${product.stock}",
                      style: Fontstyles.BodyTextStyle3(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
