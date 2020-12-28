
import 'package:rg2_flutter_getx/models/phases.dart';

class Blind implements Phase {
  @override
  int count = blind_title.length;

  @override
  String phase = "BLIND";

  @override
  List<String> titles() => blind_title;

  @override
  List<String> icons() => blind_icon;

  @override
  List<String> descriptions() => blind_descr;

  @override
  List<String> urls() => blind_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const blind_title = [
        blind_st1_title,
        blind_st2_title,
        blind_st3_title,
        blind_st4_title,
        blind_st5_title,
        blind_st6_title,
        blind_st7_title,
        blind_st8_title,
        blind_st9_title,
        blind_st10_title,
        blind_st11_title,
        blind_st12_title,
        blind_st13_title,
        blind_st14_title,
        blind_st15_title,
        blind_st16_title,
        blind_st17_title,
        blind_st18_title,
        blind_st19_title,
        blind_st20_title,
        blind_st21_title,
        blind_st22_title,
        blind_st23_title,
        blind_st24_title,
        blind_st25_title,
        blind_st26_title,
        blind_st27_title,
        blindacc_st1_title,
        blindacc_st2_title,
        blindacc_st3_title,
        blindacc_st4_title,
        blindacc_st5_title,
        blindacc_st6_title,
        blindacc_st7_title,
        blindacc_st8_title,
        blindacc_st9_title,
        blindacc_st10_title,
        blindacc_st11_title,
        blindacc_st12_title,
    ];

    static const blind_icon = [
        "blind",
        "blind_2",
        "blind_3",
        "blind_4",
        "blind_5",
        "blind_6",
        "blind_7",
        "blind_8",
        "blind_9",
        "blind_10",
        "blind_11",
        "blind_12",
        "blind_13",
        "blind_13",
        "blind_15",
        "blind_16",
        "blind_17",
        "blind_18",
        "blind_19",
        "blind_20",
        "blind_21",
        "blind_22",
        "blind_23",
        "blind_24",
        "blind_25",
        "blind_26",
        "blind_27",
        "blaccel_1",
        "blaccel_2",
        "blaccel_3",
        "blaccel_4",
        "blaccel_5",
        "blaccel_6",
        "blaccel_7",
        "blaccel_8",
        "blaccel_9",
        "blaccel_10",
        "blaccel_11",
        "blaccel_12",
    ];

    static const blind_descr = [
        blind_st1_descr,
        blind_st2_descr,
        blind_st3_descr,
        blind_st4_descr,
        blind_st5_descr,
        blind_st6_descr,
        blind_st7_descr,
        blind_st8_descr,
        blind_st9_descr,
        blind_st10_descr,
        blind_st11_descr,
        blind_st12_descr,
        blind_st13_descr,
        blind_st14_descr,
        blind_st15_descr,
        blind_st16_descr,
        blind_st17_descr,
        blind_st18_descr,
        blind_st19_descr,
        blind_st20_descr,
        blind_st21_descr,
        blind_st22_descr,
        blind_st23_descr,
        blind_st24_descr,
        blind_st25_descr,
        blind_st26_descr,
        blind_st27_descr,
        blindacc_st1_descr,
        blindacc_st2_descr,
        blindacc_st3_descr,
        blindacc_st4_descr,
        blindacc_st5_descr,
        blindacc_st6_descr,
        blindacc_st7_descr,
        blindacc_st8_descr,
        blindacc_st9_descr,
        blindacc_st10_descr,
        blindacc_st11_descr,
        blindacc_st12_descr,
    ];

    static const blind_url = [
        blind_st1_url,
        blind_st2_url,
        blind_st3_url,
        blind_st4_url,
        blind_st5_url,
        blind_st6_url,
        blind_st7_url,
        blind_st8_url,
        blind_st9_url,
        blind_st10_url,
        blind_st11_url,
        blind_st12_url,
        blind_st13_url,
        blind_st14_url,
        blind_st15_url,
        blind_st16_url,
        blind_st17_url,
        blind_st18_url,
        blind_st19_url,
        blind_st20_url,
        blind_st21_url,
        blind_st22_url,
        blind_st23_url,
        blind_st24_url,
        blind_st25_url,
        blind_st26_url,
        blind_st27_url,
        blindacc_st1_url,
        blindacc_st2_url,
        blindacc_st3_url,
        blindacc_st4_url,
        blindacc_st5_url,
        blindacc_st6_url,
        blindacc_st7_url,
        blindacc_st8_url,
        blindacc_st9_url,
        blindacc_st10_url,
        blindacc_st11_url,
        blindacc_st12_url,
    ];



    static const blind_st1_title = "N1 Вступление";
    static const blind_st1_descr = """
        Из этой серии видео вы узнаете, как собрать кубик с закрытыми глазами. Словами очень сложно
        передать, что необходимо делать, поэтому в комментариях к данному циклу видео, лишь краткое
        описание, того о чем видео. Плюс алгоритмы, скрамблы и несколько картинок для упрощения
        понимания/запоминания. В остальном, рекомендую посмотреть видео.<br/>
        Если у вас есть идеи, что можно/нужно дописать к какому-нибудь из этапов, присылайте на почту
        <a href="mailto:rubicsguide@yandex.ru">rubicsguide@yandex.ru</a>
    """;
    static const blind_st1_url = "t8dHDN06q-s";

    static const blind_st2_title = "N2 Начальное положение";
    static const blind_st2_descr = """
        Как правильно держать кубик при слепой сборке.
    """;
    static const blind_st2_url = "_WAUfH3GAFs";

