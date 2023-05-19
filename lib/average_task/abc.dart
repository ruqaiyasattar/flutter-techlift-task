import 'dart:collection';

void main() {
  LinkedHashMap<String, int> linkedHashMap = LinkedHashMap<String, int>();
  linkedHashMap['key1'] = 29;
  linkedHashMap['key2'] = 123;
  linkedHashMap['key3'] = 100;

  // Getting keys
  Iterable<String> keys = linkedHashMap.keys;
  print('Keys:');
  for (var key in keys) {
    print(key);
  }

  // Getting values
  Iterable<dynamic> values = linkedHashMap.values;
  print('\nValues:');
  for (var value in values) {
    print(value);
  }
}
