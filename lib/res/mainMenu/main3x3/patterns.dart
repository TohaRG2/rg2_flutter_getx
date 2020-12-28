
import 'package:rg2_flutter_getx/models/phases.dart';

class Patterns implements Phase {
  @override
  int count = patterns_title.length;

  @override
  String phase = "PATTERNS";

  @override
  List<String> titles() => patterns_title;

  @override
  List<String> icons() => patterns_icon;

  @override
  List<String> descriptions() => patterns_descr;

  @override
  List<String> urls() => patterns_url;

  @override
  List<String> comments() => patterns_comment;

///==================================================


    static const patterns_title = [
        patterns_st1_title,
        patterns_st2_title,
        patterns_st3_title,
        patterns_st4_title,
        patterns_st5_title,
        patterns_st6_title,
        patterns_st7_title,
        patterns_st8_title,
        patterns_st9_title,
        patterns_st10_title,
        patterns_st11_title,
        patterns_st12_title,
        patterns_st13_title,
        patterns_st14_title,
        patterns_st15_title,
        patterns_st16_title,
        patterns_st17_title,
    ];

    static const patterns_icon = [
        "pattern_1",
        "pattern_2",
        "pattern_3",
        "pattern_4",
        "pattern_5",
        "pattern_6",
        "pattern_7",
        "pattern_8",
        "pattern_9",
        "pattern_10",
        "pattern_11",
        "pattern_12",
        "pattern_13",
        "pattern_14",
        "pattern_15",
        "pattern_16",
        "pattern_17",
    ];
    
    static const patterns_descr = [
        patterns_st1_descr,
        patterns_st2_descr,
        patterns_st3_descr,
        patterns_st4_descr,
        patterns_st5_descr,
        patterns_st6_descr,
        patterns_st7_descr,
        patterns_st8_descr,
        patterns_st9_descr,
        patterns_st10_descr,
        patterns_st11_descr,
        patterns_st12_descr,
        patterns_st13_descr,
        patterns_st14_descr,
        patterns_st15_descr,
        patterns_st16_descr,
        patterns_st17_descr,
    ];

    static const patterns_url = [
        patterns_st1_url,
        patterns_st2_url,
        patterns_st3_url,
        patterns_st4_url,
        patterns_st5_url,
        patterns_st6_url,
        patterns_st7_url,
        patterns_st8_url,
        patterns_st9_url,
        patterns_st10_url,
        patterns_st11_url,
        patterns_st12_url,
        patterns_st13_url,
        patterns_st14_url,
        patterns_st15_url,
        patterns_st16_url,
        patterns_st17_url,
    ];

    static const patterns_comment = [
        patterns_st1_comment,
        patterns_st2_comment,
        patterns_st3_comment,
        patterns_st4_comment,
        patterns_st5_comment,
        patterns_st6_comment,
        patterns_st7_comment,
        patterns_st8_comment,
        patterns_st9_comment,
        patterns_st10_comment,
        patterns_st11_comment,
        patterns_st12_comment,
        patterns_st13_comment,
        patterns_st14_comment,
        patterns_st15_comment,
        patterns_st16_comment,
        patterns_st17_comment,
    ];


    static const patterns_st1_title = "1. Точки";
    static const patterns_st1_descr = """
    <p>Еще больше узоров вы можете найти на сайте <a href=https://speedcubing.ru/tutorial/3x3x3/patterns>speedcubing.ru</a>.</p>

    <p><a href="rg2://ytplay?time=1:01&link=l6V7517N_lQ">Первый узор</a> - точки разного цвета на
    каждой грани. Один из самых простых алгоритмов. Крутим сначала одну, потом другую среднюю грань
    (без разницы какую), а потом возвращаем их обратно. Если получилась красная точка на белой грани,
    то она напоминает \"вишенку\" на торте.</p>

    <p style="text-align:center"><img src="pattern_1.xml"></p>
    <p><b><a href="rg2://ytplay?time=1:16&link=l6V7517N_lQ&alg=S\'_M\'_S_M">Алгоритм:</a> S\' M\' S M</b></p>

    <p>Ну а если вращать противоположные грани в разные стороны а не в одну относительно средней,
        то можно получить такой вот \"Ход конем\".</p>
    <p style="text-align:center"><img src="pattern_1_1.xml"></p>
    <p><b><a href="rg2://ytplay?time=1:16&link=l6V7517N_lQ&alg=(R_L)_(U_D)_(F\'_B\')_(R\'_L\')">Алгоритм:</a> (R L) (U D) (F\' B\') (R\' L\')</b></p>

    <p>P.S. На базе этих двух узоров можно придумать много других, но пожалуйста, не надо мне их
        присылать, добавить в программу все варианты просто невозможно.</p>

    <p>Если взять кубик синей стороной на себя, а желтой вверх и выполнить <b>R\' L2 U M B2 M\'</b>,
    то можно получить значек Google на передней грани.</p>

    <p style="text-align:center"><img src="pattern_1_2.xml"></p>
    """;
    static const patterns_st1_url = "l6V7517N_lQ";
    static const patterns_st1_comment = "S\' M\' S M";


