import 'package:flutter/material.dart';
import 'package:signin_with_google/Utils/app_style.dart';
import 'package:signin_with_google/Utils/string_manager.dart';

class MyListviewScreen extends StatefulWidget {
  const MyListviewScreen({super.key});

  @override
  State<MyListviewScreen> createState() => _MyListviewScreenState();
}

class _MyListviewScreenState extends State<MyListviewScreen> {
  List<String> data = [
    // 'hello', 'ashar', 'welcome', 'world'
  ];
  String text = '';
  List<bool> isChecked = [];
  // bool isChecked = false;
  TextEditingController title = TextEditingController();
  @override
  void initState() {
    super.initState();
    for (var element in data) {
      isChecked.add(false);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    title.dispose();
    super.dispose();
  }

  var indexHolder = [];

  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // void validate(){
  //   if(formkey.currentState!.validate()){
  //     // print("ok");
  //   }else{
  //     // print("Error");
  //   }
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.purpleAccent,
        // centerTitle: true,
        title: const Text(StringManager.listviewScreen),
        actions: [
          const Center(child: Text("Selected Items")),
          IconButton(
            onPressed: () {
              setState(() {
                for (var element in indexHolder) {
                  data.removeAt(element);
                  // print("data$data");
                }
                indexHolder.clear();
                // print(indexHolder);
                // print(isChecked);
                for (var element in data) {
                  isChecked.remove(true);
                }
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
            if (formkey.currentState!.validate()) {
              String title1 = title.text;
              data.insert(0, (title1));
              isChecked.add(false);
            }
            title.clear();
            // MyTextFormFeild();

            // data.removeLast();

            // print("hello$data isChecked$isChecked");
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
                                      //     indexHolder.add(index);
                                      //   }
                                      // }
                                      // );
                                      // isChecked = value! as List<bool>;
                                      isChecked[index] = !isChecked[index];
                                      if (isChecked[index] == true) {
                                        indexHolder.add(index);
                                        // print(indexHolder);
                                      } else {
                                        indexHolder.remove(index);
                                        // print(indexHolder);
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
                                    // indexHolder.removeAt(index);

                                    // print("data$data");
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
              child: Form(
                key: formkey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  maxLines: null,
                  autocorrect: true,
                  controller: title,
                  decoration:
                      const InputDecoration(hintText: "Content of the list "),
                ),
              ),
            ),
            // MyTextFormFeild(),
            // MyListview(),
          ],
        ),
      ),
    );
  }
}