    static const blind_st3_title = "N3 Запад";
    static const blind_st3_descr = """
        Первый из алгоритмов, который применяется при сборке вслепую - <b>Запад</b>.<br/>
         <p style="text-align:center"><img src="blind_3_1.xml" ></p>
        Фингертрикс: <a href="rg2://ytplay?time=3:35&link=_yWZMTIM-fA">на видео 3:35</a>
        (<a href="rg2://ytplay?time=7:22&link=_yWZMTIM-fA">или 7:22</a>) <br/>
        <b>Алгоритм: (R U R\' U\') R\' F R2 U\' R\' U\' (R U R\' F\') </b>
    """;
    static const blind_st3_url = "_yWZMTIM-fA";

    static const blind_st4_title = "N4 Буфер и корзина";
    static const blind_st4_descr = """
        Что такое буфер, где он находится и что такое корзина.
    """;
    static const blind_st4_url = "YhwiRpWWyYQ";

    static const blind_st5_title = "N5 Первые установочные ходы";
    static const blind_st5_descr = """
        Что такое установочные ходы (setup move) и для чего они нужны.
    """;
    static const blind_st5_url = "2kiRWJdcMkU";

    static const blind_st6_title = "N6 Первая практика";
    static const blind_st6_descr = """
        Пробуем собрать кубик, пока с открытыми глазами.<br/>
        <b>Скрамбл в видео: F2 U2 R L2 B2 D F D2 R2 U R2 L2 R\' U R B D\'</b><br/>
        Посмотреть как должен выглядеть куб после скрамбла, можно в
        <a href="rg2://scrmbl?scram=F2_U2_R_L2_B2_D_F_D2_R2_U_R2_L2_R\'_U_R_B_D\'">генераторе скрамблов.</a>
    """;
    static const blind_st6_url = "2Jz4yGBzWzM";

    static const blind_st7_title = "N7 Добрались до Юга";
    static const blind_st7_descr = """
        Еще один очень нужный алгоритм для сборки ребер - <b>Юг</b>.
        <p style="text-align:center"><img src="blind_7_1.xml" ></p>
        Фингертрикс: <a href="rg2://ytplay?time=2:36&link=rzGqTZKG74o">на видео 2:36</a> <br/>
        <b>Алгоритм: (R U R\' F\') (R U R\' U\' R\' F R2 U\' R\' U\')</b>
    """;
    static const blind_st7_url = "rzGqTZKG74o";

    static const blind_st8_title = "N8 Продолжаем практику";
    static const blind_st8_descr = """
        Продолжаем собирать ребра, уже используя второй алгоритм.
    """;
    static const blind_st8_url = "qYp4tGUkXLk";

    static const blind_st9_title = "N9 Установочные ходы для ребер (часть 1)";
    static const blind_st9_descr = """
        Установочные ходы для всех возможных вариантов ребер (часть 1)
    """;
    static const blind_st9_url = "FSaNohWHGvs";

    static const blind_st10_title = "N10 Установочные ходы для ребер (часть 2)";
    static const blind_st10_descr = """
        Ограничения для установочных ходов. Установочные ходы для всех возможных вариантов ребер (часть 2)
    """;
    static const blind_st10_url = "k-kMFNKf3TU";

    static const blind_st11_title = "N11 Цепочки";
    static const blind_st11_descr = """
        Как создаются последовательности элементов, которые оказываются в буфере.<br/>
        <b>Скармбл в видео: U2 F2 L\' D2 R U F\' L2 B2 R L2 B2 U R</b>
    """;
    static const blind_st11_url = "8h4JDbvXPMg";

    static const blind_st12_title = "N12 Азбука";
    static const blind_st12_descr = """
        Азбука - система запоминания цепочек.
        <p style="text-align:center"><img src="blind_12_1.xml" width="80%"></p>
    """;
    static const blind_st12_url = "oglge8NIQqI";

    static const blind_st13_title = "N13 Тренируем азбуку";
    static const blind_st13_descr = """
        Пробуем создать цепочку по азбуке.<br/>
        <b>Скармбл в видео: U2 F2 L\' D2 R U F\' L2 B2 R L2 B2 U R </b><br/>
        Должно получиться: КЁрлинг ПО МоВе ЛИ Желтые Яблоки Э <br/>
    """;
    static const blind_st13_url = "CiDALMqmlxo";

    static const blind_st14_title = "N14 Пробуем закрыть глаза";
    static const blind_st14_descr = """
        Цепочку (фразу) создали, пробуем собрать ребра по запомненной фразе с закрытыми глазами.<br/>
        <b>Скрамбл в видео: U2 F2 L\' D2 R U F\' L2 B2 R L2 B2 U R </b><br/>
        Фраза: КЁрлинг ПО МоВе ЛИ Желтые Яблоки Э<br/><br/>
        Показать кубик в <a href="rg2://scrmbl?scram=U2_F2_L\'_D2_R_U_F\'_L2_B2_R_L2_B2_U_R">генераторе скрамблов.</a>
    """;
    static const blind_st14_url = "F42YJAq2cmA";