    static const patterns_st2_title = "2. Шахматы";
    static const patterns_st2_descr = """
    <p><a href="rg2://ytplay?time=1:30&link=l6V7517N_lQ">Второй узор,</a> пожалуй еще проще первого,
    если выполнять, через вращение средних слоев. А смотрится, пожалуй, даже эффектнее предыдущего.
    Просто вращаем каждый средний слой по два раза или вращаем каждую грань по два раза, но в этом
    случае вращать надо парами (правую с левой, верхню с нижней, заднюю с передней).</p>
    <p style="text-align:center"><img src="pattern_2.xml"></p>
    <p><b><a href="rg2://ytplay?time=1:41&link=l6V7517N_lQ&alg=R2_L2_U2_D2_F2_B2">Алгоритм:</a> R2 L2 U2 D2 F2 B2</b> или <b>M2 S2 E2</b></p>

    <p>Но шахматы могут быть не только такими простыми, но и немного сложнее. В этом узоре цвета на
    одной грани уже будут не противоположные, а смежные. Получим
    <a href="rg2://ytplay?time=1:53&link=l6V7517N_lQ">\"Шахматы 3-го пордяка\".</a></p>
    <p style="text-align:center"><img src="pattern_2_1.xml"></p>

    <p><b><a href="rg2://ytplay?time=2:10&link=l6V7517N_lQ&alg=(U2_M2_U_M2_U2_S2_D\'_S2)_z_(U2_M2_U_M2_U2_S2_D\'_S2)_(M\'_S\'_M_S)">Алгоритм:</a> (U2 M2 U M2 U2 S2 D\' S2) z (U2 M2 U M2 U2 S2 D\' S2) (M\' S\' M S)</b></p>

    <p>А если к этому алгоритму еще добавить и простые шахматы, то получим
    <a href="rg2://ytplay?time=3:03&link=l6V7517N_lQ">\"Шахматы 6-го порядка.\"</a></p>
    <p style="text-align:center"><img src="pattern_2_2.xml"></p>
    <p><b><a href="rg2://ytplay?time=3:06&link=l6V7517N_lQ&alg=(U2_M2_U_M2_U2_S2_D\'_S2)_z_(U2_M2_U_M2_U2_S2_D\'_S2)_(M\'_S\'_M_S)_(M2_E2_S2)">Алгоритм:</a> (U2 M2 U M2 U2 S2 D\' S2) z (U2 M2 U M2 U2 S2 D\' S2) (M\' S\' M S) (M2 E2 S2)</b></p>
    """;
    static const patterns_st2_url = "l6V7517N_lQ";
    static const patterns_st2_comment = "M2 S2 E2";

