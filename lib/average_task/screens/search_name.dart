import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:techlift_flutter/average_task/model/Name.dart';

class SearchNames extends HookWidget {
  const SearchNames({Key? key}) : super(key: key);

  Future<List<Name>> fetchNames() async {
    // Simulating an API call to fetch names
    await Future.delayed(const Duration(seconds: 1));

    List<Name> names = [
      Name('Mehtab', 24),
      Name('Zulqarnain', 22),
      Name('Faizan Ali', 21),
      Name('Nazim', 28),
      Name('Rahil', 23),
      Name('Zohaib Amjad', 21),
      Name('Waqas', 27),
      Name('Laiba', 22),
    ];

    return names;
  }

  ///async* keyword, indicating that it's an asynchronous generator function.
  ///It means that it can pause execution and yield multiple values over time.
  Stream<List<Name>> filterNames(String searchText) async* {
    final names = await fetchNames();

    if (searchText.isEmpty) {
      //if it's empty there no text provided,so entire names list will be yeild from the future func
      //yield keyword pauses the execution of the function and emits a value to the stream.
      yield names;
    } else {
      /// filter the names list based on the search text. The where method is used to
      /// filter the list by iterating over each item and checking
      /// if the lowercase version of its name contains the
      /// lowercase version of the searchText.
      final filteredItems = names
          .where((eachItem) =>
          eachItem.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      yield filteredItems;
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    final searchName = useState<String>(searchController.text);

    final searchResultsNameStream = useMemoized(() => filterNames(searchName.value), [searchName.value]);

    /// The useEffect hook is called with a callback function as its first argument.
    /// This callback function will be executed when certain dependencies change.

    useEffect(() {
      searchName.value = searchController.text;
      return null;
    },
        ///This means that the callback function inside useEffect will be executed only
        /// when the value of searchController.text changes.
        /// If the value remains the same, the callback function will not be invoked.
        [searchController.text]);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              searchName.value = value;
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        Expanded(
          ///StreamBuilder is used to asynchronously build and
          ///update Flutter widgets based on the latest data from a stream.

          child: StreamBuilder<List<Name>>(
         /// This specifies the stream to which the StreamBuilder should listen for updates.
            stream: searchResultsNameStream,

            ///This is a callback function that takes two parameters: context and snapshot.
            ///The snapshot parameter contains the latest asynchronous data from the stream.

            builder: (context, snapshot) {
              //If snapshot.hasData is true,
              //it means that the stream has emitted new data.
              if (snapshot.hasData) {

                final items = snapshot.data;

                return ListView.builder(

                  itemCount: items!.length,

                  itemBuilder: (context, index) {

                    final item = items[index];

                    return ListTile(

                      title: Text(item.name),

                    );
                    },
                );
                //If snapshot.hasError is true,
                // it means that an error occurred while processing the stream.

              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
                //If none of the above conditions are met, it means that the stream is still loading and not data returns
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}