    static const blind_st15_title = "N15 Переплавка буфера";
    static const blind_st15_descr = """
        Самая сложная часть сборки. Что делать, если буфер встает на место преждевременно и как
        понять преждевременно он туда встал или нет.<br/>
        <b>Скрамбл: D2 F\' R L U R\' D\' B2 R\' F2 R2 U2 R2 U\' </b><br/>
        Фраза: ЕИ ХЁ ГЯ ПоМыл КЮ ЛоСось<br/><br/>
        Если вы понимаете, что еще недостаточно выучили азбуку, а при случайном перемешивании
        кубика очень часто выпадает переплавка буфера и она вам дается очень тяжело, то можете
        воспользоваться <a href="rg2://scrmbl?scram=D2_F\'_R_L_U_R\'_D\'_B2_R\'_F2_R2_U2_R2_U\'">генератором скрамблов</a>,
        который придумает вам скрамбл без переплавки буфера.
        А заодно сможете сравнить придуманную цепочку и понять где вы ошиблись, в составлении
        цепочки или при выполнении установочных ходов/алгоритмов, если в результате ребра не собрались.
        Но как вы наверно уже и сами понимаете, при переплавке буфера фразы могут отличаться, в
        зависимости от того куда будет происходить переплавка.
    """;
    static const blind_st15_url = "UyovfS_8kT0";

    static const blind_st16_title = "N16 Двойная переплавка";
    static const blind_st16_descr = """
        Еще более сложная ситуация, когда буфер не встает на свое место и после первой переплавки. <br/>
        <b>Скрамбл: R D2 U F2 R\' F\' U2 R D R2 B </b><br/>
        Фраза: ХЁ ВаГон МАма ПыШка СЯ ЮК Р
    """;
    static const blind_st16_url = "pkikOC_SgPs";

    static const blind_st17_title = "N17 Ребро на месте";
    static const blind_st17_descr = """
        <b>Скрамбл: R D2 U F2 R\' F\' U2 R D R2 B D </b><br/>
        Отличается всего одним ходом от предыдущего скрамбла, но фраза уже совсем другая получается.<br/>
        Фраза: ХЦ (Хватит Царапать) ЯСно ИЗ ЛЁвы ВаГон.
    """;
    static const blind_st17_url = "y1K8QkrvG2A";

    static const blind_st18_title = "N18 Перевернутое ребро";
    static const blind_st18_descr = """
        <b>Скрамбл: B2 D U2 R\' L2 U2 R2 D F2 U\' L2 R\' B\' D R </b> <br/>
        Что делать если попалось ребро которое стоит на своем месте, но перевернуто. <br/>
        Фраза: ГЭФЕСА ЖаЛко ЦО ЯРик.<br/>
        Или можно воспользоваться ускорениями №1 и №2.
    """;
    static const blind_st18_url = "TJKqLhg9Q7c";

    static const blind_st19_title = "N19 Экватор";
    static const blind_st19_descr = """
        Для чего нужен еще один алгоритм - Экватор.<br/>
        <p style="text-align:center"><img src="blind_19_1.xml"></p>
        Фингертрикс: <a href="rg2://ytplay?time=4:35&link=pT72Wh8VZT4">на видео 4:35</a><br/>
        <b>Алгоритм: (R U R\' F\') (R U2 R\' U2) (R\' F R U R) U2 R\' U\'</b>
    """;
    static const blind_st19_url = "pT72Wh8VZT4";

    static const blind_st20_title = "N20 Примеры Экватора";
    static const blind_st20_descr = """
        Разбираемся на примерах, когда экватор нужен, а когда нет.
    """;
    static const blind_st20_url = "HBJ5LLUHW5A";

    static const blind_st21_title = "N21 Австралия";
    static const blind_st21_descr = """
        Где находится буфер и корзина для углов. Основной алгоритм для постановки на место углов - Австралия. <br/>
        Фингертрикс: <a href="rg2://ytplay?time=4:07&link=artmFaxjaC0">на видео 4:07</a> <br/>
        <b>Алгоритм: (F R) (U\' R\' U\' R U R\' F\') (R U R\' U\') (R\' F R F\')</b>
    """;
    static const blind_st21_url = "artmFaxjaC0";

    static const blind_st22_title = "N22 Азбука углов";
    static const blind_st22_descr = """
        Азбука для углов.
        <p style="text-align:center"><img src="blind_22_1.xml" width="80%"></p>
    """;
    static const blind_st22_url = "fxvR33pCHN0";

    static const blind_st23_title = "N23 Установочные ходы для углов часть 1";
    static const blind_st23_descr = """
        Установочные ходы для углов зеленой и синей стороны + бело-зелено-красного угла.
    """;
    static const blind_st23_url = "aEA5PdC2xhg";

    static const blind_st24_title = "N24 Установочные ходы для углов часть 2";
    static const blind_st24_descr = """
        Установочные ходы для углов оранжевой, красной, желтой и белой стороны.
    """;
    static const blind_st24_url = "0_8jiiJX8jU";

    static const blind_st25_title = "N25 Цепочка и практика с углами.";
    static const blind_st25_descr = """
        Составляем цепочку для запоминания углов.<br/>
        <b>Скрамбл: U\' L2 B2 R F\' B2 L\' R U2 D2 </b> <br/>
        Фраза: УШастик ЛаПает ЗоВет Ю
    """;
    static const blind_st25_url = "BFY3Q3tB3hU";

    static const blind_st26_title = "N26 Переплавка буфера углов";
    static const blind_st26_descr = """
        Что делать, если буфер встал на свое место раньше времени. <br/>
        <b>Скрамбл: R2 U\' F D2 L B2 F2 R\' U F D2 R2</b><br/><br/>
        З.Ы. Надеюсь вы помните, что есть <a href="rg2://scrmbl?scram=R2_U\'_F_D2_L_B2_F2_R\'_U_F_D2_R2">генератор скрамблов</a> (см.Часть N15) :)
    """;
    static const blind_st26_url = "EpVBcLyj0WQ";