    static const patterns_st3_title = "3. Кубики";
    static const patterns_st3_descr = """
    <p>Непростой, но очень эффектный узор. Создается впечатление, что внутри кубика 3х3 есть
    <a href="rg2://ytplay?time=3:23&link=l6V7517N_lQ">еще один кубик 2x2.</a></p>
    <p style="text-align:center"><img src="pattern_3.xml"></p>
    <p><b><a href="rg2://ytplay?time=3:40&link=l6V7517N_lQ&alg=U2_F2_R2_U\'_L2_D_B_R\'_B_R\'_B_R\'_D\'_L2_U\'">Алгоритм:</a> U2 F2 R2 U\' L2 D B R\' B R\' B R\' D\' L2 U\'</b></p>

    <p>А если не крутить крышу в самом начале, то получится вот такой \"Разноцветный куб в кубе\", к
    сожалению узор не симметричный и такой кубик только на обратной стороне. Никита, спасибо за идею.</p>
    <p style="text-align:center"><img src="pattern_3_5.xml"></p>

    <p>Алгоритм: F2 R2 U\' L2 D B R\' B R\' B R\' D\' L2 U\' (y2 x)</p>

    <p>А можно сделать и кубик 1х1, другое название этого узора - \"Мезон\"</p>
    <p style="text-align:center"><img src="pattern_3_1.xml"></p>
    <p><b><a href="rg2://ytplay?time=4:27&link=l6V7517N_lQ&alg=(U\'_B2_U_L\'_F2_L)_(U\'_B2_U_L\'_F2_L)">Алгоритм:</a> (U\' B2 U L\' F2 L) (U\' B2 U L\' F2 L)</b></p>

    <p>А если их объединить, то получится <a href="rg2://ytplay?time=4:24&link=l6V7517N_lQ">\"Кубик в кубе в кубе\"</a></p>
    <p style="text-align:center"><img src="pattern_3_2.xml"></p>

    <p>Или можно сделать этот узор в один алгоритм:</p>
    <p><b><a href="rg2://ytplay?time=5:00&link=l6V7517N_lQ&alg=U\'_L2_F2_D\'_L\'_D_U2_R_U\'_R\'_U2_R2_U_F\'_L\'_U_R\'">Алгоритм:</a> U\' L2 F2 D\' L\' D U2 R U\' R\' U2 R2 U F\' L\' U R\'</b></p>

    <p>А если сделать \"Мезон\" еще раз, то получатся \"Кольца\". Ну или можно их сделать в один алгоритм.</p>
    <p style="text-align:center"><img src="pattern_3_3.xml"></p>

    <p><b><a href="rg2://ytplay?time=5:31&link=l6V7517N_lQ&alg=(U\'_B2_U_L\'_F2_L)(U\'_B2_U_L\'_F2_L)">Алгоритм:</a> (U\' B2 U L\' F2 L)(U\' B2 U L\' F2 L)</b></p>

    <p>Ну а если еще переставить ребра, то можно получить и вот такой узор. Спасибо Хахулину Даниилу за идею.</p>
    <p style="text-align:center"><img src="pattern_3_4.xml"></p>

    <p><b><a href="rg2://ytplay?time=5:31&link=l6V7517N_lQ&alg=B_D_F\'_B\'_D_L2\'_U_L_U\'_B_D\'_R_B_R_D\'_R_L\'_F_U2_D">Алгоритм:</a> B D F\' B\' D L2\' U L U\' B D\' R B R D\' R L\' F U2 D</b></p>

    <p>Вот еще узор похожий на кубик в кубе - \"Буквы Р\". Спасибо Мише Flex.</p>
    <p style="text-align:center"><img src="pattern_3_7.xml"></p>

    <p><b>Алгоритм: F R\' U L F\' L\' F U\' R U L\' U\' L F\'</b></p>

    <p>И не могу сюда не добавить узор от Виктора Фроста, который можно назвать \"Кубоид в кубе\". Ну
    а как он выглядит с другой стороны, предлагаю вам узнать самим.</p>
    <p style="text-align:center"><img src="pattern_3_6.xml"></p>

    <p><b>Алгоритм: L2 B2 D\' B2 D L2 U R2 D R2 B U R\' F2 R U\' B\' U\'</b></p>
    """;
    static const patterns_st3_url = "l6V7517N_lQ";
    static const patterns_st3_comment = "U2 F2 R2 U\' L2 D B R\' B R\' B R\' D\' L2 U\'";

    static const patterns_st4_title = "4. Змеи";
    static const patterns_st4_descr = """
    <p>Еще один очень красивый узор. <a href="rg2://ytplay?time=5:57&link=l6V7517N_lQ">Змейка</a> через весь кубик.</p>
    <p style="text-align:center"><img src="pattern_4.xml"></p>
    <p><b><a href="rg2://ytplay?time=6:27&link=l6V7517N_lQ&alg=U_B2_L_D_B\'_F_L\'_D__U\'_L\'_R_F\'_D2_R\'">Алгоритм:</a> U B2 L D B\' F L\' D  U\' L\' R F\' D2 R\'</b></p>

    <p>Или другой вариант Змейки:</p>
    <p style="text-align:center"><img src="pattern_4_1.xml"></p>
    <p><b><a href="rg2://ytplay?time=7:02&link=l6V7517N_lQ&alg=(R_F_B\'_D\')_F2_(D_B_F\'_R\')_F2_(U_R2_U\')_(D_F2_D\')">Алгоритм:</a> (R F B\' D\') F2 (D B F\' R\') F2 (U R2 U\') (D F2 D\')</b></p>

    <p>А если сделать вот так, то такая змейка не будет замыкаться</p>
    <p style="text-align:center"><img src="pattern_4_5.xml"></p>
    <p><b>Алгоритм: D\' U2 L D F U\' L\' R F R\' F\' U\' F\'</b></p>

    <p>Узор, который тоже можно отнести к змейкам, ведь он идет через весь кубик.</p>
    <p style="text-align:center"><img src="pattern_4_2.xml"></p>

    <p><b>Алгоритм: D L\' U R\' B\' R B U2 D B D\' B\' L U D\'</b></p>

    <p>Еще одна змея от Ненастина Савелия, которую я бы назвал \"УглоЗмейка\"</p>

    <p style="text-align:center"><img src="pattern_4_3.xml"></p>

    <p><b>Алгоритм: L2 D B2 U R2 B2 D L\' B2 F\' D\' U R\' D2 R\' B2 F\' U\' F\'</b></p>

    <p>Ну и можно сделать вот такой простой алгоритм, который мне прислал Сальников Роман, и получить \"Змейку на минималках\".</p>

    <p style="text-align:center"><img src="pattern_4_4.xml"></p>

    <p><b>Алгоритм: L2 U2 F2 D F2 R2 D2 F2 R2 U F2 L2 U2 R2 U\'</b></p>

    """;
    static const patterns_st4_url = "l6V7517N_lQ";
    static const patterns_st4_comment = "U B2 L D B\' F L\' D  U\' L\' R F\' D2 R\'";

