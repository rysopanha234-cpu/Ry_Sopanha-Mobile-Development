import 'package:flutter/material.dart';

enum Product {
  pomelos(
    title: 'Pomelos',
    description: 'The largest of all citrus fruits, closely related to the grapefruit but much sweeter and milder.',
    imagePath: 'assets/W4-assets/pomelo.jpg',
    startColor: Color(0xFFFFA674), 
    endColor: Color(0xFFFF6E3A),
  ),
  peach(
    title: 'Peach',
    description: 'A soft, fuzzy-skinned stone fruit that screams summer.',
    imagePath: 'assets/W4-assets/peach.jpg',
    startColor: Color(0xFFFFC5A3),
    endColor: Color(0xFFFFA375),  
  ),
  strawberry(
    title: 'Strawberry',
    description: 'A bright red, heart-shaped fruit loved all over the world.',
    imagePath: 'assets/W4-assets/stawberry.jpg',
    startColor: Color(0xFFF3634B), 
    endColor: Color(0xFFE53A27),   
  );

  final String title;
  final String description;
  final String imagePath;
  final Color startColor;
  final Color endColor;

  const Product({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.startColor,
    required this.endColor,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [product.startColor, product.endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Image.asset(
                product.imagePath,
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),

              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.white, 
                ),
              ),
              const SizedBox(height: 5),

              Text(
                product.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFffa2bb),
        appBar: AppBar(
          title: const Text(
            "Products", 
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          backgroundColor:  Colors.white,
         
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: const [
              ProductCard(product: Product.pomelos),
              SizedBox(height: 10),
              ProductCard(product: Product.peach),
              SizedBox(height: 10),
              ProductCard(product: Product.strawberry),
            ],
          ),
        ),
      ),
    ),
  );
}