    static const blind_st27_title = "N27 Перевернутый угол и угол на месте";
    static const blind_st27_descr = """
        Что делать с перевернутыми углами, которые стоят на своем месте. <br/>
        <b>Скрамбл: R2 U2 D\' B2 F L2 U\' R F2 B2 D2</b>
    """;
    static const blind_st27_url = "92dy3OyXCjM";


  static const blindacc_st1_title = "Ускорение №1";
  static const blindacc_st1_descr = """
        Ускорение для ситуации, когда одно из ребер на своем месте, но перевернуто. Или не для
        слепой сборки - как перевернуть два ребра находящиеся друг напротив друга. <br/>
        1. Вариант когда одно ребро на ближней грани, а другое на дальней.<br/>
        <p style="text-align:center"><img src="blaccel_1_1.xml"></p>
        Фингертрикс:  <a href="rg2://ytplay?time=7:49&link=sWlREfNebUI">на видео 7:49</a> <br/>
        <b>Алгоритм: (M\' U\' M\' U\' M\' U2) (M U\' M U\' M U2)</b><br/><br/>
        2. Вариант для классического расположения буфера и корзины, т.е. можно выполнять без
        перехвата кубика. К тому же без неудобного кручения среднего слоя, но с чередованием
        вращения верхней грани.
        <p style="text-align:center"><img src="blaccel_1_2.xml"></p>
        <b>Алгоритм: (M\' U M\' U M\' U M\' U) (M\' U\' M\' U\' M\' U\' M\' U\')</b> или <b>4(M\' U) 4(M\' U\')</b>
    """;
  static const blindacc_st1_url = "sWlREfNebUI";

  static const blindacc_st2_title = "Ускорение №2";
  static const blindacc_st2_descr = """
        А теперь ускорение для переворота двух соседних ребер. Как написал в комментариях к
        данному видео <b>A lex</b>:<br/>
        Формулу удобно запомнить так: Первая часть - это начало из "убийства в Лондоне", потом
        пиф-паф, третья часть - снова начало "убийства", но заканчивается двумя слоями. И последняя
        часть - обратный "пиф-паф", заканчивающийся двумя слоями.<br/>
        <p style="text-align:center"><img src="blaccel_2_1.xml"></p>
        Фингертрикс:  <a href="rg2://ytplay?time=4:10&link=COfAsfx5pAA">на видео 4:10</a> <br/>
        <b>Алгоритм: (R\' U2 R) (R U R\' U\') (R\' U2 Rw) (U R U\' Rw\')</b><br/><br/>
        P.S. Поскольку данный алгоритм не затрагивает угловые элементы и не перемещает ребра с места
        на место, а только переворачивает их, то его можно использовать
        не только для пары буфера и места белозеленого ребра, но и для пары буфер - белосинее место.
        Для этого надо использовать дополнительный установочный ход U. И конечно же после выполнения
        алгоритма не забыть про ход U\'.
    """;
  static const blindacc_st2_url = "COfAsfx5pAA";

  static const blindacc_st3_title = "Ускорение №3";
  static const blindacc_st3_descr = """
        Ускорение для ситуации, когда четное количество ребер находятся на своем месте, но перевернуты.
        В этом случае, буфер не трогаем, а просто подводим одно ребро на ближнюю грань, а другое на
        дальнюю или левую. И делаем алгоритм из ускорения №1 или №2 в зависимости, от того куда
        поставили ребро.
        <p style="text-align:center"><img src="blaccel_3_1.xml"></p>
        Вариант  <a href="rg2://ytplay?time=3:28&link=e-00ucfI8DE">для дальнего</a> ребра <br/>
        Тот же случай,  <a href="rg2://ytplay?time=4:04&link=e-00ucfI8DE">для левого</a> ребра <br/>
    """;
  static const blindacc_st3_url = "e-00ucfI8DE";

