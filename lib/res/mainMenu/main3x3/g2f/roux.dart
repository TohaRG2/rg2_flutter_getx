
import 'package:rg2_flutter_getx/models/phases.dart';

class Roux implements Phase {
  @override
  int count = roux_title.length;

  @override
  String phase = "ROUX";

  @override
  List<String> titles() => roux_title;

  @override
  List<String> icons() => roux_icon;

  @override
  List<String> descriptions() => roux_descr;

  @override
  List<String> urls() => roux_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const roux_title = [
        roux1_title,
        roux2_title,
        roux3_title,
        roux4_title,
        roux5_title,
    ];

    static const roux_icon = [
        "roux_1",
        "roux_2",
        "roux_3",
        "roux_4",
        "roux_5",
    ];

    static const roux_descr = [
        roux1_descr,
        roux2_descr,
        roux3_descr,
        roux4_descr,
        roux5_descr,
    ];


    static const roux_url = [
        roux1_url,
        roux2_url,
        roux3_url,
        roux4_url,
        roux5_url,
    ];

    static const roux1_title = "Первый блок";
    static const roux1_descr = """
        <p>Этот метод быстрой сборки кубика 3х3 был придуман Жилем Ру (Gilles Roux). Для начала
        несколько слов о его <a href="rg2://ytplay?time=0:19&link=gROant1t_j4">плюсах и минусах,</a>
        прежде всего в сравнении с методикой Фридрих (CFOP).<br/><br/>

        плюсы:<br/>
        - в среднем 40-50 ходов для сборки кубика, против 50-60 ходов в CFOP.<br/>
        - сборка практически без перехватов.<br/>
        - меньше алгоритмов для заучивания (в CMLL всего 42 алгоритма, против 78 в CFOP).<br/>
        - кроме этапа CMLL, остальная часть сборки интуитивная.<br/><br/>

        минусы:<br/>
        - более сложный Look ahead на этапе F2B, чем на F2L.<br/>
        - средний TPS (количество ходов в секунду) ниже, чем в CFOP (для профессионалов). Почему
        так происходит, вы можете посмотреть вот <a href="rg2://ytplay?time=2:27&link=QKK8J3JKWi4">в этом видео от JPerm.</a><br/>
        - не очень подходит для сборки одной рукой.</p>

        <p>Эта обучалка рассчитана прежде всего на тех, кто уже умеет собирать кубик по методике CFOP и
        знает, а главное понимает, этап F2L. Как и CFOP, данный метод состоит
        <a href="rg2://ytplay?time=2:45&link=gROant1t_j4">из 4-х этапов.</a></p>

        <p><a href="rg2://ytplay?time=4:51&link=gROant1t_j4">Первый этап</a>
        - сборка первого блока 1х2х3 снизу на левой стороне кубика. Как уже было
        сказано выше, все этапы сборки данным методом, кроме CMLL, являются очень интуитивными,
        и их надо прежде всего понимать. Поэтому, читайте, пробуйте, учитесь и смотрите примеры сборок.</p>

        <p>Теперь договоримся насчёт
        <a href="rg2://ytplay?time=4:17&link=gROant1t_j4">расположения цветов.</a>
        Автор метода предлагает держать куб так,
        чтобы слева/справа были бы жёлтая/белая стороны, но многие по привычке
        держат белой снизу, а жёлтой сверху. Вот и мне кажется, что для примеров так будет понятнее.
        Т.е. первым делом мы будем собирать какой-то блок с белым цветом снизу.</p>

        <p>Тут все очень похоже на F2L этап CFOP, но поскольку центры еще не стоят на своих местах,
        свободы действий гораздо больше. Важно понимать, что как и при сборке креста, реберный
        элемент не входящий в одну из пар (перемычка), т.е. в нашем случае это бело-какое-то ребро,
        из любого положения ставится к своему центру максимум в три хода. Но лучше стараться
        для первого блока выбирать перемычку, которая ставится в один или два хода. И, по возможности,
        стараться продумать ходы для сборки первого блока еще на этапе осмотра кубика. Чтобы лучше
        понять, посмотрите <a href="rg2://ytplay?time=5:04&link=gROant1t_j4">примеры</a>
        сборок кубика (Сборка 1 и Сборка 2).</p>

        <p>Ну и небольшое <a href="rg2://ytplay?time=6:43&link=gROant1t_j4">ускорение</a>
        для первого этапа, для ситуации, когда ребро на своем месте, а угол
        с завышенной самооценкой:</p>
        <p style="text-align:center"><img src="roux_1_1.xml"></p>

        <p>Вместо трех пиф-пафов слева, можно сделать <b>D U2 R2 D\'</b>.</p>

        <p>Описание метода <a href="http://grrroux.free.fr/method/Intro.html">от автора.</a><br/>
        Неплохое описание <a href="http://cubemir.0pk.ru/viewtopic.php?id=292">на русском языке</a></p>

    """;
    static const roux1_url = "gROant1t_j4";


