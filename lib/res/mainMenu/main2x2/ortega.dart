
import 'package:rg2_flutter_getx/models/phases.dart';

class Ortega implements Phase {
  @override
  int count = ortega_title.length;

  @override
  String phase = "ORTEGA";

  @override
  List<String> titles() => ortega_title;

  @override
  List<String> icons() => ortega_icon;

  @override
  List<String> descriptions() => ortega_descr;

  @override
  List<String> urls() => ortega_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const ortega_title = [
        ortega1_title,
        ortega2_title,
        ortega3_title,
    ];

    static const ortega_icon = [
        "ortega_1",
        "ortega_2",
        "ortega_3",
    ];

    static const ortega_descr = [
        ortega1_descr,
        ortega2_descr,
        ortega3_descr,
    ];


    static const ortega_url = [
        ortega1_url,
        ortega2_url,
        ortega3_url,
    ];

    static const ortega1_title = "Первая сторона";
    static const ortega1_descr = """
        <p>Этот метод сборки кубика 2х2 был изобретён независимо друг от друга двумя людьми:
        Victor Ortega и Josef Jelínek. Является наиболее популярным методом сборки куба 2х2
        среднего уровня. Алгоритмы из данного метода вам очень пригодятся и в дальнейшем,
        если вы будете изучать более продвинутые методы сборки CLL, EG-1, EG-2.</p>

        <p>В основе данной обучалки лежит видео от Яна Корзюка и его подборка алгоритмов для данного метода.
        Инструкции для распечатки вы можете найти в <a href="https://vk.com/rubikscube_vologda">группе VK.</a></p>

        <p>Сборку кубика данным методом можно разделить на три этапа.<br/>
        1. Сборка одной стороны (не слоя).<br/>
        2. Сборка противоположной стороны (OLL).<br/>
        3. Перестановка элементов двух слоев (PBL).</p>

        <p>На первом этапе необходимо собрать одну сторону, причем собрать целиком слой вовсе необязательно,
        более того, я бы даже сказал нежелательно. Почему? Объясню на третьем этапе сборки.
        Данный этап является абсолютно <a href="rg2://ytplay?time=1:16&link=J7hNGHsQOtI">интуитивным,</a>
        и нужно просто пробовать, собирать, смотреть
        сборки других, и у вас все получится.
        Пока же, надо понять, что любая сторона в отличие от первого слоя собирается максимум в пять ходов,
        причем, в 99% случаев вам будет достаточно четырех ходов или меньше, а собирать ее лучше всего сразу на нижней стороне кубика.
        И еще очень важное умение, которое необходимо освоить после сборки первой стороны - научится
        быстро понимать, какую пару элементов нижнего слоя
        <a href="rg2://ytplay?time=2:19&link=J7hNGHsQOtI">необходимо будет переставить</a>
        на последнем этапе. Если вы уже умеете собирать кубик 2х2 методом Фридрих, или 3х3 методом Кима или методом
        Ру, то вы уже представляете, что прежде всего надо понять есть ли где-то глазки (блок) на первом этаже.
        Если глазок нет, значит надо переставить два любых элемента по-диагонали. Если есть одни
        глазки, то два элемента, которые не входят в эти глазки. Ну и если глазок больше, чем одна штука,
        значит они со всех четырех сторон, и переставлять ничего не требуется.</p>

        <p>Небольшой совет, как легко определить ситуацию, по любым двум сторонам.<br/><br/>

        1. Если обе наклейки угла противоположным соседним наклейкам,</p>
        <p style="text-align:center"><img src="ortega_1_1.xml"></p>

        <p>значит глазок нет и нужна перестановка по-диагонали.</p>


        <p>2. Если одна наклейка противоположна, а другая смежна,</p>
        <p style="text-align:center"><img src="ortega_1_2.xml"></p>

        <p>то глазки находятся напротив той стороны, где наклейки противоположны. Т.е. в данном случае
        сзади.</p>

        <p>При сборке первой стороны старайтесь изначально взять кубик так, чтобы в том случае,
        <a href="rg2://ytplay?time=2:52&link=J7hNGHsQOtI">когда у вас получаются глазки,</a>
        они оказывались на задней стороне кубика. В этом случае вам не придется делать
        перехваты перед выполнением третьего этапа.</p>

    """;
    static const ortega1_url = "J7hNGHsQOtI";