  static const blindacc_st4_title = "Ускорение №4";
  static const blindacc_st4_descr = """
        <p>Рассмотрим перевернутые углы на своем месте. Но для начала надо выучить один очень
        простой алгоритм, который вам наверняка уже попадался -
         <a href="rg2://ytplay?time=1:50&link=YoMKHwOr48E"><b>Антипиф-паф</b></a>, в котором
        все ходы противоположны пиф-пафу.<br/>
        <b>Алгоритм: (U R U\' R\')</b></p>
        <p>Переходим к ускорению: данное ускорение связано с одним
         <a href="rg2://ytplay?time=2:29&link=YoMKHwOr48E">левым</a> углом, находящимся на своем
        месте, но перевернутым. Т.к. углы могут быть перевернуты только парой и один из пары это
        буфер, то получается 3 угла. С учетом того, что вариантов одного перевернутого угла два,
        получается шесть ситуаций перевернутого левого угла на своем месте.</p>
        1.  <a href="rg2://ytplay?time=2:59&link=YoMKHwOr48E"><b>Г</b>о<b>П</b>ник</a><br/>
         (т.к. для переворота классическим методом использовались бы буквы Г и П)<br/>
         В этом случае делаем два антипиф-пафа, ставим второй угол в глаз (на место буфера), делаем
         два пиф-пафа и возвращаем угол на место.
         <p style="text-align:center"><img src="blaccel_4.xml" ></p>
         <b>Алгоритм: (U R U\' R\')(U R U\' R\') L\' (R U R\' U\')(R U R\' U\') L</b><br/><br/>
        2.  <a href="rg2://ytplay?time=8:11&link=YoMKHwOr48E"><b>ГЕ</b>й</a><br/>
         Обратный Гопнику, сначала два пиф-пафа, устанавливаем в глаз второй угол (установочный ход),
          два антипиф-пафа, возвращаем угол на место (отменяем установочный ход).
         <p style="text-align:center"><img src="blaccel_4_2.xml" ></p>
         <b>Алгоритм: (R U R\' U\')(R U R\' U\') L\' (U R U\' R\')(U R U\' R\') L</b><br/><br/>
        3.  <a href="rg2://ytplay?time=10:06&link=YoMKHwOr48E"><b>ЯР</b>ик</a><br/>
          Все аналогично ГЕю, два пиф-пафа, установочный ход, два антипиф-пафа, отмена установочного хода.
         <p style="text-align:center"><img src="blaccel_4_4.xml" ></p>
         <b>Алгоритм: (R U R\' U\')(R U R\' U\') L2 (U R U\' R\')(U R U\' R\') L2</b><br/><br/>
        4.  <a href="rg2://ytplay?time=10:57&link=YoMKHwOr48E"><b>ЯЗ</b>ь</a><br/>
          ЯЗь противоположность ЯРику и похож на ГоПника. Начинается с двух антипиф-пафов.
         <p style="text-align:center"><img src="blaccel_4_3.xml" ></p>
         <b>Алгоритм: (U R U\' R\')(U R U\' R\') L2 (R U R\' U\')(R U R\' U\') L2</b><br/><br/>
        5.  <a href="rg2://ytplay?time=12:05&link=YoMKHwOr48E"><b>Ш</b>о<b>C</b>се</a><br/>
          Гопник с Язем идет по Шоссе.. Соответственно начинаем с антипиф-пафа.
         <p style="text-align:center"><img src="blaccel_4_5.xml" ></p>
         <b>Алгоритм: (U R U\' R\')(U R U\' R\') L (R U R\' U\')(R U R\' U\') L\'</b><br/><br/>
        6.  <a href="rg2://ytplay?time=12:51&link=YoMKHwOr48E"><b>ШМ</b>ель</a><br/>
          Гея Ярика укусил Шмель. Ну или ГЕна, ЯРик и ШаМиль - нормальные парни, у них все правильно,
          поэтому начинаем с пиф-пафа.
         <p style="text-align:center"><img src="blaccel_4_6.xml" ></p>
         <b>Алгоритм: (R U R\' U\')(R U R\' U\') L (U R U\' R\')(U R U\' R\') L\'</b><br/><br/>
         <p>Чтобы не путаться, что делать сначала, в следующем ускорении будет описана система
         определения какой алгоритм делать первым</p>
    """;
  static const blindacc_st4_url = "YoMKHwOr48E";

  static const blindacc_st5_title = "Ускорение №5";
  static const blindacc_st5_descr = """
            <p>Левые углы не на своем месте рассмотрели, переходим к  <a href="rg2://ytplay?time=2:29&link=YoMKHwOr48E">правым.</a>
            И поскольку буфер у нас слева, то перевернутых правых углов может быть четыре, умножаем на два
            варианта каждого угла, получается 8 ситуаций.</p>

         1.  <a href="rg2://ytplay?time=1:29&link=rhV9ZA_mJ9I"><b>В</b>ь<b>Ё</b>т</a><br/>
            Все очень просто, сначала возвращением из Лондона переводим угол налево, делаем
            Гопника (сначала антипиф-пафы) и уезжаем в Лондон.
         <p style="text-align:center"><img src="blaccel_5.xml" ></p>
         <b>Алгоритм: F\' (U R U\' R\')(U R U\' R\') L\' (R U R\' U\')(R U R\' U\') L F</b><br/><br/>

         2.  <a href="rg2://ytplay?time=3:02&link=rhV9ZA_mJ9I"><b>В</b>а<b>Ф</b>ля</a><br/>
            И снова переводим угол в левую часть (из Лондона), делаем ГЕя (сначала пиф-пафы), уезжаем в Лондон.
         <p style="text-align:center"><img src="blaccel_5_2.xml" ></p>
         <b>Алгоритм: F\' (R U R\' U\')(R U R\' U\') L\' (U R U\' R\')(U R U\' R\') L F</b><br/><br/>

         3.  <a href="rg2://ytplay?time=5:08&link=rhV9ZA_mJ9I"><b>ЮХ</b></a><br/>
            Первым ходом конечно же переносим угол в левый слой, удобнее всего это сделать через D\'.
            Делаем ЯЗя (сначала антипиф-пафы) и возвращаем угол на место ходом D.
         <p style="text-align:center"><img src="blaccel_5_3.xml" ></p>
         <b>Алгоритм: D\' (U R U\' R\')(U R U\' R\') L2 (R U R\' U\')(R U R\' U\') L2 D</b><br/><br/>

         4. <b>ЮЖный</b><br/>
            И снова первым ходом переносим угол в левый слой (через D\'). Делаем ЯРика (сначала пиф-пафы) и возвращаем
            угол на место ходом D.
         <p style="text-align:center"><img src="blaccel_5_4.xml" ></p>
         <b>Алгоритм: D\' (R U R\' U\')(R U R\' U\') L2 (U R U\' R\')(U R U\' R\') L2 D</b><br/><br/>

         5.  <a href="rg2://ytplay?time=6:48&link=rhV9ZA_mJ9I"><b>ЭЦ</b></a><br/>
           Данный угол переводим на левую сторону через кручение нижней грани, ход D. В данном случае
           сначала делаем два пиф-пафа, ставим в буфер угол, два антипиф-пафа, возвращаем угол на место.
         <p style="text-align:center"><img src="blaccel_5_5.xml" ></p>
         <b>Алгоритм: D (R U R\' U\')(R U R\' U\') L (U R U\' R\')(U R U\' R\') L\' D\'</b><br/><br/>

         6. <b>ЭЛ</b><br/>
           Опять же начинаем с D. Два антипиф-пафа. Угол в буфер. Два пиф-пафа. Левую грань назад и на
           правую сторону.
         <p style="text-align:center"><img src="blaccel_5_6.xml" ></p>
         <b>Алгоритм: D (U R U\' R\')(U R U\' R\') L (R U R\' U\')(R U R\' U\') L\' D\'</b><br/><br/>

         <p>Чтобы не путаться какой алгоритм пиф-паф или антипиф-паф делать первым, можно воспользоваться
         Максимкиной  <a href="rg2://ytplay?time=7:55&link=rhV9ZA_mJ9I">системой запоминания.</a>
         И применение данной системы  <a href="rg2://ytplay?time=10:20&link=rhV9ZA_mJ9I">на примере.</a></p>

         А теперь вернемся к бело-сине-красному углу. Который можно загонять налево двумя установочными
         ходами (R\' F\' или R D) и тогда система распознавания пиф-паф/антипиф-паф работает. Или поступить
         проще - выполнить перехват y\'. И тогда все наоборот (т.к. мы поменяли буфер и угол). Т.е.<br/><br/>

         7.  <a href="rg2://ytplay?time=12:55&link=rhV9ZA_mJ9I"><b>БУ</b>ква</a><br/>
         Делаем перехват <b>y\'</b>. Теперь 2 пиф-пафа, установочный ход, 2 антипиф-пафа, отмена установочного
         хода и обратный перехват <b>y</b>.
         <p style="text-align:center"><img src="blaccel_5_7.xml" ></p>
         <b>Алгоритм: y\' (R U R\' U\')(R U R\' U\') L\' (U R U\' R\')(U R U\' R\') L y</b><br/><br/>

         8. <b>Б</b>ы<b>К</b><br/>
         Перехват y\'. 2 антипиф-пафа, установочный ход, 2 пиф-пафа, отмена установочного хода и обратный перехват.
         <p style="text-align:center"><img src="blaccel_5_8.xml" ></p>
         <b>Алгоритм: y\' (U R U\' R\')(U R U\' R\') L\' (R U R\' U\')(R U R\' U\') L y</b><br/>
    """;
  static const blindacc_st5_url = "rhV9ZA_mJ9I";

