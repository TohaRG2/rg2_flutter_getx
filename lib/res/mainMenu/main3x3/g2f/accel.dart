
import 'package:rg2_flutter_getx/models/phases.dart';

class Accel implements Phase {
  @override
  int count = accel_title.length;

  @override
  String phase = "ACCEL";

  @override
  List<String> titles() => accel_title;

  @override
  List<String> icons() => accel_icon;

  @override
  List<String> descriptions() => accel_descr;

  @override
  List<String> urls() => accel_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const accel_title = [
        accel_st0_title,
        accel_st1_title,
        accel_st2_title,
        accel_st3_title,
        accel_st4_title,
        accel_st5_title,
        accel_st6_title,
        accel_st7_title,
        accel_st8_title,
        accel_st9_title,
        accel_st10_title,
        accel_st11_title,
        accel_st12_title,
        accel_st13_title,
        accel_st14_title,
        accel_st15_title,
        accel_st16_title,
        accel_st17_title,
        accel_st18_title,
        accel_st19_title,
        accel_st20_title,
    ];

    static const accel_icon = [
        "accel",
        "accel_1",
        "accel_2",
        "accel_3",
        "accel_4",
        "accel_5",
        "accel_6",
        "accel_7",
        "accel_8",
        "accel_9",
        "accel_10",
        "accel_11",
        "accel_12",
        "accel_13",
        "accel_3",
        "accel_15",
        "accel_16",
        "accel_17",
        "accel_18",
        "accel_19",
        "accel_20",
    ];

    static const accel_descr = [
        accel_st0_descr,
        accel_st1_descr,
        accel_st2_descr,
        accel_st3_descr,
        accel_st4_descr,
        accel_st5_descr,
        accel_st6_descr,
        accel_st7_descr,
        accel_st8_descr,
        accel_st9_descr,
        accel_st10_descr,
        accel_st11_descr,
        accel_st12_descr,
        accel_st13_descr,
        accel_st14_descr,
        accel_st15_descr,
        accel_st16_descr,
        accel_st17_descr,
        accel_st18_descr,
        accel_st19_descr,
        accel_st20_descr,
    ];

    static const accel_url = [
        accel_st0_url,
        accel_st1_url,
        accel_st2_url,
        accel_st3_url,
        accel_st4_url,
        accel_st5_url,
        accel_st6_url,
        accel_st7_url,
        accel_st8_url,
        accel_st9_url,
        accel_st10_url,
        accel_st11_url,
        accel_st12_url,
        accel_st13_url,
        accel_st14_url,
        accel_st15_url,
        accel_st16_url,
        accel_st17_url,
        accel_st18_url,
        accel_st19_url,
        accel_st20_url,
    ];

    static const accel_st0_title = "Вступление";
    static const accel_st0_descr = """
        <p>Как уже было сказано в описании обеих методик для начинающих, с них можно плавно переходить
        к скоростной сборке кубика по методу Джессики Фридрих. И переход стоит начать с ускорений
        (фактически наиболее часто попадающихся комбинаций тех или иных этапов метода Фридрих) и
        фингертриксов (правильной постановки рук для выполнения алгоритма). Именно для этого и
        сделан этот цикл обучающих видео.</p>

        <p>P.S. Для каждого алгоритма из ускорений учите/придумывайте свой фингертрикс. Т.к. это позволит
        вам не только выполнять алгоритмы быстрее, но и подключить мышечную память для их запоминания 
        (именно поэтому многие спидкуберы могут выполнить алгоритм быстро и без ошибок, а повторить его медленно не могут).</p>
    """;
    static const accel_st0_url = "N5sHoLJ4Pc4";

    static const accel_st1_title = "N1 Английский пиф-паф";
    static const accel_st1_descr = """
        <p>Вам наверно очень не нравится крутить 5 пиф-пафов на четвертом этапе, когда вам попадается
            наглый угол.<br/> В этом случаем лучше использовать Английский пиф-паф. А Английский он потому,
            что в этом пиф-пафе мы будем крутить не крышу, а Биг-Бэн (т.е. едем в или
            возвращаемся из Лондона). И делается он следующим образом: выключаем свет, едем в
            Лондон, включаем свет, возвращаемся из Лондона.</p>
        <p style="text-align:center"><img src="accel_1_1.xml"></p>
        Фингертрикс: <a href="rg2://ytplay?time=3:30&link=GV6Z3naPO4Q">на видео 3:30</a><br/>
        <b>Алгоритм: (R\' F R F\')</b>
    """;
    static const accel_st1_url = "GV6Z3naPO4Q";

