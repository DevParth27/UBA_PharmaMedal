// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class MedicinedItem {
  final String name;
  final String description;
  final String imagePath;
  final String price;

  MedicinedItem({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });
}

List<MedicinedItem> MedicinedItems = [
  MedicinedItem(
    name: 'ASOZEN-TH',
    price: '₹100 /-',
    imagePath: 'images/medicines/ASOZEN-TH.jpg',
    description:
        'Tablet is a combination medicine used in the treatment of pain due to muscle spasms',
  ),
  MedicinedItem(
    name: 'Dolo 650',
    price: '₹28.90 /-',
    imagePath: 'images/medicines/Dola 650.jpeg',
    description:
        'Headaches, mild to high fevers, and any other type of bodily aches',
  ),
  MedicinedItem(
    name: 'Sinarest',
    price: '₹99.98 /-',
    imagePath: 'images/medicines/sinarest.jpg',
    description:
        'To treat headache, fever, body aches, runny or stuffy nose, sneezing, itching, watery eyes',
  ),
  MedicinedItem(
    name: 'AMPICIX-500',
    price: '₹40 /-',
    imagePath: 'images/medicines/AMPICIX-500.jpg',
    description:
        'Treating bacterial infections of the lungs and airways, middle ear, sinuses, skin etc.',
  ),
];

void addMedicinedItemsToFirestore() async {
  // Access Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Loop through MedicinedItems list and add each item to Firestore
  for (var item in MedicinedItems) {
    try {
      // Add document to the "MedicinedItems" collection with item name as document ID
      await firestore.collection('MedicinedItems').doc(item.name).set({
        'name': item.name,
        'price': item.price,
        'description': item.description,
        'imagePath': item.imagePath,
      });

      print('Added ${item.name} to Firestore');
    } catch (e) {
      print('Error adding ${item.name} to Firestore: $e');
    }
  }
}

// Call the existing function to add the data
Future<void> addMedicinedItemsToFirestore2() async {
  // Access Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Loop through MedicinedItems list and add each item to Firestore
  for (var item in MedicinedItems) {
    try {
      // Add document to the "MedicinedItems" collection with item name as document ID
      await firestore.collection('MedicinedItems').doc(item.name).set({
        'name': item.name,
        'price': item.price,
        'description': item.description,
        'imagePath': item.imagePath,
      });

      print('Added ${item.name} to Firestore');
    } catch (e) {
      print('Error adding ${item.name} to Firestore: ');
    }
  }
}
