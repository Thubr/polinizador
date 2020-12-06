import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/product.dart';

class Fixtures {
  static final stores = {
    Marker(
      markerId: MarkerId('A'),
      position: LatLng(-23.552372, -46.632810),
      infoWindow: InfoWindow(title: 'Loja A'),
    ),
    Marker(
      markerId: MarkerId('B'),
      position: LatLng(-23.547615, -46.634756),
      infoWindow: InfoWindow(title: 'Loja B'),
    ),
    Marker(
      markerId: MarkerId('C'),
      position: LatLng(-23.552179, -46.647751),
      infoWindow: InfoWindow(title: 'Loja C'),
    ),
    Marker(
      markerId: MarkerId('D'),
      position: LatLng(-23.584935, -46.688341),
      infoWindow: InfoWindow(title: 'Loja D'),
    ),
  };

  static final products = [
    Product(
      id: '1',
      name: 'Fritadeira elétrica',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis mi orci, vitae ultricies justo sollicitudin sit amet. Pellentesque nec velit varius, accumsan tellus vel, elementum lectus. Fusce vestibulum lorem nec fermentum cursus. Pellentesque vulputate odio nec diam tempor sagittis. Sed suscipit tellus at purus elementum tempus id eu augue.',
      price: 1100.99,
      imageUrl: 'https://cdn.awsli.com.br/600x700/525/525768/produto/38110721/e31fbbfcea.jpg',
    ),
    Product(
      id: '2',
      name: 'Tênis',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis mi orci, vitae ultricies justo sollicitudin sit amet. Pellentesque nec velit varius, accumsan tellus vel, elementum lectus. Fusce vestibulum lorem nec fermentum cursus. Pellentesque vulputate odio nec diam tempor sagittis. Sed suscipit tellus at purus elementum tempus id eu augue.',
      price: 299.99,
      imageUrl: 'https://imgcentauro-a.akamaihd.net/500x500/M02ZFU02/tenis-feminino-preto-torani-com-glitter-img.jpg',
    ),
    Product(
      id: '3',
      name: 'Mouse Wireless',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis mi orci, vitae ultricies justo sollicitudin sit amet. Pellentesque nec velit varius, accumsan tellus vel, elementum lectus. Fusce vestibulum lorem nec fermentum cursus. Pellentesque vulputate odio nec diam tempor sagittis. Sed suscipit tellus at purus elementum tempus id eu augue.',
      price: 59.99,
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/714DLyidIBL._AC_SL1500_.jpg',
    ),
  ];
}
