
import 'package:rg2_flutter_getx/models/phases.dart';

class Mirror implements Phase {
  @override
  int count = mirror_title.length;

  @override
  String phase = "MIRROR";

  @override
  List<String> titles() => mirror_title;

  @override
  List<String> icons() => mirror_icon;

  @override
  List<String> descriptions() => mirror_descr;

  @override
  List<String> urls() => mirror_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const mirror_title = [
        mirror_st1_title,
        mirror_st2_title,
        mirror_st3_title,
        mirror_st4_title,
        mirror_st5_title,
    ];

    static const mirror_icon = [
        "mirror_1",
        "mirror_2",
        "mirror_3",
        "mirror_4",
        "mirror",
    ];
    
    static const mirror_descr = [
        mirror_st1_descr,
        mirror_st2_descr,
        mirror_st3_descr,
        mirror_st4_descr,
        mirror_st5_descr,
    ];


    static const mirror_url = [
        mirror_st1_url,
        mirror_st2_url,
        mirror_st3_url,
        mirror_st4_url,
        mirror_st5_url,
    ];
    
    static const mirror_st1_title = "1. Правильный крест";
    static const mirror_st1_descr = """
        <p>В собранном виде данная головоломка представляет из себя
        <a href="rg2://ytplay?time=0:22&link=Bv2xJrjkcpI">куб.</a></p>
        <p style="text-align:center"><img src="mirror.xml"></p>

        <p>А вот в разобранном виде, что-то <a href="rg2://ytplay?time=1:08&link=Bv2xJrjkcpI">абсолютно непонятное.</a></p>
        <p style="text-align:center"><img src="mirror_1_1.xml"></p>

        <p>Именно поэтому очень сложно объяснить словами и показать в статичных картинках, как же
        все таки собирается данная головоломка. Поэтому, если вам что-то непонятно из текста,
        не пожалейте интернета, пощелкайте по ссылкам и посмотрите интересующий вас момент в видео.</p>

        <p>Зеркальный куб, он же миррор блокс, по сути является обычным кубиком 3х3, только его элементы различаются не
        цветом, а <a href="rg2://ytplay?time=1:36&link=Bv2xJrjkcpI">размером</a> (длиной, шириной и высотой).
        У него так же шесть <a href="rg2://ytplay?time=3:26&link=Bv2xJrjkcpI">центров</a> (элементов
        имеющих одну наклейку), двенадцать <a href="rg2://ytplay?time=3:32&link=Bv2xJrjkcpI">ребер</a>
        (элементов с двумя наклейками) и восемь <a href="rg2://ytplay?time=3:35&link=Bv2xJrjkcpI">углов</a>
        (элементов с тремя наклейками). Как и в кубике 3х3 в нем нет абсолютно одинаковых элементов,
        только в трешке нет элементов с абсолютно одинаковыми цветами, а тут нет элементов абсолютно
        равных по размеру.</p>

        <p><i>Собирается миррор блокс точно так же, как и <a href="rg2://ytplay?time=2:10&link=Bv2xJrjkcpI">кубик 3х3.</a>
        Поэтому эта обучалка будет рассчитана на тех, кто уже умеет собирать кубик 3х3.</i></p>

        И первое, что необходимо сделать, это конечно же <a href="rg2://ytplay?time=4:08&link=Bv2xJrjkcpI">выбрать сторону,</a>
        с которой начать сборку.
        Естественно, что как и обычную трешку, миррор блокс можно начать собирать с любой стороны, но
        проще всего это сделать начав сборку с самой длинной (высокой) <a href="rg2://ytplay?time=4:42&link=Bv2xJrjkcpI">стороны.</a>
        Т.е. нам необходимо найти такой центр головоломки, выше которого нет ни одного элемента.
        <a href="rg2://ytplay?time=5:50&link=Bv2xJrjkcpI">Например,</a> как на данной картинке,
        <p style="text-align:center"><img src="mirror_1_2.xml"></p>

        <p>есть элементы, которые ниже центра, есть которые равны центру,
        но нет ни одного элемента <a href="rg2://ytplay?time=6:28&link=Bv2xJrjkcpI">выше центра.</a>
        Значит, с большой долей вероятности, это и есть наш самый высокий центр.<p>

        <p>Теперь вокруг этого центра <a href="rg2://ytplay?time=7:18&link=Bv2xJrjkcpI">соберем крест.</a>
        Как и в кубике 3х3 начинаем искать нужные нам
        элементы на втором этаже. Если их там нет, то на третьем, потом на первом этаже, ну или в подвале.
        Все точно так же, как и на трешке. И как вы наверно уже догадались, нужны нам самые длинные элементы.
        <a href="rg2://ytplay?time=7:48&link=Bv2xJrjkcpI">Например:</a></p>
        <p style="text-align:center"><img src="mirror_1_3.xml"></p>

        <p>Для большинства этой информации будет достаточно, чтобы дальше собрать головоломку
        самостоятельно. Попробуйте отложить телефон и собрать миррор блокс сами.
        Если не получилось, то вот, что нужно сделать.</p>

        <p>Собираем из этих самых длинных элементов вот такой <a href="rg2://ytplay?time=10:28&link=Bv2xJrjkcpI">крест:</a></p>
        <p style="text-align:center"><img src="mirror_1_4.xml"></p>

        <p>А теперь, <a href="rg2://ytplay?time=12:52&link=Bv2xJrjkcpI">делаем его правильным.</a>
        Т.е. делаем так, чтобы все ребра совпадали с обоими своими
        центрами (верхним и боковым). Т.е. определяем, где у нас дяди, а где тети.
        <a href="rg2://ytplay?time=13:25&link=Bv2xJrjkcpI">Дядя</a> в данном случае,</p>
        <p style="text-align:center"><img src="mirror_1_5.xml"></p>

        <p>это когда ребро находится вровень со своим боковым центром. А вот это
        <a href="rg2://ytplay?time=13:04&link=Bv2xJrjkcpI">тетя,</a></p>
        <p style="text-align:center"><img src="mirror_1_6.xml"></p>

        <p>когда ребро и центр образуют ступеньку.</p>

        <p>Делаем все как на кубике 3х3, ставим дядей на 6 и 9 часов, выполняем пиф-паф и доворачиваем
        правую грань. А если дяди стоят друг напротив друга, то отправляем их
        <a href="rg2://ytplay?time=13:40&link=Bv2xJrjkcpI">в тюрьму.</a></p>
        <p style="text-align:center"><img src="mirror_1.xml"></p>

        <p>Получаем правильный крест и переходим к следующему этапу.</p>
    """;
    static const mirror_st1_url = "Bv2xJrjkcpI";

