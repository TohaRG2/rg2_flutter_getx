import 'package:rg2_flutter_getx/models/phases.dart';

class Main3x3 implements Phase {
  @override
  int count = main3x3_title.length;

  @override
  String phase = "MAIN3X3";

  @override
  List<String> titles() => main3x3_title;

  @override
  List<String> icons() => main3x3_icon;

  @override
  List<String> descriptions() => main3x3_descr;

  @override
  List<String> urls() => main3x3_url;

  @override
  List<String> comments() => main3x3_comment;

  ///==================================================

  static const main3x3_title = [
    "С чего начать и как учить?",
    "Метод для начинающих от Антона Розова (10+)",
    "Метод для начинающих от Максима Чечнева (7+)",
    "Собираем кубик быстро (Фридрих (CFOP), ROUX)",
    "Сборка вслепую (Blind)",
    "Узоры на кубике",
  ];

  static const main3x3_icon = [
    "assets/images/main3x3/main_1.png",
    "assets/images/main3x3/main_2.png",
    "assets/images/main3x3/main_3.png",
    "assets/images/main3x3/main_4.png",
    "assets/images/main3x3/main_5.png",
    "assets/images/main3x3/main_6.png",
  ];

  static const main3x3_descr = [
    recomendation_descr,
    main3x3_st2_descr,
    main3x3_st3_descr,
    main3x3_st4_descr,
    main3x3_st5_descr,
    main3x3_st6_descr,
  ];

  static const main3x3_url = [
    "",
    "submenu",
    "submenu",
    "submenu",
    "submenu",
    "submenu",
  ];

  static const main3x3_st1_descr = "RECOMEND";
  static const main3x3_st2_descr = "ROZOV";
  static const main3x3_st3_descr = "BEGIN";
  static const main3x3_st4_descr = "G2F";
  static const main3x3_st5_descr = "BLIND";
  static const main3x3_st6_descr = "PATTERNS";

  static const main3x3_comment = [
    recomendation_comment,
    "",
    "",
    "",
    "",
    "",
  ];

  static const recomendation_descr = """
    <p>Начать стоит с основной \"фишки\" программы - возможности не только прочитать
    о какой-то головоломке, но и посмотреть нужный момент в видео, если вам что-то непонятно из
    текста. Например, вы видите в тексте слово <a href="rg2://ytplay?time=0:41&link=QJ8-8l9dQ_U">\"Алгоритм\"</a>,
    которое выделено цветом. Значит можно по нему щелкнуть и посмотреть в видео именно тот
    момент, как выполнять данный алгоритм. А если вы нажмете в видео кнопку \"<b>|&lt</b>\", то сможете
    повторить видео еще раз, с того момента, с которого начали его смотреть.</p>

    <p>Не стесняйтесь смотреть видео, т.к. многие моменты в сборке кубика довольно трудно передать
    словами, в то время, как в видео это очень просто показать и объяснить. С другой стороны,
    если вам нужно всего лишь немного вспомнить формулу для алгоритма, то ее гораздо быстрее можно
    найти именно в тексте, чем в видео.</p>
  
    <p>Если вы забыли как выполняется то или иное вращение, нажмите большую зеленую кнопку в
    нижней части экрана и найдите нужное вращение в открывшемся окне.</p>
  
    <p>Еще одной особенностью программы является использование
    <a href="rg2://ytplay?time=8:36&link=u1CA_35lRAI">языка вращений</a> Максима Чечнева, который позволяет запоминать
    алгоритмы, составляя для них ассоциативные ряды. Основные понятия (движения) этого метода:<br/>
    <a href="rg2://ytplay?time=11:15&link=8VCsFNFa5yM"><b>\"Лондон\"</b></a> - передняя грань, причем
    \"В Лондон\" вращение передней грани по часовой стрелке, а \"из Лондона\" - против часовой.<br/>
    <a href="rg2://ytplay?time=8:16&link=ku-FyZvD48Q"><b>\"свет\"</b></a> - правая грань, причем
    Включение света - это вращение по часовой стрелке, а выключение - против часовой.<br/>
    и <a href="rg2://ytplay?time=7:58&link=8VCsFNFa5yM"><b>\"крыша\"</b></a> - верхняя грань.<br/>
    Возможно это не лучшие ассоциации, но на мой взгляд в любом случае
    <a href="rg2://ytplay?time=8:51&link=u1CA_35lRAI"><b>\"В Лондон\",</b></a> гораздо легче для
    запоминания, чем \"передняя грань по часовой стрелке\".</p>
  
    <p>Если вы хотите не просто научиться собирать кубик, а еще и делать это быстро, то
    после освоения любой из приведенных методик для начинающих переходите к изучению
    метода Фридрих или правильнее все таки его называть CFOP (сифоп). Описание того, как
    его учить и на что обратить внимание вы можете найти в разделе <b>Собираем кубик быстро
    (Фридрих (CFOP), ROUX)</b>.</p>
  """;

  static const recomendation_comment = "Обязательно надо прочитать";
}