    static const accel_st2_title = "N2 Рыбка";
    static const accel_st2_descr = """
        <p>Повернуть рыбку головой к себе влево. Выполнить морской пиф-паф, а морской он потому, что связан с рыбкой,
        и отличается от простого пиф-пафа только последним ходом крыши не против, а по часовой стрелке.
        Т.е. Включаем свет, "крыша по" часовой стрелке, выключаем свет, снова "крыша по". Продолжаем алгоритм:
        снова включаем свет, крыша 2 раза и выключаем свет.</p>
        <p>И если рыбка не решилась с первого раза, то снова повернуть головой к себе влево и повторить.
        Как отличить рыбку которая выполнится с первого раза (золотую) от той для которой алгоритм нужно
        делать два раза (назовем её акулой), да очень просто, у золотой рыбки (правильной) точка на передней
        грани справа, а у акулы слева.</p>
        <p style="text-align:center"><img src="accel_2_1.xml"></p>
        Фингертрикс: <a href="rg2://ytplay?time=7:04&link=PUTeFKC9R2Y">на видео 7:04</a><br/>
        Фингертрикс: <a href="rg2://ytplay?time=0:20&link=IasVqtCHoj0">от Феликса Земдегса</a> <br/>
        <b>Алгоритм: (R U R\' U) R U2 R\'</b>
    """;
    static const accel_st2_url = "PUTeFKC9R2Y";

    static const accel_st3_title = "N3 Глазки-ушки";
    static const accel_st3_descr = """
        <p>Почему начали именно с рыбки, потому что рыбкой можно решать и еще одну ситуацию, когда с одной
        стороны ушки, а с другой глазки. Ставим глазками налево и делаем рыбку, "крыша против" и еще раз рыбку.</p>
        <p>Более скоростной алгоритм "вертолет" для данной ситуации будет рассмотрен в Ускорении N14.</p>
        <p style="text-align:center"><img src="accel_3_1.xml"></p>
        <b>Алгоритм: ((R U R\' U) R U2 R\') U\' ((R U R\' U) R U2 R\')</b>
        <p>P.S. Аналогично, используя всего лишь два алгоритма Рыбку и Акулу из Ускорения N11, можно решать любую ситуацию
        7-го этапа. Подробнее как это делать, можно <a href="rg2://ytplay?time=21:57&link=RukIJdEiOoI">посмотреть тут.</a></p>
    """;
    static const accel_st3_url = "7bazgCpB-zE";

    static const accel_st4_title = "N4 НТВ+ (глазки-глазки)";
    static const accel_st4_descr = """
        <p>Взять глазками к себе, Уехать в Лондон, три пиф-пафа, вернуться из Лондона.</p>
        <p style="text-align:center"><img src="accel_4_1.xml"></p>
        <b>Алгоритм: F (R U R\' U\') (R U R\' U\') (R U R\' U\') F\' </b>
        <p>Альтернативный вариант, без кручения передней грани:<br/>
        Фингертрикс: <a href="rg2://ytplay?time=0:28&link=IasVqtCHoj0">от Феликса Земдегса</a> <br/>
        <b>Алгоритм: (R U2) (R\' U\' R U R\' U\' R U\' R\')</b></p>
        <p><a href="rg2://ytplay?time=0:26&link=t3KcPrjmJJ4">Бонус от JPerm:</a>
        если углы стоят парами</p>
        <p style="text-align:center"><img src="accel_4_2.xml"></p>
        <p>как на данных картинках, то в первом случае лучше использовать первый алгоритм,
        а во втором - второй. Т.е. первый ход делать параллельно паре. В этом случае углы для
        PLL у вас встанут на свои места.</p>
    """;
    static const accel_st4_url = "vJS0EyEPFPY";

    static const accel_st5_title = "N5 Запад";
    static const accel_st5_descr = """
        <p>Если на 8ом этапе дяди находятся друг напротив друга, то кубик нужно повернуть дядей к себе. И выполнить: Пиф-паф,
        выкл.свет, уехать в Лондон, вкл.яркий свет (2 раза), крыша против, убавили яркость, крыша продолжила
        (против часовой), добавили яркость, крыша назад (по часовой), выкл.свет, из Лондона.</p>
        <p>На данном этапе пока не смотрим на углы, на них обратим внимание в Ускорении N15.</p>
        <p style="text-align:center"><img src="accel_5_1.xml"></p>
        <p>Более подробно комбинация рассмотрена в методе слепой сборки N3</p>
        <b>Алгоритм: (R U R\' U\') R\' F R2 U\' R\' U\' (R U R\' F\')</b>
    """;
    static const accel_st5_url = "kyFb4EgXW-8";

