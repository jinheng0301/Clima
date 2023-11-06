
void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);

  String result = "task 2 data";
  await Future.delayed(threeSeconds, () {
    print('Task 2 complete');
  });

  return result;
}
//asynchronous programming
//future, is something that will exist in the future.
//it's something that doesnt exist right now
//but after it's completed its thing, after it's gotten the image or downloaded the text, then your future will actually materialize into a real object.

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
