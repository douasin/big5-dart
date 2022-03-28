# big5-dart

This package provides encode, decode method for big5.

## Usage

To use this plugin, add `big5` to your package's pubspec.yaml file
```dart
    Big5.encode('word');
    Big5.decode([119, 111, 114, 100]);

```

or

Override [compareTo] function on your Model.
Can be compare directly.

```dart
class Item extends Comparable<Item> {
  Item({
    required this.index,
    required this.name,
  });

  final int index;
  final String name;

  @override
  int compareTo(Item other) {
    return Big5.compare(name, other.name);
  }
}

/// can use sort or reduce..
final List<Item> list = [];
//list.sort();
```


stream version and encode method is ongoing.

## The newer version is fixed by @abc873693