    static const patterns_st5_title = "5. Кресты";
    static const patterns_st5_descr = """
    <p><a href="rg2://ytplay?time=7:34&link=l6V7517N_lQ">Крест</a> на каждой стороне кубика.</p>
    <p style="text-align:center"><img src="pattern_5.xml"></p>

    <p><b><a href="rg2://ytplay?time=7:54&link=l6V7517N_lQ&alg=L2_R\'_B2_F2_D2_B2_F2_L2_R2_U2_R\'">Алгоритм:</a> L2 R\' B2 F2 D2 B2 F2 L2 R2 U2 R\'</b></p>

    <p>Еще один крест, уголки которого <a href="rg2://ytplay?time=7:34&link=l6V7517N_lQ">стоят иначе.</a></p>
    <p style="text-align:center"><img src="pattern_5_1.xml"></p>

    <p><b><a href="rg2://ytplay?time=8:29&link=l6V7517N_lQ&alg=U_F_B\'_L2_U2_L2_F\'_B_U2_L2_U">Алгоритм:</a> U F B\' L2 U2 L2 F\' B U2 L2 U</b></p>

    <p>А можно переставить только углы и получить, по сути, тоже разновидность \"Креста\",
    которую мне прислал Хэкскубер, получим \"Пьяные углы\".</p>

    <p style="text-align:center"><img src="pattern_5_2.xml"></p>

    <p><b>Алгоритм: F2 L2 F2 D U B2 R2 F2 L2 D\' U\' L B2 F2 D2 U2 R\'</b></p>

    """;
    static const patterns_st5_url = "l6V7517N_lQ";
    static const patterns_st5_comment = "L2 R\' B2 F2 D2 B2 F2 L2 R2 U2 R\'";

    static const patterns_st6_title = "6. Молнии";
    static const patterns_st6_descr = """
    <p>Очень интересный и <a href="rg2://ytplay?time=8:58&link=l6V7517N_lQ">необычный узор,</a>
        которого вы не найдете на сайте <a href=https://speedcubing.ru/tutorial/3x3x3/patterns>speedcubing.ru</a>.
        Его мне прислал Дмитрий Константинов, за что ему большое спасибо.</p>
    <p style="text-align:center"><img src="pattern_6.xml"></p>
    <p><b><a href="rg2://ytplay?time=9:17&link=l6V7517N_lQ&alg=(R2_F_B\'_R2_U\'D)(R2_F_B\'_R2_U\'D)(R2_F_B\'_R2_U\'D)">Алгоритм:</a> (R2 F B\' R2 U\'D)(R2 F B\' R2 U\'D)(R2 F B\' R2 U\'D)</b></p>

    <p>Если использовать двойные вращения граней, такие как (R2 F2 B2) или вращения противоположных
    граней в разные стороны, такие как (D\'U\' FB LR), то можно получить много разных довольно интересных
    узоров, например:</p>
    <p style="text-align:center"><img src="pattern_6_1.xml"></p>
    <p>Алгоритм: <b>F2 R2 D\'U\' (R2 B2 L2 F2) DU F2 R2</b></p>

    <p>Или вот такой:</p>
    <p style="text-align:center"><img src="pattern_6_2.xml"></p>
    <p>Алгоритм: <b>(R L) U2 F2 D2 F2 (R L) F2 D2 B2 D2</b></p>

    <p>Ну или еще один вариант, основаный на движениях противоположных граней в разные стороны, который
    мне в различных вариантах присылали очень много раз, и на основе которого, также можно придумать
    другие узоры.</p>
    <p style="text-align:center"><img src="pattern_6_3.xml"></p>

    <p>Алгоритм: <b>(R L)(U D) (R L)(U D) (R L)(U D)</b></p>

     <p>P.S. Спасибо всем приславшим подобные узоры, особенно Диме Юрченко, но к сожалению, все такие
     узоры добавить в программу просто нереально, поэтому, надеюсь, что остальные узоры основанные на
     этих вращениях вы сможете сделать/придумать сами.</p>
    """;
    static const patterns_st6_url = "l6V7517N_lQ";
    static const patterns_st6_comment = "(R2 F B\' R2 U\'D)3";

