void main() {
  final coffee = CoffeeMachine();
  final name=coffee;

  coffee.addCoffee(
    Coffee(
      coffeeType: "Coffee",
      price: 5000,
      amount: 100,
      amountOfMilk: 50,
      amountOfWater: 75,
    ),
  );
  coffee.addCoffee(
    Coffee(
      coffeeType: "latte",
      price: 4.178,
      amount: 100,
      amountOfMilk: 50,
      amountOfWater: 75,
    ),
  );
  coffee.addCoffee(
    Coffee(
      coffeeType: "Kappuchino",
      price: 720.00,
      amount: 100,
      amountOfMilk: 50,
      amountOfWater: 75,
    ),
  );
  coffee.addCoffee(
    Coffee(
      coffeeType: "Espresso",
      price: 50.000,
      amount: 100,
      amountOfMilk: 50,
      amountOfWater: 75,
    ),
  );
  coffee.addCoffee(
    Coffee(
      coffeeType: "Choy",
      price: 15.000,
      amount: 100,
      amountOfMilk: 50,
      amountOfWater: 75,
    ),
  );

  print("Narxi: ${coffee.price("Coffee")}");
  print(coffee.price("latte"));
  print(coffee.price("Makkaito"));
  print(coffee.price("Espresso"));
  print(coffee.price("Choy"));
  print(coffee.price("Kappuchino"));
}

class Coffee {
  final String coffeeType;
  final num price;
  final int amount;
  final int amountOfMilk;
  final int amountOfWater;

  const Coffee({
    required this.coffeeType,
    required this.price,
    required this.amount,
    required this.amountOfMilk,
    required this.amountOfWater,
  });
}

class CoffeeMachine {
  Map<String, Coffee> coffee = {};

  void addCoffee(Coffee coffees) {
    coffee[coffees.coffeeType.toLowerCase()] = coffees;
  }

  num price(String coffees) {
    final coffffee = coffee[coffees.toLowerCase()];
    return coffffee?.price ?? -1;
  }
}