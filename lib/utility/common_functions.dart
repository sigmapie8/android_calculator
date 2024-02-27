class CommonFunctions {
  List<List<String>> splitList(List<String> originalList, int elementsPerSublist) {
    List<List<String>> resultList = [];
    for (int i = 0; i < originalList.length; i += elementsPerSublist) {
      int endIndex = i + elementsPerSublist;
      if (endIndex > originalList.length) {
        endIndex = originalList.length;
      }
      resultList.add(originalList.sublist(i, endIndex));
    }
    return resultList;
  }

  String getRelativeTime({required DateTime dateTime}) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays <= 7) {
      return '${difference.inDays} Days Ago';
    } else {
      int weeks = (difference.inDays / 7).floor();
      if (weeks == 1) {
        return '1st Week';
      } else {
        return '$weeks Weeks Ago';
      }
    }
  }
}