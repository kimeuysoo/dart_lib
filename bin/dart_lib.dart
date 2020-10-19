// import 'package:dart_lib/dart_lib.dart' as dart_lib;
// import 'person.dart';
import 'dart:math';

enum EnumData { a, b, c }

void main(List<String> arguments) {
  // 1.주석종류
  //이거주석
  ///이것도주석
  /*
   * 이것도 주석
   */

  // 2.변수 타입 자료형
  int a = 1;
  double b = 2.0;
  num c = 1; //num 안에 int, double가 포함 된다.
  String d = 'd';
  bool e = false;
  print('$a / $b / $c / $d / $e'); // 1 / 2 / 1 / d / false

  // 3.타입추론... 대충 다 var로 통일해도 된다..;;
  var a3 = 1;
  var b3 = 2.0;
  var c3 = 1; //num 안에 int, double가 포함 된다.
  var d3 = 'd';
  var e3 = false;
  print('$a3 / $b3 / $c3 / $d3 / $e3'); // 1 / 2 / 1 / d / false

  // 4.try-catch, try-on
  //차이점은? 글쎄... 특정 Exception만 잡을때 ON을 사용하는거?
  int a4 = 12;
  int b4 = 0;
  int c4;

  try {
    c4 = a4 ~/ b4; // ~/ 절단분할 연산자 : a4 / b4.truncate().toInt() 와 동일.
  } on IntegerDivisionByZeroException {
    print('0으로 나눌 수 없는 수다.'); //0으로 나눌 수 없는 수다.
  }

  try {
    c4 = a4 ~/ b4;
  } catch (e) {
    print(e);
    //IntegerDivisionByZeroException
  }

  try {
    c4 = a4 ~/ b4; // ~/ 절단분할 연산자 : a4 / b4.truncate().toInt() 와 동일.
  } on Exception catch (e) {
    print('0으로 나눌 수 없는 수다. : ' + e.toString());
    //0으로 나눌 수 없는 수다. : IntegerDivisionByZeroException
  }

  // 5.final const
  //final은 변치않음. 변수나 함수의 상수화
  final String a5 = '변치않아';
  //a5 = '변하면에러'; //Error: Can't assign to the final variable 'a5'.
  const String b5 = '나도';
  //b5 = '변하면에러'; //Error: Can't assign to the const variable 'b5'.
  print('$a5 / $b5');

  // 6.산술연산자
  var a6 = (2 + 3 == 5);
  var b6 = (5 - 2 == 3);
  var c6 = (3 * 5 == 15);
  var d6 = (5 / 2 == 2.5);
  var e6 = (5 ~/ 2 == 2); //결과값을 truncate() toInt() 사용 한 것과 동일
  var f6 = (5 % 2 == 1);
  print('$a6 / $b6 / $c6 / $d6 / $e6 / $f6');
  //true / true / true / true / true / true

  // 7.증감/비교/논리 연산자
  //++ -- == != > < >= <= && || ! 타언어와 다를 것 없어서 패스

  // 8.타입검사 is, is!
  int a8 = 10;
  print('${a8 is int} / ${a8 is! int}'); //true / false

  // 9.형변환 parse as toString...
  int a9 = 100;
  num b9 = a9 as num; //더 큰개념으로 형변환 가능 num > int,double...
  String c9 = '100';
  num d9 = num.parse(c9);
  int e9 = int.parse(c9);
  double f9 = double.parse(c9);
  num g9 = 3.14159;
  String h9 = g9.toString();
  String i9 = g9.toStringAsFixed(2);
  print('$a9 / $b9 / $c9 / $d9 / $e9 / $f9 / $g9 / $h9 / $i9');
  //100 / 100 / 100 / 100 / 100 / 100.0 / 3.14159 / 3.14159 / 3.14

  // 10.함수(=메서드) 익명함수 람다식 선택매개변수
  // class밖의 main함수 같은 넘은 최상위 함수로 어디서든 접근 가능.
  print('${af10(5)}'); //5
  bf10(); //void~
  // () {}  익명 함수라는 것도 존재한다.
  Function a10 = cf10();
  a10('함수'); //함수 / 익명함수
  // 람다식으로 함수를 간단히 적을 수도 있다.
  Function b10 = df10();
  b10('함수'); //함수 / 람다함수
  //함수의 매개변수에는 필수로 안넣어도 되는게 있다. {}안의 녀석들.
  print(ef10('필수'));
  print(ef10('필수', p2: '선택1'));
  print(ef10('필수', p2: '선택1', p3: '선택2'));

  // 11.static 전역변수
  globalStr += ' -> 응!';
  print(globalStr);
  print(A11.a11(globalStr)); //static는 바로 접근
  B11 b11 = new B11();
  print(b11.b11(globalStr)); //static가 아닌경우 인스턴스 생성후 접근
  print(B11().b11(globalStr)); //Dart는 모든걸 생략 가능하게 해준다.

  // 12.if else ?3항연산 패스.. switch case enum  for each 확인
  //enum EnumData { a, b, c } << enum열거형 정의법이 특이함.
  //중요한건 enum으로 정의 된 내용을 switch문에 사용시, 모든 내용을 다 정의해줘야한다.
  var a12 = EnumData.a;
  switch (a12) {
    case EnumData.a:
      print('switch case : ' + a12.toString());
      //switch case : EnumData.a
      break;
    case EnumData.b:
      break;
    case EnumData.c:
      break;
  }
  final b12 = [1, 2];
  //아래 모두 똑같이 1 2 가 출력된다.
  b12.forEach(print);
  b12.forEach((element) => print(element));
  b12.forEach((element) {
    print(element);
  });

  // 13.class 특이점
  //var person = new Person(); << 객체 생성시, new 키워드 생략 가능
  //접근지정자 private 변수는 _age와 같이 _로 시작하게 만든다. >> 그런데 왜 접근되냐? 이상하네..
  //The setter '_age' isn't defined for the type 'Person'. 외부클래스를 import한경우에는 에러남.
  //내부 클래스의 경우, 다 접근 가능한듯...
  var a13 = Person();
  a13.name = 'BGOM';
  a13._age = 10;
  print('${a13.name} / ${a13._age} / ${a13._name()}');

  // 14.getter setter
  //private 변수의 접근을 위한 용도도 있고, 내부계산을 위한 용도도 있다.
  var a14 = Rectangle(10, 10);
  print(
      'left:${a14.left} / right:${a14.right} / top:${a14.top} / bottom:${a14.bottom} / width:${a14.width} / heigth:${a14.heigth}');
  //left:10 / right:20 / top:10 / bottom:0 / width:10 / heigth:10
  a14.right = 10;
  a14.bottom = 10;
  print(
      'left:${a14.left} / right:${a14.right} / top:${a14.top} / bottom:${a14.bottom} / width:${a14.width} / heigth:${a14.heigth}');
  //left:0 / right:10 / top:20 / bottom:10 / width:10 / heigth:10

  // 15.상속 hero @override 어노테이션의 사용
  var a15 = Hero();
  a15.run();
  //영웅 이 뛴다.
  var b15 = SuperHero();
  b15.run();
  //슈퍼영웅 이 뛴다.
  //슈퍼영웅 이 난다.

  // 16.추상클래스 abstract / implements
  //상속시 무조건 구현을 해야한다.
  //abstract class Monster{
  //  void attack(); //미구현부분
  //}
  //
  //class Goblin implements Monster{...}

  // 17. with 키워드를 사용하는 mixin
  //아래 DarkGoblin은 Monster이자 Goblin이고 Hero가 된다.
  //class DarkGoblin extends Goblin with Hero{...}

  // 18. List Map Set 컬렉션
  //LIST는 [] SET은 {} SET은 중복이 제거 된다.
  List<String> a18 = ['A', 'B', 'C']; //var 타입추론가능
  print('${a18[0]} / ${a18[1]} / ${a18[2]}'); //A / B / C
  var b18 = ['A', 'B', 12345]; //dynamic 타입
  print('${b18[0]} / ${b18[1]} / ${b18[2]}'); //A / B / 12345
  var c18 = [1, ...a18]; //스프레드연산자 ...
  print('${c18[0]} / ${c18[1]} / ${c18[2]} / ${c18[3]}'); //1 / A / B / C
  Set<String> d18 = {'A', 'B', 'C', 'D'};
  print('${d18}'); //{A, B, C, D}
  var e18 = {'A', 'B', 12345}; //dynamic 타입
  print(
      '${e18.elementAt(0)} / ${e18.elementAt(1)} / ${e18.elementAt(2)}'); //A / B / 12345
  var f18 = {'A', 'B', 'C', ...e18}; //스프레드연산자 ...
  f18.addAll(d18);
  print('${f18}'); //{A, B, C, 12345, D}
  f18.remove('A');
  print('${f18} / ${f18.contains('A')}'); //{B, C, 12345, D} / false
  Map<String, String> g18 = {'A': 'aa', 'B': 'BB', 'C': 'CC'};
  print(g18); //{A: aa, B: BB, C: CC}
  g18['A'] = 'AA';
  print(g18); //{A: AA, B: BB, C: CC}

  // 19. Function(함수)의 객체 사용 >> 객체지향 + 함수형
  //where의 사용
  //짝수를 출력하는경우, 2줄로 적용가능하다. 함수형 프로그래밍이라서 가능.
  final a19 = [1, 2, 3, 4, 5];
  a19.where((e) => e % 2 == 0).forEach(print); // 2 4
  //map의 사용
  a19.where((e) => e % 2 == 0).forEach((e) {
    print('숫자 $e');
  });
  a19.where((e) => e % 2 == 0).map((e) => '숫자 $e').forEach(print);
  //toList, toSet의 사용
  //짝수를 결과 LIST에 담는경우.
  final b19 = a19.where((e) => e % 2 == 0).toList();
  print(b19); // [2, 4]
  final c19 = a19.where((e) => e % 2 == 0).toSet().toList(); // [2, 4]
  //any의 사용
  //해당 조건을 만족하는 넘이 있는지?
  print(a19.any((e) => e % 2 == 0)); // true
  //reduce의 사용
  //반복된 비교 분석
  print(a19.reduce((v, e) => max(v, e))); // 5
  print(a19.reduce(max)); // 5

  // 20. 계단식 표기법 ..
  final a20 = [1, 2, 3, 4, 5];
  a20.add(6);
  a20.remove(2);
  print(a20
    ..add(7)
    ..remove(3)); // [1, 4, 5, 6, 7]

  // 21. 컬렉션 if, for
  bool a21 = false;
  print([1, 2, 3, 4, 5, if (a21) 6]);
  final b21 = [1, 2, 3];
  print(['#0', for (var i in b21) '#$i']); // [#0, #1, #2, #3]

  // 22. null처리
  //Dart에서 모든 것이 객체.. 객체는 모두 null을 가질 수 있다.
  String a22 = null;
  print(a22?.length); // 에러 대신 null이 반환된다.
  print(a22?.length ?? 0); // null이면 0을 반환하라.

  //Dart문법 끝
}