    static const ortega2_title = "Противоположная сторона (OLL)";
    static const ortega2_descr = """
        <p>Тут все абсолютно аналогично этапу OLL из Фридрих для 2х2. Поскольку данный метод относится
        к продвинутым методам сборки, то разворачивать углы пиф-пафами мы уже не будем. Поэтому
        нам придется научится определять <a href="rg2://ytplay?time=3:52&link=J7hNGHsQOtI">7 ситуаций</a>
        и выполнять для каждой свой алгоритм. Можно использовать
        базовые алгоритмы из OLL, более быстрые варианты из CMLL, а можно и еще более быстрые варианты,
        которые приведены ниже.</p>

        <p><b>1. Рыбка (Sune)</b></p>
        <p style="text-align:center"><img src="ortega_2_1.xml"></p>

        <p>Один из базовых OLL алгоритмов как для двушки (2х2), так и для трешки (3х3). И выполняется
        соответственно так же, как и Рыбка в трешке. Очень рекомендую научится выполнять данный
        алгоритм, да и все остальные, для разных начальных положений крыши. Например, для такого положения:</p>

        <p style="text-align:center"><img src="ortega_2_2.xml"></p>
        <p>Алгоритм: <b>(R U R\' U) R U2 R\'</b></p>

        <p>Или для такого:</p>
        <p style="text-align:center"><img src="ortega_2_3.xml"></p>
        <p>Алгоритм: <b>(L U L\' U) L U2 L\'</b></p>

        <p><b>2. Акула (AntiSune)</b></p>
        <p style="text-align:center"><img src="ortega_2_4.xml"></p>

        <p>Комбинацией этого и предыдущего алгоритмов, можно решить любую OLL-ситуцию в двушке и базовую в трешке, но
        лучше все же выучить все семь базовых OLL алгоритмов и их упрощенные варианты для кубика 2х2.</p>

        <p style="text-align:center"><img src="ortega_2_5.xml"></p>
        <p>Алгоритм: <b>R\' U\' R U\' R\' U2 R</b></p>

        <p><b>3. Ушки (T-OLL)</b></p>
        <p style="text-align:center"><img src="ortega_2_6.xml"></p>

        <p>Пиф-паф, из Лондона, крышу против, В Лондон.</p>

        <p style="text-align:center"><img src="ortega_2_7.xml"></p>
        <p>Алгоритм: <b>(R U R\' U\') F\' U\' F</b></p>

        <p><b>4. Носик (L-OLL)</b></p>
        <p style="text-align:center"><img src="ortega_2_8.xml"></p>

        <p>Предыдущий алгоритм, только с двойными вращениями крыши на пиф-пафе.</p>

        <p style="text-align:center"><img src="ortega_2_9.xml"></p>
        <p>Алгоритм: <b>(R U2 R\' U2\') F\' U\' F</b></p>

        <p><b>5. Глазки (U-OLL)</b></p>
        <p style="text-align:center"><img src="ortega_2_10.xml"></p>

        <p>Делаем простую \"букву Т с точкой\".</p>

        <p style="text-align:center"><img src="ortega_2_11.xml"></p>
        <p>Алгоритм: <b>F (R U R\' U\') F\'</b></p>

        <p>А для ситуации глазками направо, вместо пиф-пафа, делаем те же ходы, но начинаем с крыши.</p>

        <p style="text-align:center"><img src="ortega_2_16.xml"></p>
        <p>Алгоритм: <b>F (U R U\' R\') F\'</b></p>

        <p><b>6. Вертолет (Pi-OLL)</b></p>
        <p style="text-align:center"><img src="ortega_2_12.xml"></p>

        <p>Делаем обычный \"Вертолет\" для трешки или обычный \"Бумеранг 2-1\".</p>

        <p style="text-align:center"><img src="ortega_2_13.xml"></p>
        <p>Алгоритм: <b>R U2\' R2\' U\' R2 U\' R2\' U2\'</b><br/>
        или <b>F (R U R\' U\')2 F\'</b></p>

        <p><b>7. НТВ+ (H-OLL)</b></p>
        <p style="text-align:center"><img src="ortega_2_14.xml"></p>

        <p>Классический вариант из трешки с тремя пиф-пафами тут не очень подходит, гораздо проще
        сделать вот такой простой пятиходовый алгоритм.</p>

        <p style="text-align:center"><img src="ortega_2_15.xml"></p>
        <p>Алгоритм: <b>R2\' U2\' R U2\' R2</b></p>

    """;
    static const ortega2_url = "J7hNGHsQOtI";