    static const patterns_st7_title = "7. Уголки";
    static const patterns_st7_descr = """
    <p>Еще одна серия узоров - <a href="rg2://ytplay?time=9:50&link=l6V7517N_lQ">Уголки.</a><br/>
        Первый уголок:</p>

    <p style="text-align:center"><img src="pattern_7.xml"></p>

    <p><b><a href="rg2://ytplay?time=10:05&link=l6V7517N_lQ&alg=F2_R2_D_R2_D_U_F2_D\'_R\'_D\'_F_L2_F\'_D_R_U\'">Алгоритм:</a> F2 R2 D R2 D U F2 D\' R\' D\' F L2 F\' D R U\'</b></p>

    <p><a href="rg2://ytplay?time=10:36&link=l6V7517N_lQ">Второй уголок:</a></p>

    <p style="text-align:center"><img src="pattern_7_1.xml"></p>

    <p><b><a href="rg2://ytplay?time=10:52&link=l6V7517N_lQ&alg=U_L2_D_F_D\'_B\'_U_L\'_B2_U2_F_U\'_F\'_U2_B\'_U\'">Алгоритм:</a> U L2 D F D\' B\' U L\' B2 U2 F U\' F\' U2 B\' U\'</b></p>

    <p>А если кроме ребер и угла, еще поменять и центры, то можно получить вот такой
    <a href="rg2://ytplay?time=11:24&link=l6V7517N_lQ">Пропеллер.</a></p>
    <p style="text-align:center"><img src="pattern_7_2.xml"></p>
    <p><b><a href="rg2://ytplay?time=11:40&link=l6V7517N_lQ&alg=U\'_L2_U2_R2_U\'_B2_L\'_B_D_R\'_B\'_L\'_B\'_D2_B\'_L_D_B\'_U">Алгоритм:</a> U\' L2 U2 R2 U\' B2 L\' B D R\' B\' L\' B\' D2 B\' L D B\' U</b></p>

    <p>А можно еще развернуть ребра, спасибо Жене Долонову за идею.</p>
    <p style="text-align:center"><img src="pattern_7_8.xml"></p>
    <p><b>Алгоритм: F U\' D\' R\' D B\' L2 F D B U\' F2 D2 F2 R2 B2 R2 F2 U\' L2 U\'</b></p>

    <p>Еще можно выполнить вот такой алгоритм, получится интересный, но не симметричный узор. С одной
    стороны длинные уголки, а с другой четыре уголка не на своих местах.</p>
    <p style="text-align:center"><img src="pattern_7_3.xml"></p>
    <p><b>Алгоритм: (R\' U R\' D)(F D2 F\' D) R2 (U L2) (U L2) U</b></p>

    <p>Еще один вариант уголков от пользователя Gros Lep.</p>
    <p style="text-align:center"><img src="pattern_7_4.xml"></p>

    <p><b>Алгоритм: U\' D B R\' F R B\' L\' F\' B L F R\' B\' R F\' U\' D</b></p>

    <p>Или вот такой уголок от Петра Петрова.</p>
    <p style="text-align:center"><img src="pattern_7_5.xml"></p>

    <p><b>Алгоритм: U\' R2 D\' B\' D R\' D\' B D R\' U</b></p>

    <p>А если к нему добавить вишенку: <b>M\' S\' M S</b>, то получатся вот такие буквы М.</p>
    <p style="text-align:center"><img src="pattern_7_6.xml"></p>

    <p>Ну и еще один узор, который на первый взгляд похож на кресты, но на самом деле является
    вариантом перестановки углов - \"Пьяные углы\" от Хэкскубера.</p>
    <p style="text-align:center"><img src="pattern_7_7.xml"></p>

    <p><b>Алгоритм: F2 L2 F2 D U B2 R2 F2 L2 D\' U\' L B2 F2 D2 U2 R\'</b></p>

    """;
    static const patterns_st7_url = "l6V7517N_lQ";
    static const patterns_st7_comment = "F2 R2 D R2 D U F2 D\' R\' D\' F L2 F\' D R U\'";

    static const patterns_st8_title = "8. Буквы П";
    static const patterns_st8_descr = """
        <p>Для начала <a href="rg2://ytplay?time=12:17&link=l6V7517N_lQ">короткий вариант \"Буквы П\",</a>
        в котором цвета на одной грани противоположны друг другу.</p>
        <p style="text-align:center"><img src="pattern_8.xml"></p>
        <p><b><a href="rg2://ytplay?time=12:26&link=l6V7517N_lQ&alg=M2_D\'_M2_D2_M2_U\'_S2_E">Алгоритм:</a> M2 D\' M2 D2 M2 U\' S2 E</b></p>

        <p>Немного другой вариант <a href="rg2://ytplay?time=12:43&link=l6V7517N_lQ">четырех букв П,</a>
        в котором цвета получаются смежные. Очень легкий для запоминания алгоритм, надо всего лищь
        7 раз выполнить пиф-паф/перехват. Если повторить данный алгоритм еще раз, то получится
        предыдущий вариант.</p>
        <p style="text-align:center"><img src="pattern_8_1.xml"></p>
        <p><b><a href="rg2://ytplay?time=12:55&link=l6V7517N_lQ">Алгоритм:</a>
        (R U R\' U\') y (R U R\' U\') y (R U R\' U\') y (R U R\' U\') y (R U R\' U\') y (R U R\' U\') y (R U R\' U\') y</b></p>

        <p>Ну и еще один вариант - буква П на каждой из шести граней.</p>
        <p style="text-align:center"><img src="pattern_8_3.xml"></p>
        <p><b>Алгоритм: U R2 B M\' B\' L\' R\' B\' D\' F\' M F U</b></p>

        <p>А если совместить первый узор с Шахматами, то получится \"Шахматы и тетрис\". Вадим,
        спасибо за идею.</p>
        <p style="text-align:center"><img src="pattern_8_2.xml"></p>
        <p><b>Алгоритм: (E2 S2) (D\' M2 D2 M2 U\' S2 E)</b></p>
    """;
    static const patterns_st8_url = "l6V7517N_lQ";
    static const patterns_st8_comment = "((R U R\' U\') y)7";