    static const accel_st6_title = "N6 Шахматы";
    static const accel_st6_descr = """
        <p>Если на 9ом этапе ни одного угла нет на месте и все центры противоположны глазкам на своих гранях,
        значит это ситуация "шахматы". Повторяем 6 раз: средний слой 2 раза, крышу против часовой.</p>
        <p style="text-align:center"><img src="accel_6_1.xml"></p>
        <p>Фингертрикс: <a href="rg2://ytplay?time=3:50&link=1lyDpI5-5m4">на видео 3:50</a> </p>
        <b>Алгоритм: 6 раз (M2 U\')</b>
    """;
    static const accel_st6_url = "1lyDpI5-5m4";

    static const accel_st7_title = "N7 Буква \"Т\"";
    static const accel_st7_descr = """
       <p>Ускорение для 6 этапа. Палка с двумя собранными углами. Главное правильно развернуть вершиной
       буквы Т направо и посмотреть на 3ий этаж, какая буква Т, с точкой или с блоком (двумя точками).</p>
       <p>Если <b>\"Т с точкой\"</b>, то выполнить обычную \"палку\", т.е. в Лондон, пиф-паф, из Лондона.<p>
       <p style="text-align:center"><img src="accel_7_1.xml"></p>
       Фингертрикс: <a href="rg2://ytplay?time=1:47&link=IasVqtCHoj0">от Феликса Земдегса</a> <br/>
       <b>Алгоритм: F (R U R\' U\') F\' </b><br/>
       <p>Если <b>\"Т с блоком\"</b>, то сначала обычный пиф-паф, потом английский пиф-паф.</p>
       <p style="text-align:center"><img src="accel_7_2.xml"></p>
       <b>Алгоритм: (R U R\' U\') (R\' F R F\') </b>
    """;
    static const accel_st7_url = "SRsEGxXLqrc";

    static const accel_st8_title = "N8 Ушки";
    static const accel_st8_descr = """
       <p>Если на 7 этапе не на месте два угла и смотрят эти углы в разные стороны, значит это ушки.</p>
        <p>Кубик необходимо взять так, чтобы ушки были сзади. И теперь повернуть ушками вниз, а нижней
        гранью к себе. Крутить будем нижнюю, правую и верхнюю грани. Причем правую в сторону той грани,
        которую вращали до этого. И начинается алгоритм с вращения нижней грани против часовой стрелки,
        теперь соответственно правую вниз, т.е. выключаем свет, теперь верхнюю туда же куда и нижнюю,
        но для верхней это будет по часовой, теперь правую вверх, нижнюю возвращаем на место,
        правую вниз, верхнюю на место и правую вверх.</p>
        <p style="text-align:center"><img src="accel_8_1.xml"></p>
        Фингертрикс: Стандартное положение рук.
        <a href="rg2://ytplay?time=6:50&link=gbuLeCv_fRM">на видео 6:50</a> <br/>
        <b>Алгоритм: x (D\' R\' U R D R\' U\' R) x\'</b>
    """;
    static const accel_st8_url = "gbuLeCv_fRM";

    static const accel_st9_title = "N9 Носик";
    static const accel_st9_descr = """
        <p>Опять ускорение для 7 этапа. И снова ситуация, когда не на месте 2 угла, но находятся они по диагонали
        друг от друга, то такая ситуация называется носик.</p>
        <p>Как держать - глазиком справа к себе. И тоже наклонить нижней гранью к себе, верхней
        от себя. И сделать "ушки" только верхнюю грань крутить сначала против часовой, а потом по
        часовой. Т.е. низ против часовой, правую вниз, верх против часовой, правую вверх,
        низ по часовой, правую вниз, верх по часовой, правую вверх.
        <p style="text-align:center"><img src="accel_9_1.xml"></p>
        Фингертрикс: <a href="rg2://ytplay?time=7:36&link=ICMhcSF54OM">на видео 7:36</a><br/>
        <b>Алгоритм: x (D\' R\') U\' R (D R\') U R x\'</b><br/><br/>

        Но есть способ лучше. Изначально держать кубик так же, но НЕ наклонять.<br/>
        Фингертрикс: <a href="rg2://ytplay?time=1:31&link=VLwoXOWd0Pc">от Максима</a><br/>
        Фингертрикс: <a href="rg2://ytplay?time=1:00&link=IasVqtCHoj0">от Феликса Земдегса</a> <br/>
        <b>Алгоритм: F\' (Rw U R\' U\') (Rw\' F R)</b><br/><br/>
    """;
    static const accel_st9_url = "ICMhcSF54OM";

