import 'package:flutter/material.dart';
import 'package:signin_with_google/Utils/app_style.dart';

class MyListview extends StatefulWidget {
  const MyListview({super.key});

  @override
  State<MyListview> createState() => _MyListviewState();
}

class _MyListviewState extends State<MyListview> {
  List<String> data = [
    // 'One',
    // 'Two',
    // 'Three',
    // 'Four',
    // 'Five',
    // 'Six',
    // 'Seven',
    // 'Eight',
    // 'Nine',
    // 'Ten',
    // 'eleven',
    // 'twelve',
    // 'thirteen'
  ];
  String text = '';
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return 
     ListView.builder(
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
                          value: isChecked,
                          onChanged: ((bool? value) {
                            setState(
                              () {
                                isChecked = value!;
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
                                        backgroundColor: AppStyle.purpleAccent),
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
      );
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppStyle.purpleAccent,
      //   elevation: 5,
      //   onPressed: () {
      //     setState(() {
      //       data.insert(0, (data.first));
      //       // data.removeLast();
      //     });
      //   },
      //   child:
      //       // Text("remove"),
      //       const Icon(Icons.add),
      // );
    
  }
}