    static const roux2_title = "Второй блок";
    static const roux2_descr = """
        <p>Цель <a href="rg2://ytplay?time=7:43&link=gROant1t_j4">второго этапа</a>
        - собрать аналогичный блок 3х2х1 на противоположной грани, поэтому первый
        и второй этап вместе часто называют F2B (First 2 Block), т.е. первые два блока.</p>

        <p>Тут уже свободы немного меньше, чем на первом этапе, но больше чем на обычном F2L. Главное
        научиться эффективно использовать вращения среднего слоя (M) и понимать, что на данном этапе
        центры этого слоя не фиксированы, т.е. могут располагаться как угодно. Важное отличие от F2L в том,
        что если в F2L нам достается \"плохое\" ребро, то мы обычно делаем перехват, а в F2B просто
        переворачиваем ребро при помощи вращения средней грани (M или M\'). Поэтому,
        если в F2L мы обычно прячем угол, затем вращением верхней грани устанавливаем ребро куда
        надо, относительно этого угла, то тут проще спрятать ребро на нижнюю грань, подогнать угол
        куда надо и поставить ребро так, чтобы их можно было легко заселить.</p>

        <p>Еще один момент, связанный со свободным вращением среднего слоя. Если у вас есть пара
        <a href="rg2://ytplay?time=9:38&link=gROant1t_j4">на верхнем слое,</a> но стоит она неудобно. Например, так:</p>
        <p style="text-align:center"><img src="roux_2_1.xml"></p>

        <p>то в F2B такая пара легко загоняется в три хода, без всяких перехватов.<br/>
        Алгоритм: <b>Rw U R\'</b></p>

        <p>Причем, последний ход можно делать как жирный (Rw\'), так и простой (R\'). Кстати,
        есть вариант этого алгоритма и <a href="rg2://ytplay?time=10:15&link=gROant1t_j4">для F2L,</a>
        который приведен в первой части Advanced F2L, но
        как вы понимаете, там ходов немного побольше, т.к. нужно возвращать на место средний слой.</p>

        <p>Ну и еще один пример использования среднего слоя, <a href="rg2://ytplay?time=10:39&link=gROant1t_j4">для разворота ребра:</a></p>
        <p style="text-align:center"><img src="roux_2_2.xml"></p>

        <p><a href="rg2://ytplay?time=10:55&link=gROant1t_j4&alg=U2_R\'_U_M_U\'_R">Алгоритм:</a> <b>U2 R\' U M U\' R</b></p>

    """;
    static const roux2_url = "gROant1t_j4";

