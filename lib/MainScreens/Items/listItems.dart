import 'package:flutter/material.dart';
import 'package:shopping_list/Models/Item.dart';
import 'package:shopping_list/Widgets/components/buttons/myBackButton.dart';
import 'package:shopping_list/Widgets/components/containers/containerShape01.dart';

class ListItems extends StatefulWidget {
  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  Future<List<Item>> _getItems() async {
    List<Item> items = [];
    Item item = Item('Marca', 'Nombre', 12);
    Item item2 = Item('Marca', 'Nombre', 12);

    items.add(item);
    items.add(item2);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      ContainerShape01(),
      Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 120, left: 15),
        child: FutureBuilder(
          future: _getItems(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('loading...'),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    title: Text(snapshot.data[index].marca,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    subtitle: Text(snapshot.data[index].nombre),
                  );
                },
              );
            }
          },
        ),
      ),
      Positioned(top: height * .025, child: MyBackButton()),
    ])));
  }
}
