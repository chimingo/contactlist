import 'dart:convert';
import 'dart:io';

import 'package:contactlist/models/contact_model.dart';
import 'package:flutter/material.dart';
import'package:http/http.dart' as http;


class ContactProvider with ChangeNotifier{

// store contacts from the internet

  List<ContactModel> apiContact = [
    // ContactModel(id: 1, name: "name", email: "email", phoneNumber: "phoneNumber", 
    // website: "website", address: "address"),
  ];
  List<ContactModel> get apiContacts => apiContact;

  // store contacts to list of favorite
   List<ContactModel> favoriteContact = [];
     List<ContactModel> get favoriteContacts => favoriteContact;

     
      // method to fetch contacts from internet
     // @return null
   Future<void> fetchContact()async{
     try{
      final resp = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if(resp.statusCode ==200){
        
        // decode the response data

       final jsonData = jsonDecode(resp.body);
       // loop throught the data and store in apicontact list
       for (var data in jsonData ) {
        apiContact.add(ContactModel(
          id: data['id'],
           name: data['name'], 
           email: data['email'], 
           phoneNumber: data['phone'], 
           website: data['website'], 
           address: data['address']['city']+", " + data['address']['street']+ ","+ data['address']['suite']),
           );
         
       }
       print(apiContact);


      }else{
        print("could not fetch data from the internet");
      }

     }on SocketException{

// return a message that their is no internet access
     }
     notifyListeners();

   }
}