    static const roux3_title = "CMLL";
    static const roux3_descr = """
        <p><a href="rg2://ytplay?time=11:14&link=gROant1t_j4">На третьем этапе</a>
        необходимо развернуть и расставить на свои места четыре верхних уголка.
        Называется он CMLL (Corners on Last Layer with free M-slice).
        Как вы наверно уже понимаете, данный этап является аналогом этапа COLL для CFOP и все
        алгоритмы из COLL здесь работают, отличие же этапов в том, что благодаря тому, что средний
        слой у нас по-прежнему свободен, некоторые алгоритмы могут быть выполнены проще.
        Данный этап включает в себя 42 алгоритма. 40 алгоритмов, как в COLL, когда уголки надо
        ориентировать, плюс 2 PLL-алгоритма, когда все уголки уже ориентированы правильно и
        их нужно только расставить на свои места. Если вы собирали кубик 2х2, то наверняка уже
        догадались, что два PLL-алгоритма это Австралия (Y-perm) и Юг (J-Perm), ну или вместо
        Юга можно использовать Запад (T-Perm).</p>

        <p>Все CMLL алгоритмы будут приведены в отдельной главе, пока же расскажу, как выполнить
        данный этап не заучивая столько алгоритмов. Сделать это довольно просто, разделив его
        на два подэтапа OCLL и PCLL, т.е. ориентацию и расстановку элементов. В этом случае
        достаточно всего девяти алгоритмов, и вы их наверняка уже знаете.</p>

        <p>Ориентация:<br/><br/>

        На этом подэтапе надо научиться игнорировать реберные элементы верхнего слоя, и смотреть
        на трешку как на двушку, т.е. видеть
        <a href="rg2://ytplay?time=13:37&link=gROant1t_j4">только ориентацию углов.</a>
        Далее используя один из
        семи базовых OLL-алгоритмов развернуть все углы как надо, в один алгоритм. Т.е.
        используем Рыбку, Акулу, НТВ+, Вертолет, Ушки, Носик или Глазки. Но поскольку
        ориентация ребер для нас пока не имеет значения, то мы можем использовать и
        более простые и удобные алгоритмы, которые ее меняют.</p>

        <p>Например:<br/><br/>
        Рыбка: (R U R\' U) R U2 R\'<br/><br/>
        Акула: R U2 R\' (U\' R  U\' R\')<br/><br/>
        НТВ+: F (R U R\' U\')3 F\'<br/><br/>
        Вертолет: R U2\' R2\' U\' R2 U\' R2\' U2\' R<br/><br/>
        Ушки (Т с блоком): (R U R\' U\') (R\' F R F\')<br/><br/>
        Носик (Галстук с блоком): F (R U\' R\' U\') (R U R\' F\')<br/><br/>
        Глазки: R2 D\' R U2 R\' D R U2 R</p>

        <p>Перестановка:<br/><br/>
        Теперь, как уже было сказано выше, для
        <a href="rg2://ytplay?time=14:56&link=gROant1t_j4">перестановки используем</a>
        Австралию или Юг (Запад).
        Если углы с какой-то стороны образуют глазки, значит разворачиваем верхнюю грань этими
        глазками налево и делаем Юг или Запад. А если глазок нет, то делаем Австралию из любого
        положения.</p>

        <a href="rg2://ytplay?time=15:47&link=gROant1t_j4">Австралия</a> (Y-Perm): (F R) (U\' R\' U\' R U R\' F\') (R U R\' U\') (R\' F R F\')<br/><br/>
        Юг (J-Perm): (R U R\' F\') (R U R\' U\') (R\' F R2 U\' R\' U\')<br/><br/>
        <a href="rg2://ytplay?time=15:13&link=gROant1t_j4">Запад</a> (T-Perm): (R U R\' U\') (R\' F R2 U\' R\' U\') (R U R\' F\')<br/><br/>

        <p>P.S. Надеюсь, что все вышесказанное будет понятно и без рисунков. Как обычно, если
        что-то непонятно, посмотрите этот момент в видео.</p>
    """;
    static const roux3_url = "gROant1t_j4";