  static const blindacc_st6_title = "Ускорение №6";
  static const blindacc_st6_descr = """
        <p>Вернемся к ребрам. И для начала рассмотрим ситуацию, когда в буфере буква А, а на месте
        буквы А, буква В, т.е. слово для запоминания АВатар. В этом случае можно оба ребра поставить
        на свои места одним, уже знакомым по
         <a href="rg2://ytplay?time=7:18&link=dUGv4WJfJGU">Ускорению для начинающих №17</a>
        и PLL Окошки алгоритмом.
        И казалось бы, что
         <a href="rg2://ytplay?time=2:05&link=79IOb-vLHHE">Аватар</a>
        попадается очень редко, НО… данное ускорение можно использовать
        и когда после А идет П, Ф, Ю. Надо только установить соответствующее ребро
         <a href="rg2://ytplay?time=4:05&link=79IOb-vLHHE">на место В</a>.
        Причем в данных установочных ходах можно крутить все грани кроме правой и верхней, т.к.
        алгоритм все углы оставляет на своих местах.</p>

        <p style="text-align:center"><img src="blaccel_6_1.xml" ></p>
        <b>Алгоритм ускорения: R2 U\' (F B\') R2 (F\' B) U\' R2 </b><br/><br/>
        Пример применения для  <a href="rg2://ytplay?time=5:46&link=79IOb-vLHHE">комбинации АП.</a><br/><br/>

        Другой, мне кажется более удобный вариант исполнения этого же алгоритма из
         <a href="rg2://ytplay?time=11:44&link=P69UVywfz04">PLL Окошки</a> <br/>
        <b>Алгоритм: R2 U\' S\' U2 S U\' R2 </b><br/>
    """;
  static const blindacc_st6_url = "79IOb-vLHHE";

  static const blindacc_st7_title = "Ускорение №7";
  static const blindacc_st7_descr = """
        <p>В данном ускорении рассмотрим другие случаи применения алгоритма из Ускорения №6. Как уже
        многие догадались сами, другое ребро можно подставлять не только вместо В, но и вместо А.
        Например рассмотрим  <a href="rg2://ytplay?time=2:45&link=KdswbE8YIC8"><b>ШВ</b>ею</a><br/>
        Ставим Ш на место А, делаем Окошки, возвращаем Ш на свое место.<p>
        <p style="text-align:center"><img src="blaccel_7_1.xml" ></p>
        <b>Алгоритм: B2 (R2 U\' S\' U2 S U\' R2) B2</b><br/><br/>
        <p>Итого, данным алгоритмом легко решаются
         <a href="rg2://ytplay?time=3:57&link=KdswbE8YIC8">16 случаев:</a><br/>
        АВ АП АЮ АФ, СВ СП СЮ СФ, ЦВ ЦП ЦЮ ЦФ, ШВ ШП ШЮ ШФ</p>

        Кстати, алгоритмы, которые меняют местами 3 ребра называются
         <a href="rg2://ytplay?time=6:28&link=KdswbE8YIC8">Трициклами.</a><br/>
    """;
  static const blindacc_st7_url = "KdswbE8YIC8";