    static const mirror_st2_title = "2. Первый слой";
    static const mirror_st2_descr = """
        <p>Переворачиваем головоломку собранным <a href="rg2://ytplay?time=0:28&link=LxxT2SVJWjk">крестом вниз.</a>
        И начинаем ставить на свои места углы нижнего слоя.</p>

        <p>С углами, как и с ребрами, ищем <a href="rg2://ytplay?time=0:39&link=LxxT2SVJWjk">самые длинные.</a>
        Самое сложное на этом этапе - определить место
        <a href="rg2://ytplay?time=1:24&link=LxxT2SVJWjk">найденного угла.</a> Но немного практики
        и вы без проблем научитесь это делать, главное не бояться ошибиться, в этом нет
        <a href="rg2://ytplay?time=4:22&link=LxxT2SVJWjk">ничего страшного.</a></p>

        <p>Находим длинный уголок. Подгоняем его к своей квартире и заселяем при помощи
        <a href="rg2://ytplay?time=2:18&link=LxxT2SVJWjk">пиф-пафов.</a>
        <p style="text-align:center"><img src="mirror_2_1.xml"> => <img src="mirror_2_2.xml"></p>

        <p>В итоге должно получиться что-то типа <a href="rg2://ytplay?time=6:46&link=LxxT2SVJWjk">этого.</a></p>
        <p style="text-align:center"><img src="mirror_2.xml"></p>

    """;
    static const mirror_st2_url = "LxxT2SVJWjk";