// 10.함수------------------------------------------START
int af10(int p1) {
  return p1;
}

void bf10() {
  print('void~');
}

Function cf10() {
  return (p1) {
    print('$p1 / 익명함수');
  };
}

Function df10() {
  return (p1) => print('$p1 / 람다함수');
}

ef10(String p1, {String p2, String p3}) => '$p1 / $p2 / $p3';

// 10.함수------------------------------------------END
// 11.static 전역변수-------------------------------START
String globalStr = '전역변수인가?';

class A11 {
  static String a11(String p1) {
    return p1 + ' / 전역함수다.';
  }
}

class B11 {
  String b11(String p1) {
    return p1 + ' / 전역함수다.';
  }
}

// 11.static 전역변수-------------------------------END
// 13.class ---------------------------------------START
class Person {
  String name;
  int _age; //private 변수명의 앞 _

  // Person({this.name, this._age}); //사용자 정의 생성자 _ private 변수는 사용 불가

  String _name() {
    return name;
  }
}

// 13.class ---------------------------------------END
// 14.getter setter--------------------------------START
class Rectangle {
  num left, top, width, heigth;

  Rectangle(this.left, this.top, {this.width = 10, this.heigth = 10});

  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top - heigth;
  set bottom(num value) => top = value + heigth;
}

// 14.getter setter--------------------------------END
// 15.상속 ----------------------------------------START
class Hero {
  String name = '영웅';
  void run() {
    print('$name 이 뛴다.');
  }
}

class SuperHero extends Hero {
  @override
  void run() {
    super.name = '슈퍼' + super.name;
    super.run();
    fly();
  }

  void fly() {
    print('${super.name} 이 난다.');
  }
}
// 15.상속 ----------------------------------------END
