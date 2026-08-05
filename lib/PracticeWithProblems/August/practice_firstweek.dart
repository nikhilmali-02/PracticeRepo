void main() {
  List<String> employees = [
    'Alice-50000',
    'Bob-72000',
    'Charlie-45000',
    'Dave-91000',
    'Eve-38000',
  ];

  List<int> salaries = employees
      .map((employee) => int.parse(employee.split('-')[1]))
      .toList();
  print(salaries);

  int totalSalary = salaries.fold(0, (sum, salary) => sum + salary);
  print(totalSalary);

  List<String> highEarners = employees
      .where((employee) => int.parse(employee.split('-')[1]) > 50000)
      .map((employee) => employee.split('-')[0])
      .toList();
  print(highEarners);
}