    static const accel_st10_title = "N10 Человечек (PLL Черепашка)";
    static const accel_st10_descr = """
        <p>Ускорение для 9 этапа, и снова все 4 угла не на своем месте, а ребра на местах (ну иначе
        это был бы не 9 этап). И на всех гранях нет ни глазок, ни блоков.</p>
        <p>Вот и нашлось еще одно применение носику и ушкам. Необходимо взять кубик так, чтобы
        цвет угла смотрящего на вас совпадал с цветом ребра стоящего с той же стороны (см.картинку
        или видео). Повернуть как в носике или ушках крышей от себя и выполнить сначала носик, а
        потом никуда не переворачивая ушки.</p>
        <p style="text-align:center"><img src="accel_10_1.xml"></p>
        Фингертрикс: стандартное положение рук, <a href="rg2://ytplay?time=7:22&link=fpkbnBU0Cd0">на видео 7:22</a> <br/>
        <b>Алгоритм: (D\' R\' U\' R D R\' U R) (D\' R\' U R D R\' U\' R) </b>
    """;
    static const accel_st10_url = "fpkbnBU0Cd0";

    static const accel_st11_title = "N11 Рыбка (Акула)";
    static const accel_st11_descr = """
        <p>Если на 6 этапе получилась рыбка, и при постановке ее головой влево к себе на передней грани справа
        нет точки, а в других положениях головы точка слева, значит это акула. И поставить ее надо так, чтобы
        плыла она не к нам, а от нас, т.е. Головой вправо взад.</p>
        <p>Теперь включаем свет, от яркого света сильно едет крыша (2 раза), свет выключаем, и крыша начинает
        вставать на место (против часовой), поэтому мы снова включаем свет, крыша встает на место (против
        часовой) и мы выключаем свет. Т.е. По сути, делаем обычную рыбку но наоборот. Поскольку акула
        уплывает направо и вверх, т.е. на северо-восток, то назовем такую Акулу северо-восточной.</p>
        <p style="text-align:center"><img src="accel_11_1.xml"></p>
        Фингертрикс: в видео к сожалению не приведен, поэтому из другого
        <a href="rg2://ytplay?time=2:37&link=mknzlNHW6_A">видео</a>. Но т.к. в данном
        видео из стандартного положения рыбки головой влево к себе, то с дополнительным U2 вначале.<br/>
        Фингертрикс: <a href="rg2://ytplay?time=0:11&link=IasVqtCHoj0">от Феликса Земдекса.</a><br/>
        <b>Алгоритм: R U2 R\' U\' R U\' R\' </b><br/><br/>

        <p>Альтернативный вариант: поставить рыбку головой ВЛЕВО взад, назовем этот вариант <b>Акулы</b> северо-западным,
        т.к. акула уплывает на северо-запад.</p>
        <p style="text-align:center"><img src="accel_11_2.xml"></p>
        <b>Алгоритм: R\' U\' R U\' R\' U2 R </b><br/>

        <p>Для этого алгоритма очень удобный и быстрый <a href="rg2://ytplay?time=8:28&link=_ZqL3XwyoDE">фингертрикс</a>
        с начальным положением большого пальца правой руки сверху. Т.е. стандартное положение рук
        получается после первого хода и двойное кручение крыши можно делать указательным и средним
        пальцами правой руки.</p>

        <p>P.S. В принципе, используя всего два алгоритма Акулу и Рыбку, можно решать любую ситуацию
        7-го этапа. Подробнее как это делать, рассказано в ускорениях к \"методике для начинающих от Антона\".</p>
    """;
    static const accel_st11_url = "blOgwHue1PE";

    static const accel_st12_title = "N12 Домино (пуля)";
    static const accel_st12_descr = """
        <p>Ускорение для 6го этапа. Если на шестом этапе пуля и покрашены только 2 угла стоящие по диагонали,
        то это Домино. Поставить "доминошку" надо на северо-запад или юго-восток (кому как нравится) и так,
        чтобы на передней грани была точка, а не блок. И сделать морской пиф-паф, английский пиф-паф, крыша
        2 раза и снова английский пиф-паф.</p>
        <p>Можно делать данный алгоритм для любой пули на шестом этапе. Это будет быстрее чем пулю преобразовывать
        в палку или бумеранг, а потом решать их.</p>
        <p style="text-align:center"><img src="accel_12_1.xml"></p>
        Фингертрикс: <a href="rg2://ytplay?time=3:30&link=ZsybuodfAqM">на видео 3:30</a> <br/>
        Фингертрикс: <a href="rg2://ytplay?time=11:39&link=IasVqtCHoj0">от Феликса Земдегса</a> <br/>
        <b>Алгоритм: (R U R\' U) (R\' F R F\') U2 (R\' F R F\') </b>
    """;
    static const accel_st12_url = "ZsybuodfAqM";