    static const mirror_st3_title = "3. Второй слой";
    static const mirror_st3_descr = """
        <p>На этом этапе поставим на свои места ребра <a href="rg2://ytplay?time=0:22&link=mxF-Ulwc3pw">второго слоя.</a>
        Если вы привыкли собирать кубик с белой стороны, то на данном этапе вы ищите ребра без желтой наклейки. По
        аналогии, в миррор блоксе надо искать НЕ низкие <a href="rg2://ytplay?time=0:33&link=mxF-Ulwc3pw">(не тонкие) ребра.</a></p>

        <p>Находим такое ребро и делаем стебель ромашки, который на миррор блоксе выглядит, как
        <a href="rg2://ytplay?time=1:45&link=mxF-Ulwc3pw">ровный столбик.</a></p>
        <p style="text-align:center"><img src="mirror_3_1.xml"></p>

        <p>Теперь <a href="rg2://ytplay?time=2:13&link=mxF-Ulwc3pw">определяем,</a>
        какая у нас получилась ромашка: \"направо\" или \"налево\". Если не
        получается сделать это \"на глазок\", то для этого просто
        наклоните стебель <a href="rg2://ytplay?time=2:20&link=mxF-Ulwc3pw">направо или налево.</a>
        Где в итоге ребро будет полностью состыковано с другим,
        такая и получается ромашка.</p>

        <p>Выполняем все аналогично пятому этапу кубика 3х3. В итоге должно получиться что-то типа
        <a href="rg2://ytplay?time=6:44&link=mxF-Ulwc3pw">этого.</a></p>
        <p style="text-align:center"><img src="mirror_3.xml"></p>

    """;
    static const mirror_st3_url = "mxF-Ulwc3pw";

    static const mirror_st4_title = "4. Ровняем крышу";
    static const mirror_st4_descr = """
        <p>Как вы наверно уже поняли из названия, цель данного этапа сделать так, чтобы вся крыша
        стала сверху ровной, т.е. выполняем OLL для миррор блокса. Продвинутым куберам думаю не надо
        объяснять, что можно использовать OLL-алгоритмы от кубика 3х3, а для начинающих, опять же,
        как и в кубике 3х3, проще всего это сделать в два подэтапа. Сначала выровнять ребра, а
        потом углы.</p>

        <p><a href="rg2://ytplay?time=0:46&link=fypO93TJZQA">Ровняем ребра:</a></p>

        <p></p>Смотрим, что у нас за ситуация: пуля, бумеранг или палка. В зависимости
        <a href="rg2://ytplay?time=2:22&link=fypO93TJZQA">от этого:</a> едем в Лондон,
        делаем сколько надо пиф-пафов и возвращаемся из Лондона.</p>
        <p style="text-align:center"><img src="mirror_4_1.xml">=><img src="mirror_4_2.xml"></p>

        <p>Теперь ровняем углы, любым способом, которым вы умеете.
        <a href="rg2://ytplay?time=3:18&link=fypO93TJZQA">Пиф-пафами,</a> Рыбкой и Акулой
        (Камбрией и Колибри по <a href="rg2://ytplay?time=21:57&link=RukIJdEiOoI">методу А.Кима</a>)
        или применив Ускорения от Максима. Тут самое главное понять, что куда элемент
        смотрит низкой (тонкой) стороной, та и есть \"желтая\", если вы привыкли собирать трешку
        начиная с белой стороны.</p>

        <p>Т.е. выполняем все аналогично шестому и седьмому этапу кубика 3х3. В итоге должно получиться
        что-то типа <a href="rg2://ytplay?time=5:54&link=fypO93TJZQA">этого.</a></p>
        <p style="text-align:center"><img src="mirror_4.xml"></p>
    """;
    static const mirror_st4_url = "fypO93TJZQA";

    static const mirror_st5_title = "5. Квадратим крышу";
    static const mirror_st5_descr = """
        <p>Ну и на последнем этапе делаем крышу не только ровной, но и квадратной. Опять же все
        аналогично кубику 3х3, можете использовать PLL алгоритмы, а можете сначала поставить
        на место ребра при помощи <a href="rg2://ytplay?time=1:52&link=A85jHAryfdw">\"Убийства в Лондоне\",</a></p>
        
        <p style="text-align:center"><img src="mirror_5_1.xml"></p>

        <p>а потом углы при помощи <a href="rg2://ytplay?time=3:00&link=A85jHAryfdw">\"Инфаркта\".</a></p>

        <p style="text-align:center"><img src="mirror.xml"></p>
        <a href="rg2://ytplay?time=3:30&link=A85jHAryfdw">Profit!</a>
    """;
    static const mirror_st5_url = "A85jHAryfdw";

}