  static const blindacc_st8_title = "Ускорение №8";
  static const blindacc_st8_descr = """
        <p>Рассмотрим другой алгоритм -
         <a href="rg2://ytplay?time=1:08&link=YDxXfKXWDmI">противоположные окошки,</a>
        который так же применяется в
         <a href="rg2://ytplay?time=9:12&link=P69UVywfz04">PLL.</a> Для ускорения
        сборки с закрытыми глазами, этот алгоритм можно применять в случаях, противоположных
        случаям из Ускорения №7. Т.е. когда сначала идет буква передней грани, а потом задней.
        Таким образом, это ускорение для еще 16 ситуаций: ВА ВС ВЦ ВШ, ПА ПС ПЦ ПШ, ЮА ЮС ЮЦ Юш, ФА ФС ФЦ ФШ.</p>
        <b>Алгоритм: R2\' U (F B\') R2 (F\' B) U R2\' </b><br/><br/>

        Например ситуация  <a href="rg2://ytplay?time=4:56&link=YDxXfKXWDmI">ФэйС:</a><br/>
        Сначала делаем два установочных хода (F\' B\'), затем Противоположные окошки и отменяем
        установочные ходы (F B).
        <p style="text-align:center"><img src="blaccel_8_1.xml"></p>
        <b>Алгоритм для ситуации: (F\' B\') (R2\' U (F B\') R2 (F\' B) U R2\') (F B)</b><br/>
        или с фингертриксом из PLL: (F\' B\') (R2 U S\' U2 S U R2) (F B)<br/>
    """;
  static const blindacc_st8_url = "YDxXfKXWDmI";

  static const blindacc_st9_title = "Ускорение №9";
  static const blindacc_st9_descr = """
    <p>Еще несколько ситуаций в которых можно применить трицикл Окошки.</p>
    1.  <a href="rg2://ytplay?time=0:40&link=oe__ZpaAqSo">ЕЖ</a><br/>
    Делаем установочный ход <b>M\'</b>, смежные окошки, отменяем установочный ход <b>M</b>.
    <p style="text-align:center"><img src="blaccel_9.xml" ></p>
    <b>Алгоритм: M\' (R2 U\' S\' U2 S U\' R2) M</b><br/><br/>

    2.  <a href="rg2://ytplay?time=1:34&link=oe__ZpaAqSo">ЖЕ</a><br/>
    Делаем установочный ход <b>M\'</b>, противоположные окошки, отменяем установочный ход <b>M</b>.
    <p style="text-align:center"><img src="blaccel_9_2.xml" ></p>
    <b>Алгоритм: M\' (R2 U S\' U2 S U R2) M</b><br/><br/>

    3.  <a href="rg2://ytplay?time=3:25&link=oe__ZpaAqSo">ЛИ</a><br/>
    Делаем установочный ход <b>M</b>, смежные окошки, отменяем установочный ход <b>M\'</b>.
    <p style="text-align:center"><img src="blaccel_9_3.xml" ></p>
    <b>Алгоритм: M (R2 U\' S\' U2 S U\' R2) M\'</b><br/><br/>

    4.  <a href="rg2://ytplay?time=3:49&link=oe__ZpaAqSo">ИЛ</a><br/>
    Делаем установочный ход <b>M</b>, противоположные окошки, отменяем установочный ход <b>M\'</b>.
    <p style="text-align:center"><img src="blaccel_9_4.xml" ></p>
    <b>Алгоритм: M (R2 U S\' U2 S U R2) M\'</b><br/><br/>

    """;
  static const blindacc_st9_url = "oe__ZpaAqSo";

  static const blindacc_st10_title = "Ускорение №10";
  static const blindacc_st10_descr = """
    В данном ускорении рассмотрим группы, в которых основная наклейка находится не на боковой, а на передней или
    задней  <a href="rg2://ytplay?time=0:58&link=D6_k4MT6Rpk">грани.</a> И начнем со случаев,
    когда первая наклейка (буква) на задней грани, а вторая на передней.<br/>
    Для начала без установочных ходов, т.е.  <a href="rg2://ytplay?time=2:08&link=D6_k4MT6Rpk">ИЕ</a><br/>
    Перехват <b>y</b>, белый центр на место красного (M), буфер в сторону первой наклейки, т.е.
    направо (U\'), возвращаем на место центры (M\'), крыша 2 раза, повторить первые 3 хода, отменить
    перехват <b>y\'</b>.
    <p style="text-align:center"><img src="blaccel_10.xml" ></p>
    <b> <a href="rg2://ytplay?time=3:52&link=D6_k4MT6Rpk&alg=y_(M_U\'_M\')_U2_(M_U\'_M\')_y\'">Алгоритм:</a> y (M U\' M\') U2 (M U\' M\') y\'</b><br/><br/>
    <p>А если использовать простые установочные ходы, то данным алгоритмом решаются следующие
     <a href="rg2://ytplay?time=6:01&link=D6_k4MT6Rpk">ситуации:</a> ИЕ ИЁ ИЖ ИЗ, КЕ КЁ КЖ КЗ, ЛЕ ЛЁ ЛЖ ЛЗ, МЕ МЁ МЖ МЗ.
    Например  <a href="rg2://ytplay?time=5:13&link=D6_k4MT6Rpk">МЁд.</a></p>

    <p>Теперь о случаях, когда первая  <a href="rg2://ytplay?time=7:20&link=D6_k4MT6Rpk">наклейка</a>
    (буква) находится на передней грани, а вторая на задней.</p>
    Случай без установочных ходов, т.е.  <a href="rg2://ytplay?time=7:35&link=D6_k4MT6Rpk">ЕИ</a><br/>
    Все аналогично предыдущему случаю, только буфер теперь едет в другую сторону.
    Перехват <b>y</b>, белый центр на место красного (M), буфер в сторону первой наклейки, т.е.
    теперь влево (U), возвращаем на место центры (M\'), крыша 2 раза, повторить первые 3 хода, отменить
    перехват <b>y\'</b>.
    <b>Алгоритм: y (M U M\') U2 (M U M\') y\'</b><br/><br/>
    Соответственно при использовании установочных ходов (вращения передней и/или задней грани) этим
    алгоритмом решаются: ЕИ ЕК ЕЛ ЕМ, ЁИ ЁК ЁЛ ЁМ, ЖИ ЖК ЖЛ ЖМ, ЗИ ЗК ЗЛ ЗМ.
    Например  <a href="rg2://ytplay?time=8:29&link=D6_k4MT6Rpk">ЗЛой.</a></p>

    """;
  static const blindacc_st10_url = "D6_k4MT6Rpk";