    static const accel_st13_title = "N13 Глазки";
    static const accel_st13_descr = """
        <p>Глазки на 7ом этапе должны быть наглые, т.е. Взять надо глазками на себя. Дважды включаем
        или выключаем свет (R2 можно крутить в любую сторону), нижнюю по часовой, выключаем свет, сильно едет крыша (2 раза), включаем
        свет, низ против часовой, выключаем свет, крыша 2 раза и еще раз выключаем свет.</p>
        <p style="text-align:center"><img src="accel_13_1.xml"></p>
        Фингертрикс: <a href="rg2://ytplay?time=6:15&link=dzINk50Y1jI">на видео 6:15</a> <br/>
        Фингертрикс: <a href="rg2://ytplay?time=1:08&link=IasVqtCHoj0">от Феликса Земдегса</a> <br/>
        <b>Алгоритм: R2 D R\' U2 R D\' R\' U2 R\' </b><br/>
    """;
    static const accel_st13_url = "dzINk50Y1jI";

    static const accel_st14_title = "N14 Вертолет (глазки-ушки)";
    static const accel_st14_descr = """
        <p>Знакомая по Ускорению N3 ситуация, для которой есть более быстрый алгоритм, чем две рыбки. И алгоритм
        называется вертолет, а почему вертолет вы поймете, когда его выполните. Держать кубик надо также как
        и в ускорении N3, т.е. Глазками налево. Включаем свет, крыша 2 раза, дважды выключаем свет, крыша
        против часовой, включаем 2 раза, снова крыша против, опять выключаем 2 раза, крыша 2 раза и включаем свет.</p>
        <p style="text-align:center"><img src="accel_3_1.xml"></p>
        Фингертрикс: <a href="rg2://ytplay?time=3:08&link=m2EkIKd6efA">на видео 3:08</a> <br/>
        Фингертрикс: <a href="rg2://ytplay?time=0:14&link=47JfJxU7EjM">от J Perm</a> <br/>
        <b>Алгоритм: R U2 R2\' U\' R2 U\' R2\' U2 R </b>
    """;
    static const accel_st14_url = "m2EkIKd6efA";

    static const accel_st15_title = "N15 Запад (два двойных блока)";
    static const accel_st15_descr = """
        <p>Если на 8 этапе вам попались дяди друг напротив друга и есть два двойных блока, которые тоже
        располагаются друг напротив друга, то надо повернуть кубик двойным блоком слева и выполнить
        <b>Запад</b> - кубик соберется.</p>
        <p style="text-align:center"><img src="accel_15_1.xml"></p>
        <b>Алгоритм: (R U R\' U\' R\' F R2 U\' R\' U\') (R U R\' F\') </b><br/>
        P.S. Почему скобки в алгоритме поставлены именно так вы поймете в следующем ускорении.
    """;
    static const accel_st15_url = "huTpPTQWviU";

    static const accel_st16_title = "N16 Юг (тройной блок с двойным справа)";
    static const accel_st16_descr = """
        <p>Если на 8ом этапе вам попался тройной блок, то его в любом случае необходимо поставить слева. И далее
        посмотреть что на передней грани. А на передней грани может быть всего лишь пять вариантов, которые мы
        и рассмотрим.</p>
        <p>В этом ускорении рассмотрим ситуацию, когда на передней грани вы видите двойной
        блок справа. Надо применить комбинацию Юг, которая очень похожа на комбинацию запад. Только
        сначала надо выполнить 4 последних хода Запада, а потом Запад без этих четырех ходов.</p>
        <p style="text-align:center"><img src="accel_16_1.xml"></p>
        Фингертрикс: см.слепую <a href="rg2://ytplay?time=2:33&link=rzGqTZKG74o">сборку N7 с 2:33</a> <br/>
        <b>Алгоритм: (R U R\' F\') (R U R\' U\' R\' F R2 U\' R\' U\')</b>
    """;
    static const accel_st16_url = "YkHnPKT1m30";

    static const accel_st17_title = "N17 Окошки (тройной блок с глазками)";
    static const accel_st17_descr = """
        <p>Если есть тройной блок, а на остальных гранях глазки, то повернуть тройным блоком слева и
        посмотреть на глазки или в окошко между глазками. Глазки могут быть противоположные окошку,
        а могут быть смежные. Как выполнять посмотрите на видео, после этого станет понятно, почему
        в алгоритме скобки стоят именно так.</p>
        <b>Смежные глазки (окошки):</b><br/>
        <p style="text-align:center"><img src="accel_17_1.xml"></p>
        Фингертрикс: <a href="rg2://ytplay?time=7:18&link=dUGv4WJfJGU">на видео 7:18</a> <br/>
        <b>Алгоритм: R2 U\' (F B\') R2 (F\' B) U\' R2 </b><br/><br/>
        <b>Противоположные глазки (окошки):</b><br/>
        <p style="text-align:center"><img src="accel_17_2.xml"></p>
        Пока просто повторить данный алгоритм два раза, ну или выполнить данный алгоритм в обратном порядке,
        т.е. по сути вместо U\' делать U.<br/>
        Подробнее данная ситуация будет рассмотрена в <a href="rg2://ytplay?time=0:00&link=P69UVywfz04">Окошках PLL</a>.
    """;
    static const accel_st17_url = "dUGv4WJfJGU";

