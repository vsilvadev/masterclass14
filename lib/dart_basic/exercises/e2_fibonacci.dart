/*
In mathematics, the Fibonacci sequence is a sequence of integers, 
usually starting with 0 and 1, in which each subsequent term is the sum 
of the previous two. The sequence was named after the Italian mathematician 
Leonardo of Pisa, better known as Fibonacci, who described the growth of a 
population of rabbits from this sequence in 1202. However, this sequence was 
already known in ancient times.
*/

void main() {
  print(fibonacci(initialValue: 2, returnSize: 10));
}

List<int> fibonacci({required int initialValue, required int returnSize}) {
  final List<int> fiboList = [initialValue, initialValue + 1];

  for (int i = 0; fiboList.length < returnSize; i++) {
    final listLength = fiboList.length;
    fiboList.add((fiboList[listLength - 2]) + (fiboList[listLength - 1]));
    i++;
  }

  return fiboList;
}
