import 'package:contactlist/providers/contact_provider.dart';
import 'package:contactlist/screens/contact_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

   @override
   void initState() {
  //TODO: implement initState
     super.initState();
     getContact();
   }
  // getContact()async => await context.read<ContactProvider>().fetchContact();
   getContact()async => await context.read<ContactProvider>().fetchContact();

  
  @override
  Widget build(BuildContext context) {
    var contacts = Provider.of<ContactProvider>(context).apiContacts;

    return  SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20.0),
             // this renders the search input
        
        const  Padding(
            padding: EdgeInsets.only(left:25.0, right:25.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search contacts ...",
                suffixIcon: Icon(Icons.search_rounded),
              ),

        ),
          ),
        const  SizedBox(height: 10.0),

      Expanded(
          child: ListView(
            children:
            contacts.map((eachModel){
              return ListTile(
                leading: Image.asset("assets/images/add-user.png",height: 45.0,),
                    title:  Text(eachModel.name,style: const TextStyle(fontSize: 20.0),),
                    subtitle: Text(eachModel.phoneNumber),
                   trailing: const Icon(Icons.arrow_forward_ios_outlined),

              );
              
            }
            ).toList(),
        
            // this will render a list of contacts
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: contacts.length,
            //     itemBuilder: (context,index){
            //       return ListTile(
            //         onTap: () {
            //           Navigator.push(context,CupertinoPageRoute(builder: (context){
            //             return const ContactScreen();
        
            //           }));
            //         },
            //         contentPadding:const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
            //         leading: Image.asset("assets/images/add-user.png",height: 45.0,),
            //         title:  Text(contacts[index].name,style: const TextStyle(fontSize: 20.0),),
            //         subtitle: Text(contacts[index].phoneNumber),
            //         trailing: const Icon(Icons.arrow_forward_ios_outlined),
            //         // DropdownButton(
            //         //   items:const [
            //         //     DropdownMenuItem(child: Text("View Contacts")),
            //             // DropdownMenuItem(child: Text("Add Fav")),
            //           // ], 
            //           // onChanged: (value){}
                      
            //           );
            //       // );
            //     }
            //     ),
            // ),
          ),
        )],
        ),
        );
  }
}