    static const accel_st18_title = "N18 Светофор (параллельный перенос)";
    static const accel_st18_descr = """
        <p>Если тройной блок слева, а на передней грани все наклейки разного цвета (светофор). Например так:</p>
        <p style="text-align:center"><img src="accel_18_2.xml"></p>
        <p> То придется делать
        очень длинный 18-ти ходовый алгоритм. Но все не так сложно, как кажется на первый взгляд.
        Выучить придется только 5 ходов. Три первых и два последних, а между ними Запад без последнего хода.
        Итак, первые три хода против часовой стрелки (правая, верхняя, передняя), теперь Запад без
        последнего хода и два хода по часовой стрелке - верхняя и правая грани.</p>
        <p style="text-align:center"><img src="accel_18_1.xml"></p>
        Фингертрикс: <a href="rg2://ytplay?time=5:30&link=ir8W-IBgmas">на видео 5:30</a> <br/>
        <b>Алгоритм: (R\' U\' F\') {R U R\' U\' R\' F R2 U\' R\' U\' (R U R\')} (U R) </b>
    """;
    static const accel_st18_url = "ir8W-IBgmas";

    static const accel_st19_title = "N19 Север (Тройной блок с блоком слева)";
    static const accel_st19_descr = """
        <p>Если на грани справа от тройного блока есть двойной блок и он примыкает к тройному, например так:</p>
        <p style="text-align:center"><img src="accel_19_2.xml"></p>
        <p>Тройной блок как обычно ставим слева и если на передней грани есть двойной блок и он слева,
        то придется делать неудобный алгоритм, т.к. в нем будет кручение левой грани.</p>
        <p>Поехали на 2 года в Лондон, и делаем 3 хода левого пиф-пафа, т.е. включаем свет слева,
        крыша против часовой, выключаем свет слева, возвращаемся на 2 года из Лондона, выключаем
        правый свет и от этого у нас едет земля под ногами, мы еще раз выключили свет и земля
        вернулась на место и от радости включаем свет 2 раза.</p>
        <p style="text-align:center"><img src="accel_19_1.xml"></p>
        Фингертрикс: <a href="rg2://ytplay?time=3:15&link=AoqKnYoDrio">на видео 3:15</a> <br/>
        <b>Алгоритм: F2 (L\' U\' L) F2 R\' D R\' D\' R2</b>
    """;
    static const accel_st19_url = "AoqKnYoDrio";

    static const accel_st20_title = "N20 9ый этап";
    static const accel_st20_descr = """
        <p>Ускорение для 9го этапа. Ставим собранный угол влево взад вверх, но наклоняем кубик крышей на себя,
        а не налево, как раньше. И смотрим на наклейку рядом с двойным блоком.
        Она может быть противоположной по цвету, а может быть смежной.</p>
        <p><b>\"Противоположная наклейка\"</b> - включаем свет, крыша против часовой, еще включаем свет,
        дважды крутим низ, выключаем свет, крыша назад (по часовой) и включаем свет, снова два раз низ,
        и два раза выключаем свет. Т.е. 3 хода, двойной низ, 3 хода двойной низ и двойной свет.</p>
        <p style="text-align:center"><img src="accel_20_1.xml"></p>
        <p><b>\"Смежная наклейка\"</b> - пока делаем старым алгоритмом. Альтернативные варианты рассмотрим
        в <a href="rg2://ytplay?time=0:00&link=L_r41Y1MuAY">PLL Треугольники</a> <br/>
        Фингертрикс: <a href="rg2://ytplay?time=6:00&link=B_Fkals9Svk">на видео 6:00</a> <br/>
        <b>Алгоритм: (R U\' R) D2 (R\' U R) D2 R2</b>
    """;
    static const accel_st20_url = "B_Fkals9Svk";