    static const patterns_st9_title = "9. Полоски";
    static const patterns_st9_descr = """
    <p>Еще одна большая группа узоров - <a href="rg2://ytplay?time=13:21&link=l6V7517N_lQ">\"Полоски\".</a>
        Немного больше вы можете найти на сайте <a href=https://speedcubing.ru/tutorial/3x3x3/patterns>speedcubing.ru.</a>
        Начнем с очень простого варианта, который мне прислал Егор.</p>
    <p style="text-align:center"><img src="pattern_9.xml"></p>

    <p><b><a href="rg2://ytplay?time=12:55&link=l6V7517N_lQ&alg=R2_F2_M2_B2_L2">Алгоритм:</a> R2 F2 M2 B2 L2</b></p>

    <p>Все полоски <a href="rg2://ytplay?time=13:43&link=l6V7517N_lQ">разного цвета:</a></p>

    <p style="text-align:center"><img src="pattern_9_1.xml"></p>
    <p><b><a href="rg2://ytplay?time=13:49&link=l6V7517N_lQ">Алгоритм:</a>
    (R2 F D R2 D\' R B2 R\' D R2 D\' F\') (R2 B2) y2 (R2 F D R2 D\' R B2 R\' D R2 D\' F\') (L2 F2) M2 S2</b></p>

    <p>А можно сделать и полоски на всех <a href="rg2://ytplay?time=15:22&link=l6V7517N_lQ">шести гранях</a></p>

    <p style="text-align:center"><img src="pattern_9_2.xml"></p>
    <p><b><a href="rg2://ytplay?time=15:25&link=l6V7517N_lQ">Алгоритм:</a>
    U\' B2 L2 U M2 U\' R2 F2 D F B R E R\' B\' R\' E R2 E\' R\' F\' B2 R2 B2 F2 S</b></p>

    <p>Ну и раздел с полосками был бы неполным без простого алгоритма для создания флага РФ на одной
    из сторон кубика, хотя на других сторонах при этом и получается какой-то бред.</p>

    <p>Кубик надо держать стандартно, т.е. зеленой к себе, белой вверх. Получится Российский флаг
    на верхней стороне кубика. Спасибо Ренату Каримову за идею.</p>

    <p style="text-align:center"><img src="pattern_9_3.xml"></p>

    <p>Алгоритм: <b>M D\' F L2 F\' L</b></p>

    <p>А можно собрать не три полоски, а только три стороны. Спасибо Stickman animation.</p>

    <p style="text-align:center"><img src="pattern_9_4.xml"></p>

    <p>Алгоритм: <b>U\' D L2 U B2 D2 B2 D2 L F\' U D\' R U\' F2 L F\' B\'</b></p>
    """;

    static const patterns_st9_url = "l6V7517N_lQ";
    static const patterns_st9_comment = "R2 F2 M2 B2 L2";

    static const patterns_st10_title = "10. Двойные вращения";
    static const patterns_st10_descr = """
        <p>Подобных узоров, которые получаются при помощи только двойных вращений каких-либо граней,
        существует огромное множество. Все их, к сожалению, в программе привести нет никакой возможности,
        поэтому, приведу лишь один, очень <a href="rg2://ytplay?time=16:15&link=l6V7517N_lQ">простой узор,</a>
        которого нет на сайте <a href=https://speedcubing.ru/tutorial/3x3x3/patterns>speedcubing.ru</a>.</p>
        <p style="text-align:center"><img src="pattern_10.xml"></p>

        <p><b><a href="rg2://ytplay?time=16:34&link=l6V7517N_lQ&alg=U2_(B2_F2)_L2_R2">Алгоритм:</a> U2 (B2 F2) L2 R2</b> или <b>U2 S2 M2</b></p>

        <p>А вставив между двойныйми вращениями несколько одинарных можно получить и что-то поинтереесней,
        например, вот такие \"Стрелки\". Спасибо за узор Адриану Гнура.</p>
        <p style="text-align:center"><img src="pattern_10_1.xml"></p>

        <p>Алгоритм: <b>D L2 B2 D2 F2 R2 D2 L2 D\' U R2 U\'</b></p>

        <p>Или можно использовать технику вращений противоположных граней в противоположные стороны
        из \"Рыбок\" и сделать этот узор так:</p>

        <p>Алгоритм: <b>y (F B L R)3 D2 y\'</b></p>
    """;
    static const patterns_st10_url = "l6V7517N_lQ";
    static const patterns_st10_comment = "U2 B2 F2 L2 R2";