    static const roux4_title = "Шесть ребер (LSE)";
    static const roux4_descr = """
        <p>Осталось разобраться только с <a href="rg2://ytplay?time=15:57&link=gROant1t_j4">шестью ребрами</a>
        (четырьмя на верхней грани и двумя на нижней). Поэтому данный этап называют LSE (Last Six Edge).</p>
        <p>Его можно разбить на четыре (три) подэтапа:<br/>
        0. Установка белого или желтого центра сверху.<br/>
        1. Разворот ребер (Edge Orientation).<br/>
        2. Установка двух боковых ребер верхнего слоя (L/R Edges).<br/>
        3. Расстановка ребер среднего слоя (Last 4 Edges).<br/>
        Рассмотрим их подробнее.</p>

        <p><a href="rg2://ytplay?time=16:48&link=gROant1t_j4"><b>Установка центра.</b></a></p>

        <p>Вращением среднего слоя необходимо поставить белый или желтый центр сверху. Я не зря этот
        этап обозначил как нулевой, потому что данную операцию лучше делать вместе с последним ходом
        этапа F2B, т.к. CMLL не меняет расположение центров. Но перед выполнением данного этапа не лишним
        будет и проверить, а правильно ли расположены центры.</p>

        <p><a href="rg2://ytplay?time=17:20&link=gROant1t_j4"><b>Разворот ребер.</b></a></p>
        <p>Сначала нам нужно сделать все ребра \"хорошими\". Чем же \"хорошее\" ребро отличается от плохого?
        \"Хорошее\" ребро - это такое ребро, которое смотрит белой или желтой наклейкой вверх (или
        вниз для нижних ребер). Соответственно, те ребра которые смотрят белой или желтой наклейкой
        вбок являются \"плохими\". Задача этого подэтапа развернуть ребра так, чтобы все они стали
        \"хорошими\".</p>

        <p>Для этого будем использовать один очень простой трехходовый <a href="rg2://ytplay?time=17:56&link=gROant1t_j4">алгоритм</a>
        - <b>M\' U M</b>. Этот алгоритм разворачивает вот эти четыре ребра:</p>
        <p style="text-align:center"><img src="roux_4_1.xml"></p>

        <p>Либо его <a href="rg2://ytplay?time=18:13&link=gROant1t_j4">зеркальный вариант</a> - <b>M U M\'</b>,
        который разворачивает вот эти четыре ребра (заднее нижнее ребро на картинке не видно):</p>
        <p style="text-align:center"><img src="roux_4_2.xml"></p>

        <p>Надеюсь, что вы уже не новичок и понимаете, что на данном этапе \"плохих\" ребер может быть
        только <a href="rg2://ytplay?time=18:35&link=gROant1t_j4">четное количество,</a> т.е.
        2, 4, 6 или все ребра \"хорошие\". Что делать в каждом из этих случаев:</p>

        <p><b>Все ребра \"хорошие\"</b> - переходим к Установке боковых ребер.</p>

        <p><a href="rg2://ytplay?time=19:06&link=gROant1t_j4"><b>4 \"плохих\" ребра</b></a>
        - они довольно легко при помощи пары интуитивных ходов размещаются
        в одну из вышеприведенных ситуаций и далее решаются в три хода. Сложность может возникнуть
        разве что с ситуацией, когда все четыре ребра находятся
        <a href="rg2://ytplay?time=20:29&link=gROant1t_j4">на среднем слое</a>
        или на верхней грани. В этом случае, надо сделать так, чтобы два \"плохих\" ребра на
        верхней грани стояли по бокам,
        а еще два плохих ребра увести на нижнюю грань. И выполнить тот же алгоритм, но с
        <a href="rg2://ytplay?time=21:05&link=gROant1t_j4">двойным вращением крыши</a>
        <b>M\' U2 M</b>, в этом случае поменяются местами два ребра на передней грани
        (вот эти):</p>
        <p style="text-align:center"><img src="roux_4_3.xml"></p>

        <p>и мы легко получим ситуацию, <a href="rg2://ytplay?time=21:35&link=gROant1t_j4">которую решим</a>
        при помощи M\' U M или M U M\'.</p>

        <p><a href="rg2://ytplay?time=22:11&link=gROant1t_j4"><b>6  \"плохих\" ребер</b></a> - делаем любой трехходовый алгоритм, получаем ситуацию с двумя
        \"плохими\" ребрами.</p>

        <p><a href="rg2://ytplay?time=22:32&link=gROant1t_j4"><b>2 \"плохих\" ребра</b></a> - необходимо поставить эти два ребра так, чтобы одно ребро алгоритмом
        переворачивалось, а другое нет. Затем выполнить алгоритм, получим ситуацию с четырьмя \"плохими\"
        ребрами. Поставить их под один из алгоритмов, выполнить его.</p>

        <p>На данном этапе, чтобы не крутить не очень удобный ход M, можно использовать очень быстрый и
        <a href="rg2://ytplay?time=23:35&link=gROant1t_j4">удобный алгоритм</a> M\' U M\', но
        освоить его применение, я думаю, вы сможете уже самостоятельно, теперь уже
        логически понимая, что и как работает на данном этапе, и что нужно сделать.</p>

        <p><a href="rg2://ytplay?time=24:01&link=gROant1t_j4"><b>Установка двух боковых ребер</b></a></p>

        <p>Теперь наша задача поставить на место два боковых ребра верхнего слоя. Тут все делается
        довольно интуитивно, <a href="rg2://ytplay?time=25:17&link=gROant1t_j4">главное понимать,</a>
        что теперь мы будем крутить только две грани U и M,
        причем если мы крутим М одинарно (M или M\'), то следующий ход будет обязательно U2, если
        же сначала крутим M2, то после него может быть как одинарное, так и двойное вращение U,
        иначе нарушится ориентация ребер.</p>

        <p>Для начала надо найти эти два ребра и поставить их на среднем слое
        <a href="rg2://ytplay?time=26:06&link=gROant1t_j4">по диагонали друг</a>
        от друга. Для этого надо поставить одно ребро справа или слева на верхнем слое, а другое
        перевести на нижний слой и теперь соответствующим вращением крыши поставить ребро в
        противоположную от нижнего ребра позицию. Теперь выполним знакомый нам уже
        <a href="rg2://ytplay?time=26:40&link=gROant1t_j4">алгоритм</a>
        M\' U2 M или M\' U2 M\' и получим нашу пару ребер стоящих друг напротив друга на нижней грани.
        Подгоняем крышу, так чтобы глазки на крыше были противоположны
        <a href="rg2://ytplay?time=27:04&link=gROant1t_j4">окошку на первом этаже</a> и делаем
        M2, осталось только довернуть крышу в нужную сторону.</p>

        <p><a href="rg2://ytplay?time=27:28&link=gROant1t_j4"><b>Расстановка ребер среднего слоя</b></a></p>

        <p>Ну и теперь расставим по местам ребра среднего слоя. Тут все решается одним
        <a href="rg2://ytplay?time=27:39&link=gROant1t_j4">волшебным алгоритмом</a>
        <b>U2 M\' U2</b> либо его зеркальным аналогом <b>U2 M U2</b>.
        Надо только изначально правильно повернуть средний слой. Первым делом надо
        <a href="rg2://ytplay?time=28:31&link=gROant1t_j4">найти \"одинокое\"</a>
        ребро стоящее между двух блоков, если такого ребра нет, то значит все четыре ребра стоят
        не на своем месте и нужно просто один раз выполнить данный алгоритм из любого положения и
        такое ребро появится.</p>
        <p style="text-align:center"><img src="roux_4_4.xml"></p>

        <p>Теперь надо посмотреть с какой стороны от него находится
        <a href="rg2://ytplay?time=28:51&link=gROant1t_j4">блок из трех элементов,</a>
        т.е. ребро стоящее между своими центрами и поставить средний слой так, чтобы блок находился снизу, а
        \"одинокое\" ребро на верхней грани, теперь крутим крышу 2 раза,
        перемещаем блок на другое место снизу, и снова крутим крышу 2 раза. Т.е. делаем<br/><br/>

        <b>U2 M\' U2</b> - если <a href="rg2://ytplay?time=28:51&link=gROant1t_j4">блок с ребром сзади,</a><br/>
        <b>U2 M U2</b> - если <a href="rg2://ytplay?time=30:06&link=gROant1t_j4">блок с ребром спереди.</a></p>

        <p>Доворачиваем средний слой при необходимости. Profit!</p>
        """;
    static const roux4_url = "gROant1t_j4";

