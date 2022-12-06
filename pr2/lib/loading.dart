import 'dart:async';

Future<void> createOrder() async {
  try {
    print("Fetching Users....");
    var order = await fetchUsers();
    print("Your Order is : $order");
  } catch (e) {
    print("Caught Error : $e");
  }
}

Future<String> fetchUsers() {
  var str =
      Future.delayed(Duration(seconds: 4), () => throw "Cannot Fetch Users");
  return str;
}
