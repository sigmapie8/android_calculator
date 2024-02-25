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
}