    static const roux5_title = "Примеры сборки";
    static const roux5_descr = """

        <p>Пример N1, <a href="rg2://ytplay?time=0:19&link=hg8NUzRR2Mw">разберем кубик</a> вот по такому скрамблу:
        <a href="rg2://scrmbl?scram=F_D2_L2_R\'_D2_B2_L\'_B2_L_B2_R\'_F2_U_F_D_U\'_L\'_U\'_F_U\'_L\'">F D2 L2 R\' D2 B2 L\' B2 L B2 R\' F2 U F D U\' L\' U\' F U\' L\'</a></p>
        <p style="text-align:center"><img src="roux_5.xml"></p>

        <p><a href="rg2://ytplay?time=0:40&link=hg8NUzRR2Mw"><b>Первый блок.</b></a></p>

        <p>Видим, что в один ход вращением белой грани очень легко собирается красно-синяя пара.
        Теперь объединим эту пару с красно-белым или сине-белым ребром. Например с красно-белым.
        И вот тут, для тех кто знает CFOP, будет очень непривычным то, что положение белого центра
        пока для нас не имеет значения и ребро нам нужно ставить не к белому центру, а к цветному.
        Например, если мы будем ставить красно-белое ребро, сине-белое не очень удачное в данном случае,
        думаю, чуть попозже вы и сами поймете почему. Его надо поставить так, чтобы оно
        дружило с красным центром. Тут важно понимать, что любое ребро можно подружить со своим центром
        максимум в три хода, в данном случае нам достаточно одного и этот ход не разобьет нашу пару.
        Теперь в три хода объединим нашу пару и красно-белый центр, т.е. соберем на красной стороне блок 1х2х2.
        Осталось поставить красно-зелено-белую пару, которая в данном случае у нас уже образовалась
        сама и легко ставится в четыре хода. Первый этап закончен.</p>

        <p><a href="rg2://ytplay?time=1:35&link=hg8NUzRR2Mw"><b>Второй блок.</b></a></p>

        <p>Соберем второй блок на оранжевой грани. В один ход ставим оранжево-белое ребро к оранжевому центру
        и сразу видим еще сине-оранжевую пару на нижней грани. Делаем (R U2 M2), получаем пару,
        заселяем ее к оранжевым ребру и центру (U R). Осталось поставить последнюю пару, оба элемента
        которой находятся на крыше. В F2L мы бы загнали ее так: (U\' R U2 R\' U2 R U\' R\')
        Здесь же, поскольку средний слой мы можем вращать как угодно, лучше сделать так:
        (U\' M U2 Rw U\' Rw\').</p>

        <p><a href="rg2://ytplay?time=3:35&link=hg8NUzRR2Mw"><b>СMLL.</b></a></p>

        <p>Нам повезло, все углы у нас оказались не только правильно ориентированы, но и правильно расставлены,
        а значит, переходим к последним шести ребрам.</p>

        <p><a href="rg2://ytplay?time=3:48&link=hg8NUzRR2Mw"><b>Ориентация ребер.</b></a></p>

        <p>И у нас получилась ситуация с четырьмя \"плохими\" ребрами, но которые все расположены на
        среднем слое. Поэтому уводим два верхних ребра в стороны (U\'), и меняем местами два передних
        ребра M\' U2 M. Переводим тройку \"плохих\" ребер назад (U2) и делаем
        алгоритм сзади M U M\'. Тут я зачем-то в видео развернул крышу (U2) совместив углы, на самом деле
        этот ход был лишним.</p>

        <p><a href="rg2://ytplay?time=4:42&link=hg8NUzRR2Mw"><b>Ставим правое и левое ребро.</b></a></p>

        <p>И снова нам уже немного повезло и красно-желтое и оранжево-желтое ребро стоят парой
        на верхней грани, уводим эту пару на нижнюю грань (M2) и смотрим на нижнее окошко,
        оно оранжевое, значит сверху ставим красные глазки и делаем (M2 U).</p>

        <p><a href="rg2://ytplay?time=5:14&link=hg8NUzRR2Mw"><b>Расставляем ребра среднего слоя.</b></a></p>

        <p>Осталось поставить только три ребра. Делаем M\' U2 M U2.</p>

        <p>Profit!</p>

        <p>Пример N2. <a href="rg2://ytplay?time=5:45&link=hg8NUzRR2Mw">Разберем кубик</a> вот по такому скрамблу:
        <a href="rg2://scrmbl?scram=R\'_U2_L2_B2_L2_D\'_B2_D\'_F2_R2_D\'_U_B\'_D_B\'_F_R_B\'_D_L2_U2">R\' U2 L2 B2 L2 D\' B2 D\' F2 R2 D\' U B\' D B\' F R B\' D L2 U2</a></p>
        <p style="text-align:center"><img src="roux_5_1.xml"></p>

        <p><a href="rg2://ytplay?time=5:57&link=hg8NUzRR2Mw"><b>Первый блок.</b></a></p>

        <p>Видим, что очень легко, в один ход, собирается зелено-оранжевая пара. Также в одно
        двойное вращение зеленой грани можно совместить оранжево-белое ребро с оранжевым центром
        и еще в один ход поставить нашу пару к этому центру. Теперь нужно соединить и поставить
        оранжево-синюю пару. Если держать кубик так, чтобы оранжевая сторона была слева, белой к себе,
        а синей сверху, то ребро у нас стоит на верхней грани сзади (UB = Up/Back), а угол
        на нижней правой дальней (DRB = Down/Right/Back). Как вы понимаете, из такого
        положения пару можно загнать не одним способом, например, <b>R2 F\' M F\'</b>.
        А можно обойтись и без неудобных вращений M и F, например, так <b>R2\' Rw U\' Rw\' U2\' L\' U L</b>,
        ходов хоть и больше, но гораздо удобнее. Кстати, в этом еще один большой плюс данного
        метода, что можно обойтись практически без перехватов и вращений неудобных граней.</p>

        <p><a href="rg2://ytplay?time=8:06&link=hg8NUzRR2Mw"><b>Второй блок.</b></a></p>

        <p>Теперь нам необходимо собрать такой же блок на правой стороне, т.е. основной цвет этого блока
        будет красный. Видим, что красно-белое ребро у нас в положении UF (Up/Front), и еще на верхней грани
        есть элементы красно-синей пары: ребро в положении UB(Up/Back) и угол в URF (Up/Right/Front).
        Понимаем, что для того, чтобы поставить красно-белое ребро к красному центру, надо его
        сначала развернуть, т.е. перевести на другую сторону верхней грани, делаем M\', и подводим его
        к своему центру (U). Помним, что красно-синее ребро у нас ушло в положение DB (Down/Back),
        а угол теперь у нас в ULF (Up/Left/Front) и чтобы их подружить, делаем Rw2, заодно поставив
        красно-белое ребро на свое место. Загоняем пару в три хода (R U\' R\').
        Осталось поставить красно-зеленую пару. Угол у нас в DRB, а ребро в UR. Как бы мы поступили
        в обычном F2L, перехват (y), затем U\' R U\' R\' U R U\' R\'. В этом же методе мы
        развернем ребро при помощи комбинации U M\' U и получим простую F2L комбинацию для квартиры
        справа сзади (R\' U\' R  U) (R\' U\' Rw). Заметьте, что последний ход мы сделали жирным, чтобы
        сразу поставить белый центр наверх.
        Или еще один вариант постановки последней пары из ситуации после установки красно-синей:
        U\' R\' U\' R U Rw\' U\' Rw.</p>

        <p><a href="rg2://ytplay?time=10:52&link=hg8NUzRR2Mw"><b>CMLL.</b></a></p>

        <p>Этап CMLL выполним как начинающие, в два подэтапа. Сначала развернем углы желтым вверх,
        т.е. представим, что перед нами Носик, делаем <br/>
        (F R U\' R\' U\' R U R\' F\').<br/>
        Разворачиваем верхнюю грань глазками налево и делаем Юг<br/>
        (R U R\' F\') (R U R\' U\') (R\' F R2 U\' R\' U\').</p>

        <p><a href="rg2://ytplay?time=11:42&link=hg8NUzRR2Mw"><b>Ориентация ребер.</b></a></p>

        <p>Получаем ситуацию, когда неверно ориентированы только два ребра.
        Делаем U\' (M\' U\' M). Получаем три неверно ориентированных ребра сверху и одно снизу
        спереди, поворачиваем верхнюю тройку к себе (U\') и снова делаем (M\' U\' M).</p>

        <p><a href="rg2://ytplay?time=12:32&link=hg8NUzRR2Mw"><b>Ставим правое и левое ребро.</b></a></p>

        <p>Поворачиваем крышу красно-желтым ребром к себе (U\') и делаем M\' U2 M\'. Видим, что окошко
        снизу и глазки сверху стоят правильно, ставим ребра снизу наверх M2 и поворачиваем их на свои
        места U.</p>

        <p><a href="rg2://ytplay?time=13:11&link=hg8NUzRR2Mw"><b>Расставляем ребра среднего слоя.</b></a></p>

        <p>Осталось поставить три ребра M2 (U2 M U2) M.</p>

        Profit!

        """;
    static const roux5_url = "hg8NUzRR2Mw";
    
}
