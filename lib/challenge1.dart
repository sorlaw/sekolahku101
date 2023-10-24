void main(){
  print("test");
  var myNumber = 4423;
  var myArray = ["agus","dudung","asep"];
  var myObject = {
    'name': 'agus',
    'age': 19
  };
  var myWord = 'hello world';
  var myBool = true;
  myWord = 'halo dunia';
  var sapi = Cow();
  print(sapi.suara());
  print(sapi.energi);
  sapi.makan();
  sapi.makan();
  sapi.jalan();
  print(sapi.energi);
  // print(myWord);

  List humanName(){
    return ["halo","negara","indonesia"];
  }

  Map animal(){
    return {
      'kaki': 4,
      'isMamalia': true
    };
  }

 

  // print(animal());

  // print(humanName());

  bool isLegal(int age){
    if (age >= 18) {
      return true;
    }
    return false;
  }
  // print(isLegal(15));
}

class Mamalia {
  int energi = 100;
  int jumlah_kaki;
  Mamalia(this.jumlah_kaki);

  void makan(){
    energi += 20;
  }

  void jalan(){
    energi -= 40;
  }

  String suara(){
    return "Moo";
  }
}

class Cow extends Mamalia{
  Cow() : super(4);
  
  @override
  String suara(){
    return "MOOOOO";
  }

}