    static const patterns_st11_title = "11. Рыбки";
    static const patterns_st11_descr = """
        <p>Сначала об узоре с очень <a href="rg2://ytplay?time=16:44&link=l6V7517N_lQ">необчной рыбкой.</a>
        Кто-то в нем видит буквамы С, Р, Т и Г на
        боковых гранях, но если присмотреться, то буквы Т и Р образуют на грани кубика
        \"Рыбку\", поэтому авторское название узора - \"Рыбка на грани\". Спасибо Дмитрию
        Константинову за присланный узор.</p>
        <p style="text-align:center"><img src="pattern_11.xml"></p>
        <p><b><a href="rg2://ytplay?time=17:08&link=l6V7517N_lQ&alg=D_(L\'_R\')_U2_(L_R)_D">Алгоритм:</a> D (L\' R\') U2 (L R) D</b></p>

        <p>Ну а можно сделать <a href="rg2://ytplay?time=17:26&link=l6V7517N_lQ">Рыбок на каждой грани.</a></p>
        <p style="text-align:center"><img src="pattern_11_1.xml"></p>
        <p><b><a href="rg2://ytplay?time=17:34&link=l6V7517N_lQ&alg=U_F2_U\'_B\'_U2_B_U\'_F2_U\'_R\'_U2_B\'_U2_B_R">Алгоритм:</a> U F2 U\' B\' U2 B U\' F2 U\' R\' U2 B\' U2 B R</b></p>

        <p>А используя \"технику\" из первого узора, можно сделать и такой узор.</a></p>
        <p style="text-align:center"><img src="pattern_11_2.xml"></p>
        <p><b>Алгоритм: U2 (R L\') U2 (R\' L) U2 (R L\') U2 (R\' L)</b></p>

    """;
    static const patterns_st11_url = "l6V7517N_lQ";
    static const patterns_st11_comment = "D L\' R\' U2 L R D";

    static const patterns_st12_title = "12. Буквы Н";
    static const patterns_st12_descr = """
        <p>Очень простой узор, <a href="rg2://ytplay?time=18:00&link=l6V7517N_lQ">буквы Н</a>
        только на двух гранях. А если взять кубик стандартно,
        белой вверх, зеленой к себе, то получится эмблема ФБК. Спасибо Виктору Рудневу за присланный узор.</p>
        <p style="text-align:center"><img src="pattern_12.xml"></p>
        <p><b><a href="rg2://ytplay?time=18:15&link=l6V7517N_lQ&alg=U2_F\'_R2_D2_L2_B2_U2_L2_D2_F\'_U2">Алгоритм:</a> U2 F\' R2 D2 L2 B2 U2 L2 D2 F\' U2</b></p>

        <p>А если немного модифицировать шахматы, то легко получить Шесть букв Н</p>
        <p style="text-align:center"><img src="pattern_12_1.xml"></p>
        <p><b>Алгоритм: D2 M\' S2 M U2</b></p>

        <p>P.S. В принципе, \"буквы Н\" можно отнести к узорам состоящим из двойных вращений, поэтому приведу лишь
        три базовых алгоритма <b>(R2 U2)3, (R2 U2 L2 U2)3</b> и <b>(U2 M2)2</b> используя которые,
        можно придумать множество различных узоров в которых углы остаются на своих местах, а ребра
        меняются местами.
        </p>
    """;
    static const patterns_st12_url = "l6V7517N_lQ";
    static const patterns_st12_comment = "U2 F\' R2 D2 L2 B2 U2 L2 D2 F\' U2";

    static const patterns_st13_title = "13. Реверс";
    static const patterns_st13_descr = """
        <p>Ситуация, когда все элементы (ребра и углы) находятся на своих местах, но все ребра перевернуты.
        Узором такую ситуацию можно назвать лишь \"с натяжкой\", но есть у этого узора одна \"фишка\" -
        это ЕДИНСТВЕННАЯ ситуация в кубике Рубика 3х3, которую НЕВОЗМОЖНО решить, меньше чем за
        20 ходов. Любую другую ситуацию можно решить за 19 ходов или меньше.</p>

        <p style="text-align:center"><img src="pattern_13.xml"></p>

        <p><b>Алгоритм: U R U2 R F2 L U2 R F\' B\' R2 D R\' L U2 F2 D2 F R2 D</b></p>
    """;
    static const patterns_st13_url = "l6V7517N_lQ";
    static const patterns_st13_comment = "U R U2 R F2 L U2 R F\' B\' R2 D R\' L U2 F2 D2 F R2 D";