  static const blindacc_st11_title = "Ускорение №11";
  static const blindacc_st11_descr = """
    <p>Еще 4 случая, которые решаются алгоритмами из Ускорения 10.</p>
    1.  <a href="rg2://ytplay?time=1:21&link=qVIFq15A6DE">ЮВ</a><br/>
    Делаем установочный ход <b>M\'</b>, второй алгоритм из Ускорения 10, отменяем установочный ход <b>M</b>.
    <p style="text-align:center"><img src="blaccel_11.xml" ></p>
    <b>Алгоритм: M\' (y (M U M\') U2 (M U M\') y\') M</b><br/><br/>
    2.  <a href="rg2://ytplay?time=2:22&link=qVIFq15A6DE">ВьЮга</a><br/>
    Делаем установочный ход <b>M\'</b>, первый алгоритм из Ускорения 10, отменяем установочный ход <b>M</b>.
    <p style="text-align:center"><img src="blaccel_11_2.xml" ></p>
    <b>Алгоритм: M\' (y (M U\' M\') U2 (M U\' M\') y\') M</b><br/><br/>
    3.  <a href="rg2://ytplay?time=3:36&link=qVIFq15A6DE">ША</a><br/>
    Делаем установочный ход <b>M</b>, первый алгоритм из Ускорения 10, отменяем установочный ход <b>M\'</b>.
    <p style="text-align:center"><img src="blaccel_11_3.xml" ></p>
    <b>Алгоритм: M (y (M U\' M\') U2 (M U\' M\') y\') M\'</b><br/><br/>
    4.  <a href="rg2://ytplay?time=4:55&link=qVIFq15A6DE">АШ</a><br/>
    Делаем установочный ход <b>M</b>, второй алгоритм из Ускорения 10, отменяем установочный ход <b>M\'</b>.
    <p style="text-align:center"><img src="blaccel_11_4.xml" ></p>
    <b>Алгоритм: M (y (M U M\') U2 (M U M\') y\') M\'</b><br/><br/>
    """;
  static const blindacc_st11_url = "qVIFq15A6DE";

  static const blindacc_st12_title = "Ускорение №12";
  static const blindacc_st12_descr = """
    <p>Практическое применение ускорений на случайных скрамблах:</p>
    <b>1.  <a href="rg2://ytplay?time=3:00&link=Q9LVVnfyZPw">Скрамбл:</a>
    L\' D R2 B F\' L B R B U\' D B2 U\' B2 F2 D\' B\' U\' B2 D2 F\' D B\' F2 U </b><br/>
    <p style="text-align:center"><img src="blaccel_12.xml" ></p>
    В  <a href="rg2://ytplay?time=5:20&link=Q9LVVnfyZPw">сборке</a>
    данного скрамбла к сожалению не попалось ни одного из изученных трициклов, зато два ребра
    стоят на своем месте, но перевернуты.<br/>
     <a href="rg2://ytplay?time=3:31&link=Q9LVVnfyZPw">Фраза:</a> СоЖитель ЗА ЭГейское море ЦеЛый ЁО <br/><br/>

    <b>2.  <a href="rg2://ytplay?time=7:48&link=Q9LVVnfyZPw">Скрамбл:</a>
    B U\' B2 F R\' D2 U F2 L2 D2 B2 F2 L2 F\' L2 B2 R\' L2 F L\' F\' L\' U\' F2 B2 </b><br/>
    <p style="text-align:center"><img src="blaccel_12_2.xml" ></p>
    В  <a href="rg2://ytplay?time=10:52&link=Q9LVVnfyZPw">сборке</a>
    этого скрамбла попался один из трициклов
     <a href="rg2://ytplay?time=11:09&link=Q9LVVnfyZPw">ЖЕ</a>
    и один
     <a href="rg2://ytplay?time=12:1&link=Q9LVVnfyZPw">переворот ребра,</a>
    но уже из Ускорения №2<br/>
     <a href="rg2://ytplay?time=9:00&link=Q9LVVnfyZPw">Фраза:</a> ШьЁт ЖЕ ОК ЭЗ СаЗан
    """;
  static const blindacc_st12_url = "Q9LVVnfyZPw";


}