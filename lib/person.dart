class People{
  String region = 'Indonesia';
  sayOurRegion(){
    print(region);
  }
}

class Person extends People {
  final String name;
  DateTime birthday;

  Person(this.name,this.birthday);

  int get age {
    var todayYear = DateTime.now().year;
    return todayYear - birthday.year;
  }

  set age (int value){
    var todayYear = DateTime.now().year;
    var birthYear = todayYear - value;
    birthday = DateTime(birthYear, birthday.month, birthday.day);
  }
}

void main(){
  var john = Person('john', DateTime.parse('1969-07-20'));
  var list = [1,4,5,6];
  var newList = list.map((e) => e * 2).toList();
  print(list);
  print(newList);

  print(john);
  print(john.name);
  print(john.age);
}