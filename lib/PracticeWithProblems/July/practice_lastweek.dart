//interview question
// void main(){
//   List<String> data = ['apple', 'orange', 'mango' ,'grapes', 'melon', 'lichee', 'cherry',  'lemon', 'banana'];
//   List<String> data1 = ['one', 'two', 'mango' ,'hello', 'world', 'melon'];
//   data.sort();
//   data1.sort();
//   List<String> commonValues = data.toSet().intersection(data1.toSet()).toList();
//   print(commonValues);
// }

//sorting a list of integers in descending order and filtering out values greater than 4 using the where
// method.
// void main(){
//   List<int> nums = [5, 3, 8, 1, 9, 2, 7];
//   nums.sort((a,b)=> b-a);
//   print("list in descending order ""$nums");

//   List<int> moreThanFour = nums.where((item) => item > 4 ).toList();
//   print("List of Greater than 4 ""$moreThanFour");
// }

//finding common values between two lists of integers using the intersection method of sets.
// void main(){
//   List<int> nums = [5, 3, 8, 1, 9, 2, 7];
//   List<int> nums1 = [8, 2, 7, 100, 200];

//   List<int> commonNums = nums.toSet().intersection(nums1.toSet()).toList();
//   print("Common Values are ""$commonNums");
//  }

//finding the longest word in a list of strings using the sort method and filtering out words
// with length greater than 4 using the where method.
// void main(){
//   List<String> words = ['apple', 'banana', 'kiwi', 'fig', 'mango', 'grape'];
//    words.sort((a,b)=> b.length-a.length);
//   print(words[0]);
//   List moreThanFour = words.where((item) => item.length > 4).toList();
//   print (moreThanFour);
// }

//fold method is used to calculate the total price of a list of prices.
//It takes an initial value (0 in this case) and a function that defines how to combine each element
// with the accumulated value, effectively reducing the list to a single value, which is the total price.

// void main(){
//   List<int> prices = [250, 100, 75, 500, 30];
//   List<double> discountedPrices = prices.map((price) => price * 0.9).toList();
//   print("Discounted Prices are ""$discountedPrices");
//   int totalPrice = prices.fold(0,(sum,price) => sum + price);
//   print("Total Price is ""$totalPrice");
// }

//map method is used to transform each element of a list into a new value based on a provided function.
// It takes a function that defines how to transform each element and returns a new list containing the
// transformed values.

// void main(){
//   List<String> names = ['john', 'MARY', 'alice', 'BOB'];

//   List<String> uppercaseNames = names.map((name) => name.toUpperCase()).toList();
//   print(uppercaseNames);

//   List<int> namesLength = names.map((name) => name.length).toList();
//   print(namesLength);
// }

//reduce method is used to find the largest number in a list of integers. It takes a function that compares two elements and returns the larger one, effectively reducing the list to a single value, which is the largest number.
// void main() {
//   List<int> nums = [12, 45, 3, 89, 27, 6];
//   int largestNum = nums.reduce((a, b) => a < b ? b : a);
//   print(largestNum);
// }

void main() {
  List<int> nums = [1, 2, 3];
  List<int> expandedNums = nums.expand((x) => List.filled(x, x)).toList();
  print(expandedNums);
}
