import 'package:flutter/material.dart';
import 'package:signin_with_google/Utils/app_style.dart';
import 'package:signin_with_google/Utils/string_manager.dart';

class MyListviewScreen extends StatefulWidget {
  const MyListviewScreen({super.key});

  @override
  State<MyListviewScreen> createState() => _MyListviewScreenState();
}

class _MyListviewScreenState extends State<MyListviewScreen> {
  List<String> data = ['hello', 'ashar', 'welcome', 'world'];
  String text = '';
  List<bool> isChecked = [false];
  // bool isChecked = false;
  TextEditingController title = TextEditingController();

  @override
  void initState() {
    super.initState();
    data.forEach((element) {
      isChecked.add(false);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    title.dispose();
    super.dispose();
  }

  var placeHolder = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.purpleAccent,
        // centerTitle: true,
        title: const Text(StringManager.listviewScreen),
        actions: [
          Center(child: const Text("Selected Items")),
          IconButton(
            onPressed: () {
              setState(() {
                print(placeHolder);
                placeHolder.forEach((element) {data.removeAt(element);
                  
                
                });
                
              });
            },
            icon: const Icon(Icons.delete),
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.purpleAccent,
        elevation: 5,
        onPressed: () {
          setState(() {
            String title1 = title.text;
            data.insert(0, (title1));
            isChecked.add(false);
            // data.removeLast();
          });
        },
        child:
            // Text("remove"),
            const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: ((context, index) {
                return Card(
                  elevation: 5,
                  color: AppStyle.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(data[index]),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            Expanded(
                              child: Checkbox(
                                value: isChecked[index],
                                onChanged: ((bool? value) {
                                  setState(
                                    () {
                                    
                                      // List.forEach((element){
                                      //   if(value== true){
                                      //     placeHolder.add(index);
                                      //   }
                                      // }
                                      // );
                                      // isChecked = value! as List<bool>;
                                      isChecked[index] = !isChecked[index];
                                        if(isChecked[index]) {
                                          placeHolder.add(index);
                                          print(placeHolder);
                                        } else {
                                          placeHolder.remove(index);
                                          print(placeHolder);
                                        }
                                    },
                                  );
                                }),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => SimpleDialog(
                                      children: [
                                        TextField(
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                text = value;
                                              },
                                            );
                                          },
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppStyle.purpleAccent),
                                          onPressed: () {
                                            setState(() {
                                              data[index] = text;
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: const Text("update"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    data.removeAt(index);
                                  });
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: null,
                autocorrect: true,
                controller: title,
                decoration:
                    const InputDecoration(hintText: "Content of the list "),
              ),
            ),
            // MyListview(),
          ],
        ),
      ),
    );
  }
}