    static const ortega3_title = "Перестановка элементов (PBL)";
    static const ortega3_descr = """
        <p>Ну и теперь осталось расставить все элементы кубика <a href="rg2://ytplay?time=4:19&link=J7hNGHsQOtI">на свои места,</a>
        т.е. выполнить перестановку на обоих уровнях PBL (Permutation of Both Layers). Тут возможны всего
        восемь вариантов перестановок, если ваша ситуация не совпадает ни с одной из нижеперечисленных,
        то нужно просто довернуть крышу до нужного положения.</p>

        <p>Определить, какая перестановка нужна на верхнем слое, можно так же, как уже было описасно
        на первом этапе. По противоположности/смежности наклеек стоящих рядом с углом, на который вы смотрите.</p>

        <p>1. Начннем с ситуаций, когда нижний слой уже собран. Если вы уже умеете собирать двушку
        Фридрихом, то эти ситуации вам уже знакомы, но для метода Ортега они являются самыми
        неудобными, т.к. решаются самыми длинными алгоритмами, именно поэтому, сборка слоя
        целиком на первом этапе является не лучшим вариантом.</p>

        <p><a href="rg2://ytplay?time=4:26&link=J7hNGHsQOtI"><b>1.1. PBL #1</b></a></p>

        <p>Можно выполнить обычный Запад или Юг. А можно вот такой Юг, без вращений передней грани,
        но с вращением левой.</p>
        <p style="text-align:center"><img src="ortega_3_1.xml"></p>
        <p><a href="rg2://ytplay?time=4:31&link=J7hNGHsQOtI&alg=R_U2_R\'_U\'_R_U2_L\'_U_R\'_U\'_L">Алгоритм:</a> <b>R U2 R\' U\' R U2 L\' U R\' U\' L</b></p>

        <p>А для ситуации, когда глазки смотрят от нас, можно применить вот такой алгоритм.</p>
        <p style="text-align:center"><img src="ortega_3_9.xml"></p>
        <p><a href="rg2://ytplay?time=4:46&link=J7hNGHsQOtI&alg=(R\'_F)_R\'_F2_R_U\'_R\'_F2_R2">Алгоритм:</a> <b>(R\' F) R\' F2 R U\' R\' F2 R2</b></p>

        <p><a href="rg2://ytplay?time=4:59&link=J7hNGHsQOtI"><b>1.2. PBL #2</b></a></p>

        <p>Обычная Австралия или ее двушечный вариант.</p>
        <p style="text-align:center"><img src="ortega_3_2.xml"></p>
        <p>Алгоритм: <b>(F R) (U\' R\' U\' R U R\' F\') (R U R\' U\') (R\' F R F\')</b><br/>
        или <a href="rg2://ytplay?time=4:59&link=J7hNGHsQOtI">алгоритм:</a> <b>(R U\' R\' U\') F2 (U\' R U R\') D R2</b></p>

        <p><a href="rg2://ytplay?time=6:11&link=J7hNGHsQOtI">2. Глазки на нижнем слое.</a></p>

        <p><a href="rg2://ytplay?time=6:23&link=J7hNGHsQOtI"><b>2.1. PBL #3</b></a></p>

        <p>Самый часто попадающийся случай - снизу глазки и сверху глазки. Ставим обоими глазками
        от себя.</p>
        <p style="text-align:center"><img src="ortega_3_3.xml"></p>
        <p><a href="rg2://ytplay?time=6:38&link=J7hNGHsQOtI&alg=R2_U\'_(R2_U2_F2)_U\'_R2">Алгоритм:</a> <b>R2 U\' (R2 U2 F2) U\' R2</b></p>

        <p>Или вариант алгоритма для ситуации, когда глазки обоих слоев смотрят на вас.</p>
        <p style="text-align:center"><img src="ortega_3_10.xml"></p>
        <p><a href="rg2://ytplay?time=6:59&link=J7hNGHsQOtI&alg=R2_U\'_(B2_U2_R2)_U\'_R2">Алгоритм:</a> <b>R2 U\' (B2 U2 R2) U\' R2</b></p>

        <p><a href="rg2://ytplay?time=7:05&link=J7hNGHsQOtI"><b>2.2. PBL #4</b></a></p>

        <p>Снизу глазки, сверху нет глазок. Нижними глазками от себя.</p>
        <p style="text-align:center"><img src="ortega_3_4.xml"></p>
        <p><a href="rg2://ytplay?time=7:21&link=J7hNGHsQOtI&alg=(R_U\'_F)_U2_(F\'_U_R\')">Алгоритм:</a> <b>(R U\' F) U2 (F\' U R\')</b></p>

        <p>Или вариант алгоритма для ситуации, когда глазки нижнего слоя смотрят на вас.</p>
        <p style="text-align:center"><img src="ortega_3_11.xml"></p>
        <p><a href="rg2://ytplay?time=7:18&link=J7hNGHsQOtI&alg=(R_U_R_U\')_B2_(U_R\'_U\'_R\')">Алгоритм:</a> <b>(R U R U\') B2 (U R\' U\' R\')</b></p>

        <p><a href="rg2://ytplay?time=7:25&link=J7hNGHsQOtI"><b>2.3. PBL #5</b></a></p>

        <p>Снизу глазки, сверху все собрано. Можно перевернуть и сделать любой алгоритм из PBL #1, но лучше так.</p>
        <p style="text-align:center"><img src="ortega_3_5.xml"></p>
        <p><a href="rg2://ytplay?time=7:37&link=J7hNGHsQOtI&alg=R\'_U_L\'_U\'_R2_U\'_R\'_U2_R_U\'">Алгоритм:</a> <b>R\' U L\' U\' R2 U\' R\' U2 R U\'</b></p>

        <p><a href="rg2://ytplay?time=5:11&link=J7hNGHsQOtI">3. Нижний слой не собран, но глазок нет.</a></p>

        <p><a href="rg2://ytplay?time=5:22&link=J7hNGHsQOtI"><b>3.1. PBL #6</b></a></p>

        <p>Снизу нет глазок, сверху глазки. Ставим верхний слой глазками (блоком) к себе.</p>
        <p style="text-align:center"><img src="ortega_3_6.xml"></p>
        <p><a href="rg2://ytplay?time=5:32&link=J7hNGHsQOtI&alg=(R\'_F_R\')_F2_(R_U\'_R)">Алгоритм:</a> <b>(R\' F R\') F2 (R U\' R)</b><br/>
        или <b>(R U\' R) B2 (R\' B R\')</b><br/>
        или <b>(R U\' L) U2 (R\' U L\')</b></p>

        <p><a href="rg2://ytplay?time=5:35&link=J7hNGHsQOtI"><b>3.2. PBL #7</b></a></p>

        <p>Глазок нет ни сверху, ни снизу. Самая простая, но и самая редкая ситуация. Алгоритм один,
        но два варианта его выполнения.</p>
        <p style="text-align:center"><img src="ortega_3_7.xml"></p>
        <p><a href="rg2://ytplay?time=5:42&link=J7hNGHsQOtI&alg=R_L_U2_R\'_L\'">Алгоритм:</a> <b>R L U2 R\' L\'</b><br/>
        по сути это: <b>R2 B2 R2</b></p>

        <p><a href="rg2://ytplay?time=5:46&link=J7hNGHsQOtI"><b>3.4. PBL #8</b></a></p>

        <p>Сверху слой собран, снизу нет глазок. Можно перевернуть кубик и сделать Австралию,
        а можно просто немного модифицировать алгоритм из PBL #2, по сути, объединив его с PBL #7.</p>
        <p style="text-align:center"><img src="ortega_3_8.xml"></p>
        <p><a href="rg2://ytplay?time=5:46&link=J7hNGHsQOtI&alg=(R_U\'_R\'_U\')_F2_(U\'_R_U_R\')_D_(F2)_R2">Алгоритм:</a> <b>(R U\' R\' U\') F2 (U\' R U R\') D (F2) R2</b></p>

    """;
    static const ortega3_url = "J7hNGHsQOtI";

}