    static const patterns_st14_title = "14. Подарок с бантиком";
    static const patterns_st14_descr = """
        <p>Еще один узор от пользователя программы Old Foxy. Напоминает красивую полосатую коробку
        перевязанную ленточкой с бантиком, отсюда и название.</p>

        <p style="text-align:center"><img src="pattern_14.xml"></p>

        <p><b>Алгоритм: B2 L2 U F2 U\' F2 R2 D\' R2 B2 F\' L\' U L2 U\' L F U\'</b></p>
    """;
    static const patterns_st14_url = "l6V7517N_lQ";
    static const patterns_st14_comment = "B2 L2 U F2 U\' F2 R2 D\' R2 B2 F\' L\' U L2 U\' L F U\'";

    static const patterns_st15_title = "15. Цветомузыка";
    static const patterns_st15_descr = """
    <p>Еще один не совсем узор, а скорее просто интересная ситуация - ни на одной стороне нет ни одного блока.</p>

    <p style="text-align:center"><img src="pattern_15.xml"></p>

    <p>Алгоритм: <b>(F B L R) (F B L R) L R</b></p>

    """;
    static const patterns_st15_url = "l6V7517N_lQ";
    static const patterns_st15_comment = "(F B L R)2 L R";

    static const patterns_st16_title = "16. Авангардизм";
    static const patterns_st16_descr = """
    <p>Иногда мне присылают очень непонятные узоры, которые и узорами то не всегда можно назвать, но
        кого-то может они и сподвигнут на разглядывание кубика часами.</p>
    <p>Я не буду указывать авторство этих узоров, чтобы не провоцировать новую волну, больше я
        такие узоры добавлять не буду. Надеюсь, авторы меня за это простят.</p>

    <p>Начну, пожалуй, с \"Больших блоков в окружении\".</p>
    <p style="text-align:center"><img src="pattern_16.xml"></p>

    <p>Алгоритм: <b>U B2 D2 L B\' L\' U\' L\' B D2 B2 </b></p>

    <p>Или вот еще \"Кубик на дискотеке\".</p>
    <p style="text-align:center"><img src="pattern_16_1.xml"></p>

    <p>Алгоритм: <b>R\' F\' U F2 U\' F R\' F2 D2 F2 D2 F2 D F2 R2 U2</b></p>

    <p>Ну и два шедевра:</p>
    <p>\"Порядок в хаосе\".</p>
    <p style="text-align:center"><img src="pattern_16_2.xml"></p>

    <p>Алгоритм: <b>B L2 B\' U2 B F2 U L U B U\' R U\' B F U\' R D R B\' U\'</b></p>

    <p>И \"Угловые кольца\"</p>
    <p style="text-align:center"><img src="pattern_16_3.xml"></p>

    <p>Алгоритм: <b>D L2 U B2 R2 F2 U\' B2 D\' L2 B\' R2 D\' U B2 R\' B\' F\' L F2 U\'</b></p>
    """;
    static const patterns_st16_url = "l6V7517N_lQ";
    static const patterns_st16_comment = "B L2 B\' U2 B F2 U L U B U\' R U\' B F U\' R D R B\' U\'";


    static const patterns_st17_title = "17. Свой алгоритм/узор";
    static const patterns_st17_descr = """
    <p>Если у вас есть свой алгоритм для какого-то из выше приведенных узоров, то всегда можете
        написать его в поле \"Свой комментариий (алгоритм):\" к соответствующему этапу (ниже видео)
        и он отобразится в списке.</p>

    <p>А если у вас есть какой-то узор и:<br/><br/>
        1. Узора <b>нет на сайте <a href=https://speedcubing.ru/tutorial/3x3x3/patterns>speedcubing.ru</a></b><br/>
        2. Узора нет в программе<br/>
        3. В узоре БОЛЬШЕ 6 ходов<br/>
        4. Это <b>НЕ простой</b> узор состоящий только из двойных ходов, типа (R2 U2 L2 U2)3 или
        вращений противоположных граней (RL FB)3 (см. текст к узору \"Молния в точку\")<br/>
        5. Это <b>НЕ вариации</b> различных \"Букв Н\" или \"Крестов\"<br/>
        6. Узор состоит <b>НЕ из других</b> простых узоров.<br/>
        7. В узоре меняются местами НЕ ТОЛЬКО ребра, но и углы.<br/>
        8. Достаточно Авангарда, узор должен быть узором, а не просто скрамблом.</p>

    <p>И если ваш узор соответствует всем этим требованиям, то присылайте его мне на почту
    <a href="mailto:rubicsguide@yandex.ru?subject=Узоры&body=Здравствуйте,%20Антон.">rubicsguide@yandex.ru</a>
    ОБЯЗАТЕЛЬНО с фотографией. Я стараюсь отвечать на все ваши письма.</p>

    <p>P.S. Поймите, что эти требования появились не зря, и придумать простой узор, может каждый, кто хоть
        немного увлекается этой темой. К сожалению 99% присланных мне узоров - это простые реберные узоры, которые я не
        добавляю в программу. И таких простых узоров десятки, если не сотни и все их просто
        невозможно добавить в программу.</p>
    """;
    static const patterns_st17_url = "l6V7517N_lQ";
    static const patterns_st17_comment = "";


}
