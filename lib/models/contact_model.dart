

class ContactModel{
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String website;
  final String address;

  final bool isFavorite;

  ContactModel({
    required this.id,
    required this.name, 
    required this.email, 
    required this.phoneNumber,
    required this.website,
    required this.address,
    this.isFavorite = false,
    });
    
}