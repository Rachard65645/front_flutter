class ProductsModelSearch {
  final double price;
  final int quantity;
  final String description;

  ProductsModelSearch(
      {required this.price, required this.quantity, required this.description});
}

List<ProductsModelSearch> products = [
  ProductsModelSearch(price: 50.0, description: 'Tomate', quantity: 5),
  ProductsModelSearch(price: 30.0, description: 'Banane', quantity: 10),
  ProductsModelSearch(price: 100.0, description: 'Orange', quantity: 3),
  ProductsModelSearch(price: 150.0, description: 'Pomme', quantity: 7),
  ProductsModelSearch(price: 20.0, description: 'Poire', quantity: 4),
  ProductsModelSearch(price: 70.0, description: 'Ananas', quantity: 6),
  ProductsModelSearch(price: 60.0, description: 'Mangue', quantity: 9),
  ProductsModelSearch(price: 80.0, description: 'Fraise', quantity: 12),
  ProductsModelSearch(price: 40.0, description: 'Cerise', quantity: 8),
  ProductsModelSearch(price: 55.0, description: 'Pêche', quantity: 11),
  // Ajoute ici les autres éléments jusqu'à 100...
  ProductsModelSearch(price: 50.0, description: 'Citron', quantity: 13),
  ProductsModelSearch(price: 90.0, description: 'Papaye', quantity: 2),
  ProductsModelSearch(price: 110.0, description: 'Melon', quantity: 15),
  ProductsModelSearch(price: 200.0, description: 'Kiwi', quantity: 18),
  ProductsModelSearch(price: 10.0, description: 'Pastèque', quantity: 20),
];
