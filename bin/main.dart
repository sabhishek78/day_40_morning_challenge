// Challenge
// Find the best move given the state of Towers of Hanoi board
List<List<List<int>>> result = [];

List<List<List<int>>> possibleMoves(List<List<int>> inputList) {
  for (int i = 0; i < inputList.length; i++) {
    for (int j = 0; j < inputList.length; j++) {
      if (validMove(inputList, i, j)) {
        List<List<int>> copyOfInputList = [];
        makeCopy(inputList, copyOfInputList);
        makeMove(copyOfInputList, i, j);
      }
    }
  }
  return result;
}

validMove(List<List<int>> inputList, int i, int j) {
  if (inputList[i].isEmpty) {
    return false;
  } else if (inputList[j].isEmpty) {
    return true;
  } else if (inputList[i][0] < inputList[j][0]) {
    return true;
  } else {
    return false;
  }
}

makeCopy(List<List<int>> inputList, List<List<int>> copyOfInputList) {
  for (int i = 0; i < inputList.length; i++) {
    List<int> temp = List.from(inputList[i]);
    copyOfInputList.add(temp);
  }
}

makeMove(List<List<int>> copyOfInputList, int i, int j) {
  copyOfInputList[j].insert(0, copyOfInputList[i][0]);
  copyOfInputList[i].removeAt(0);

  result.add(copyOfInputList);
}

List flattenList(List inputList, List outputList) {
  for (int i = 0; i < inputList.length; i++) {
    dynamic element = inputList[i];

    if (element is List) {
      flattenList(element, outputList);
    } else if (element is Function) {
      dynamic functionResult = element();

      if (functionResult is List) {
        flattenList(functionResult, outputList);
      } else {
        outputList.add(functionResult);
      }
      //outputList.add(inputList[i]());

    } else {
      outputList.add(element);
    }
  }
  return outputList;
}

main() {
  // print(possibleMoves([[1],[2],[3,4]]));
  // print(bestMove([[],[1],[2,3,4]]));
  print(bestOneMoveToWin([
    [],
    [1],
    [2, 3, 4]
  ]));
  print(bestTwoMoveToWin([
    [2],
    [1],
    [3, 4]
  ]));
  // print(bestMove([[1],[],[2,3,4]]));
}

List<List<int>> bestOneMoveToWin(List<List<int>> inputList) {
  List<List<List<int>>> listOfPossibleMoves = possibleMoves(inputList);
  print(listOfPossibleMoves);
  for (int i = 0; i < listOfPossibleMoves.length; i++) {
    if (checkWin(listOfPossibleMoves[i])) {
      return listOfPossibleMoves[i];
    }
  }
}

bool checkWin(List<List<int>> inputList) {
  if ((inputList[0].isEmpty) && (inputList[1].isEmpty)) {
    return true;
  } else {
    return false;
  }
}

List<List<int>> bestTwoMoveToWin(List<List<int>> inputList) {
  List<List<List<int>>> listOfPossibleMoves = possibleMoves(inputList);
  for (int i = 0; i < listOfPossibleMoves.length; i++) {
    return bestOneMoveToWin(listOfPossibleMoves[i]);
  }
}

List<List<int>> bestNMoveToWin(List<List<int>> inputList) {
  List<List<List<int>>> listOfPossibleMoves = possibleMoves(inputList);
  for (int i = 0; i < listOfPossibleMoves.length; i++) {
    return bestNMoveToWin(listOfPossibleMoves[i]);
  }
}