    static const accel_st21_title = "Немного терминологии";
    static const accel_st21_descr = """
    <p> Если вы дошли до данного видео, то вам полезно будет познакомиться с некоторыми международными
    терминами спидкубинга. Пригодится, если будете смотреть видео на английском, в том числе и
    приведенные в данной программе.<br/><br/>

    <b>1. <a href="rg2://ytplay?time=0:00&link=4nSnsav3bIU">Sexy Move</a></b>
    - в русском варианте <b>пиф-паф</b>. Простая четырехходовая комбинация <b>R U R\' U\'</b>. Ну а почему в
    английском варианте это так называется,
    <a href="rg2://ytplay?time=0:06&link=4nSnsav3bIU">смотрите в видео</a> :)))<br/><br/>

    <b>2. <a href="rg2://ytplay?time=0:18&link=4nSnsav3bIU">TPS</a></b> = Turns Per Second -
    количество ходов (поворотов) в секунду. Величина позволяющая оценить на сколько быстро вы
    крутите кубик. Чтобы оценить свой TPS выполните какую-то достаточно длинную комбинацию и заметьте
    время за которое вы это сделаете. Теперь поделите количество сделанных ходов, на время. Например
    <a href="rg2://ytplay?time=0:35&link=4nSnsav3bIU">Рыбку</a>, в которой семь ходов.<br/>
    Но, то что вы крутите кубик очень быстро не означает что вы быстро собираете кубик.
    <a href="rg2://ytplay?time=0:52&link=4nSnsav3bIU">Иначе говоря</a>,
    именно потому, что вы крутите слишком быстро, вы не сможете сохранять высокий TPS для всей сборки.
    Т.к. между выполнениями комбинаций у вас будут бОльшие паузы. Гораздо эффективнее, вращать кубик
    медленнее, но без пауз между комбинациями.<br/><br/>

    <b>3. <a href="rg2://ytplay?time=1:42&link=4nSnsav3bIU">Sune</a></b> = Рыбка из Ускорения N2,
    <b><a href="rg2://ytplay?time=2:07&link=4nSnsav3bIU">Antisune</a></b> = Акула из Ускорения N11,
    <b><a href="rg2://ytplay?time=2:13&link=4nSnsav3bIU">Pi</a></b> = Вертолет из Ускорения N14,
    <b><a href="rg2://ytplay?time=2:19&link=4nSnsav3bIU">U</a></b> = Глазки из Ускорения N13,
    <b><a href="rg2://ytplay?time=2:27&link=4nSnsav3bIU">T</a></b> = Ушки из Ускорения N8,
    <b><a href="rg2://ytplay?time=2:30&link=4nSnsav3bIU">L</a></b> = Носик из Ускорения N9 и
    <b><a href="rg2://ytplay?time=2:39&link=4nSnsav3bIU">H</a></b> = НТВ+ из Ускорения N8.
    Данные алгоритмы объединены в один блок как базовые OLL алгоритмы. В терминах применяемых в данной
    программе, именно эти алгоритмы позволяют решать 7-ой этап не новичковым методом.<br/><br/>

    <b>4. <a href="rg2://ytplay?time=2:43&link=4nSnsav3bIU">2-gen</a></b> = Turns 2 Layer,
    вращение двух слоев. Проще говоря, 2-gen алгоритмы, это такие алгоритмы, при выполнении которых вращаются только
    2 слоя. Чаще всего R и U. Например: пиф-паф, рыбка, PLL окошки, PLL рельсы. Такие алгоритмы можно
    выполнять очень быстро (с высоким TPS) и они очень удобны для сборки
    <a href="rg2://ytplay?time=3:16&link=4nSnsav3bIU">одной рукой</a>(One Hand).
    <b>3-gen</b> алгоритмы - соответственно те, при выполнении которых, вращаются 3 грани.<br/><br/>

    <b>5. <a href="rg2://ytplay?time=3:22&link=4nSnsav3bIU">Average vs Mean</a></b> - Усредненное
    и среднее время. Если дословно переводить с агнглийского, то и mean time и average time означает
    среднее время (сборки). Но считается оно по разному. Mean time - это суммарное время всех
    попыток поделенное на количество попыток, т.е. точное среднее время. В то время как Average это более
    абстрактное понятие, скорее не среднее, а усредненное время. Т.е. при его расчете, например не берутся
    лучший и худший результат. Или под понятием Average time может пониматься примерное среднее время
    сборок.<br/><br/>

    <b>6. <a href="rg2://ytplay?time=4:27&link=4nSnsav3bIU">Sledgehammer</a></b> -
    Кувалда или Английский пиф-паф <b>(R\' F R F\')</b>. Еще одна простая четырехходовка из Ускорения N1.
    Используется как часть многих алгоритмов. Так же можно использовать и как альтернативу первому
    базовому <b>U (R U\' R\')</b> алгоритму интуитивного F2L, особенно при постановке на свое место
    <a href="rg2://ytplay?time=4:42&link=4nSnsav3bIU">последней пары </a>. А в
    <a href="rg2://ytplay?time=4:54&link=4nSnsav3bIU">такой ситуации</a> и вовсе можно
    получить OLL Skip.<br/><br/>

    <b>7. <a href="rg2://ytplay?time=4:56&link=4nSnsav3bIU">AUF</a></b> - Adjust Upper Face.
    Установка верхней грани - установочные ходы для PLL алгоритмов, а также
    установка на свое место собранной верхней грани после PLL алгоритма. Обычно быстрее крутить верх,
    чем делать перехваты.<br/><br/>

    <b>8. <a href="rg2://ytplay?time=5:21&link=4nSnsav3bIU">CFOP, Roux, ZZ</a></b><br/>
    <b>CFOP</b> = Cross, F2L, OLL, PLL. Скоростной метод сборки, которым пользуется большинство спидкуберов.
    Так же известен как метод Джесики Фридрих. Как видно из названия состоит из последовательной
    сборки креста (Cross), первых двух слоев (F2L),
    ориентации последнего слоя (OLL) и перестановки последнего слоя (PLL).<br/>
    <b>Roux</b> (читается как Ру)- альтернативный скоростной метод сборки кубика. Основные моменты сборки
    отражены в видео.<br/>
    <b>ZZ</b> - еще один метод, суть которого в первоначальном правильном ориентировании ребер.<br/><br/>

    <b>9. <a href="rg2://ytplay?time=7:37&link=4nSnsav3bIU">COLL vs OLLCP</a></b><br/>
    <b>COLL</b> = Corners & OLL (углы и OLL),<br/>
    <b>OLLCP</b> = OLL & Corner Permutation (OLL и установка углов
    на свои места). Результат и тех и других алгоритмов одинаков - PLL с углами на своих местах,
    т.е. окошки, рельсы, шахматы или PLL скип. Но OLLCP - это набор алгоритмов для любой OLL ситуации,
    а COLL только для ситуации, когда желтый крест уже собран. Т.е. <b>COLL</b> это варианты алгоритмов для ситуаций
    из третьей части данного видео, по 6 на каждую ситуацию минус 2 ситуации для HTB+ где их всего 4,
    всего получается 40 алгоритмов.<br/><br/>

    <b>10. <a href="rg2://ytplay?time=8:51&link=4nSnsav3bIU">Metrics</a></b>
    Метрики - различные варианты подсчета ходов.<br/>
    <b><a href="rg2://ytplay?time=9:15&link=4nSnsav3bIU">STM</a></b>
    = Slice Turn Metric. Метрика в которой ходы среднего слоя (M, S) считаются как один ход.
    Вот <a href="rg2://ytplay?time=9:23&link=4nSnsav3bIU">пример подсчета</a> STM
    ходов для алгоритма <b>M2 U\' M U2 M\' U\' M2</b>.<br/>
    <b><a href="rg2://ytplay?time=9:32&link=4nSnsav3bIU">HTM</a></b>
    = Half Turn Metric. В HTM ходы среднего слоя считаются как 2 хода, т.е. как последовательные
    ходы боковых граней. Например тот же самый алгоритм <b>M2 U\' M U2 M\' U\' M2</b> в метрике HTM
    будет подсчитан как 11 ходов.<br/>
    <b><a href="rg2://ytplay?time=9:53&link=4nSnsav3bIU">QTM</a></b>
    = Quarter Turn Metric. В данной метрике поворот любой грани на 90 градусов означает один ход.
    Т.е. ход типа R2 или U2 в данной метрике будет считаться как 2 хода.<br/>
    <b><a href="rg2://ytplay?time=9:53&link=4nSnsav3bIU">ETM</a></b>
    = Execution Turn Metric. Тут все еще интереснее, как видно из названия,
    в данной метрике количество ходов зависит от того как вы исполняете данный алгоритм. Т.е.
    одно действие = один ход. Например, если вы
    <a href="rg2://ytplay?time=10:15&link=4nSnsav3bIU">делаете U2 так</a>,
    то это 2 хода, а <a href="rg2://ytplay?time=10:18&link=4nSnsav3bIU">если так</a>,
    то один. Так же в ETM перехват куба считается за один ход.<br/><br/>

    <b>11. <a href="rg2://ytplay?time=0:00&link=XhjQNdEaHJw">VLS</a></b>
    Valk Last Slot - алгоритмы позволяющие решать OLL без постановки на место последней пары F2L.
    Называются так в честь разработчика и популяризатора этой методики Матса Валька (Mats Valk).
    Методика включает в себя порядка 200 алгоритмов. Поэтому для начала можно освоить
    <b><a href="rg2://ytplay?time=0:20&link=XhjQNdEaHJw">Winter Variation</a></b>.
    Данные алгоритмы являются частью VLS и отличаются тем, что крест на верхней стороне уже собран
    и соответственно таких алгоритмов уже меньше - всего 27. И найти их
    <a href="rg2://ytplay?time=0:00&link=rbRJWAH_pts">можно тут.</a><br/><br/>

    </p>

    """;
    static const accel_st21_url = "4nSnsav3bIU";

}