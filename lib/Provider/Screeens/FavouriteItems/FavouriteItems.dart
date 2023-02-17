import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/providerExample/FavouriteExampleProvider.dart';
import 'package:provider/provider.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({super.key});

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  @override
  Widget build(BuildContext context) {
    final favitem = Provider.of<FavouriteExampleProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favourite"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteItem(),));
            }, 
            icon: Icon(Icons.favorite,color: Colors.red,)),
        ],
        ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favitem.selectedItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteExampleProvider>(
                  builder: (context, value, child) {
                  return ListTile(
                    onTap: (){
                      if (value.selectedItem.contains(index)) {
                        value.removeItem(index);
                      }else{
                        value.addItem(index);
                      }

                    },
                  title: Text("Item "+index.toString()),
                  trailing: Icon(value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_outline),
                );
                },);
          },)),
        ],
      ),
    );
  }
}