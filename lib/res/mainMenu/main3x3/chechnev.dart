
import 'package:rg2_flutter_getx/models/phases.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/recomendation.dart';

import 'rozov.dart';

class Begin implements Phase {
  @override
  int count = begin_title.length;

  @override
  String phase = "BEGIN";

  @override
  List<String> titles() => begin_title;

  @override
  List<String> icons() => begin_icon;

  @override
  List<String> descriptions() => begin_descr;

  @override
  List<String> urls() => begin_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const begin_title = [
        Rozov.rozov_st1_title,
        begin_st1_title,
        begin_st2_title,
        begin_st3_title,
        begin_st4_title,
        begin_st5a_title,
        begin_st5b_title,
        begin_st6_title,
        begin_st7_title,
        begin_st8_title,
        begin_st9_title,
        Recomendation.recomendation1_title,
    ];

    static const begin_icon = [
        "assets/images/main3x3/begin/begin_0.svg",
        "assets/images/main3x3/begin/begin_1.svg",
        "assets/images/main3x3/begin/begin_2.svg",
        "assets/images/main3x3/begin/begin_3.svg",
        "assets/images/main3x3/begin/begin_4.svg",
        "assets/images/main3x3/begin/begin_5a.svg",
        "assets/images/main3x3/begin/begin_5b.svg",
        "assets/images/main3x3/begin/begin_6.svg",
        "assets/images/main3x3/begin/begin_7.svg",
        "assets/images/main3x3/begin/begin_8.svg",
        "assets/images/main3x3/begin/begin_9.svg",
        "assets/images/main3x3/begin/begin_0.svg",
    ];
    
    static const begin_descr = [
        Rozov.rozov_st1_descr,
        begin_st1_descr,
        begin_st2_descr,
        begin_st3_descr,
        begin_st4_descr,
        begin_st5a_descr,
        begin_st5b_descr,
        begin_st6_descr,
        begin_st7_descr,
        begin_st8_descr,
        begin_st9_descr,
        Recomendation.recomendation1_descr,
    ];


    static const begin_url = [
        Rozov.rozov_st1_url,
        begin_st1_url,
        begin_st2_url,
        begin_st3_url,
        begin_st4_url,
        begin_st5a_url,
        begin_st5b_url,
        begin_st6_url,
        begin_st7_url,
        begin_st8_url,
        begin_st9_url,
        "",
    ];

    static const begin_st1_title = "Этап 1. Выбор стороны";
    static const begin_st1_descr = """
        <p>Начнем с плюсов этой методики. Их несколько: небольшое количество алгоритмов для
        запоминания (всего 5), простота этих алгоритмов, и самое главное <b>нестандартный способ
        запоминания</b> этих алгоритмов. Еще одним огромным плюсом данной методики является
        возможность постепенного, плавного перехода к скоростной сборке по методу
        Джессики Фридрих (он же CFOP).
        </p>

        <p>Первым делом нужно выбрать сторону с которой вы начнете собирать кубик. Сборку можно начать с
        абсолютно любой стороны.<br/>
        <p style="text-align:center"><img src="begin_1_1.xml"></p>

        В иллюстрациях к данному курсу будем считать, что это белая сторона, а серым цветом в кубике
        будем указывать наклейки цвет которых не имеет значения.
        Теперь представьте, что кубик это трехэтажный дом с крышей того цвета, что вы сейчас выбрали
        и вертолетной площадкой на крыше. На протяжении нескольких следующих этапов постарайтесь не
        уронить вертолет стоящий на площадке (держите кубик выбранной стороной всегда вверх).
        Вот и весь <a href="rg2://ytplay?time=2:12&link=0TvO_rpG_aM">первый этап.</a></p>

        <p>Более подробно все сказанное выше (впрочем как и для всех остальных этапов методики для начинающих)
        рассмотрено в видео от Максима Чечнева чуть ниже. Или вы можете щелкнуть по выделенному тексту
        чтобы сразу начать просмотр видео именно с того момента, о котором написано в тексте.</p>
    """;
    static const begin_st1_url = "0TvO_rpG_aM";

    static const begin_st2_title = "Этап 2. Нижний крест";
    static const begin_st2_descr = """
        <p>На данном этапе обращаем внимание только на
        <a href="rg2://ytplay?time=1:45&link=8VCsFNFa5yM">ребра кубика,</a> а углы не замечаем, они нас
        пока не интересуют. Наша задача поставить на место четыре ребра, причем ищем только ребра
        того цвета, <a href="rg2://ytplay?time=2:22&link=8VCsFNFa5yM"> который выбрали</a> на первом этапе.
        Так же на данном этапе, мы узнаем что такое
        <a href="rg2://ytplay?time=11:15&link=8VCsFNFa5yM">\"поездка в Лондон\"</a> и
        <a href="rg2://ytplay?time=7:58&link=8VCsFNFa5yM">\"едет крыша\"</a> применительно к данной методике сборки кубика. </p>

        <p>И для начала ищем наши ребра на
        <a href="rg2://ytplay?time=5:54&link=8VCsFNFa5yM">втором этаже</a>
        нашего трехэтажного дома (в хороших, дорогих квартирах).</p>
        <p style="text-align:center"><img src="begin_2_1.xml" width="60%%"></p>
        <p>Если находим такое ребро, то ставим его \"на крышу\" одним поворотом соответствующей (правой
        или левой) грани. Если поворот грани смещает со своего места
        <a href="rg2://ytplay?time=7:13&link=8VCsFNFa5yM">другое ребро</a> на крыше, т.е. место уже
        занято, то
        <a href="rg2://ytplay?time=7:58&link=8VCsFNFa5yM">нам становится сложно</a>
        и у нас от этого \"едет крыша\", т.е. мы крутим верхнюю грань.
        И снова пробуем поставить ребро \"на крышу\". Если место снова занято, то опять \"едет крыша\"
        и т.д. пока не найдем место для ребра. Продолжаем искать ребра того цвета, что выбрали на
        первом этапе на втором этаже, если нашлись, ставим "на крышу" по методу описанному выше.</p>

        <p>Если на втором этаже больше ребер нет, а места на крыше еще есть, то поиски ребра
        <a href="rg2://ytplay?time=9:20&link=8VCsFNFa5yM">продолжаем на третьем этаже</a>
        в более дешевых (т.к. там периодически течет крыша), чем на втором этаже
        квартирах.</p>
        <p style="text-align:center"><img src="begin_2_2.xml" width="60%%"></p>
        <p><a href="rg2://ytplay?time=10:25&link=8VCsFNFa5yM">И если находим,</a>
        то сначала нужно наше ребро переселить на второй этаж (в хорошую
        дорогую квартиру). Для этого мы отправляем его
        <a href="rg2://ytplay?time=11:15&link=8VCsFNFa5yM">\"в Лондон\"</a> на заработки (крутим переднюю грань
        по часовой стрелке). Ну а после того как ребро оказалось на втором этаже, мы
        <a href="rg2://ytplay?time=12:25&link=8VCsFNFa5yM">уже знаем что делать</a> (см.выше).</p>

        <p>Если же ни на втором, ни на третьем этаже нужных
        <a href="rg2://ytplay?time=14:15&link=8VCsFNFa5yM">ребер нет,</a> то ищем их
        <a href="rg2://ytplay?time=15:00&link=8VCsFNFa5yM">на первом этаже</a> (в
        еще более дешевых квартирах, т.к. там воняет из подвала).</p>
        <p style="text-align:center"><img src="begin_2_3.xml" width="60%%"></p>

        <p><a href="rg2://ytplay?time=15:10&link=8VCsFNFa5yM">И если находим,</a> то надо опять
        отправить наше ребро "в Лондон" на заработки, причем отправить так, чтобы
        <a href="rg2://ytplay?time=15:58&link=8VCsFNFa5yM">не сбить с крыши</a>
        уже находящиеся там ребра. Если поездка "в Лондон" сбивает какое-то ребро с крыши, то нам
        опять становится сложно и у нас "едет крыша" до тех пор, пока не сможем уехать "в Лондон"
        никого не сбив. После удачной поездки в Лондон ребро оказывается на втором этаже, и что
        делать в этом случае <a href="rg2://ytplay?time=16:55&link=8VCsFNFa5yM">мы уже знаем.</a></p>

        <p>Ну и если еще не все места на крыше заняты, а
        <a href="rg2://ytplay?time=21:10&link=8VCsFNFa5yM">наших ребер нет</a> в квартирах ни на втором,
        ни на третьем, ни на первом этаже, то значит наше ребро бомж и искать его надо в подвале.
        <p style="text-align:center"><img src="begin_2_4.xml" width="60%%"></p>
        Находим его, поворачиваем кубик, так чтобы ребро в подвале было
        <a href="rg2://ytplay?time=21:48&link=8VCsFNFa5yM">максимально близко к нам,</a>
        затем надо повернуть крышу так, чтобы
        <a href="rg2://ytplay?time=22:32&link=8VCsFNFa5yM">место для этого ребра</a> тоже было максимально близко к
        нам и отправить ребро на
        <a href="rg2://ytplay?time=23:10&link=8VCsFNFa5yM">два года</a> (двойной заработок, т.к. это бомж) "в Лондон".</p>

        <p>Более подробно все сказанное выше (впрочем как и для всех остальных этапов методики для начинающих)
         рассмотрено в видео от Максима Чечнева чуть ниже.</p>
    """;
    static const begin_st2_url = "8VCsFNFa5yM";

    static const begin_st3_title = "Этап 3. Правильный крест";
    static const begin_st3_descr = """
        <p>На третьем этапе продолжаем <a href="rg2://ytplay?time=1:16&link=ku-FyZvD48Q">заниматься ребрами,</a>
        теперь надо их <a href="rg2://ytplay?time=2:49&link=ku-FyZvD48Q">совместить со своими центрами.</a>
        Узнаем, где у кубика <a href="rg2://ytplay?time=8:37&link=ku-FyZvD48Q">выключатель света,</a>
        что такое <a href="rg2://ytplay?time=8:19&link=ku-FyZvD48Q"><b>пиф-паф</b></a>,
        а так же кто такие <a href="rg2://ytplay?time=4:20&link=ku-FyZvD48Q">дяди</a>
        и <a href="rg2://ytplay?time=4:37&link=ku-FyZvD48Q">тети.</a></p>
        <p>Договоримся, что ребро состыкованное со
        своим центром мы будем называть <a href="rg2://ytplay?time=4:20&link=ku-FyZvD48Q">\"дядей\"</a>,
        а несостыкованное - <a href="rg2://ytplay?time=4:37&link=ku-FyZvD48Q">\"тетей\".</a>
        </p>
        <p style="text-align:center"><img src="begin_3_2.xml"><br/>
         Это дяди</p>
         <p style="text-align:center"><img src="begin_3_3.xml"><br/>
         А это тети</p>
        <p>Т.е. задача данного этапа, сделать так, чтобы у нас в кубике было 4 дяди.
        Что для этого нужно сделать:<br/>
        1. Надо покрутить крышу так, чтобы получилось
        <a href="rg2://ytplay?time=5:01&link=ku-FyZvD48Q">два \"дяди\" и две \"тети\".</a> Всегда есть
        такое положение крыши, при котором будут два дяди две тети.</p>

        <p>2. Теперь взять <a href="rg2://ytplay?time=6:36&link=ku-FyZvD48Q">кубик так,</a>
        чтобы один дядя был наглый (смотрел на нас), а второй дядя \"пошел налево\".</p>
        <p style="text-align:center"><img src="begin_3_1.xml"><br/></p>

        <p>И выполнить очень простую комбинацию, которая называется
        <a href="rg2://ytplay?time=8:19&link=ku-FyZvD48Q"><b>пиф-паф</b>.</a></p>

        <p>Чтобы запомнить как делать <a href="rg2://ytplay?time=8:19&link=ku-FyZvD48Q"><b>пиф-паф</b></a>
        представьте, что вы проснулись ночью и включили свет
        (повернули правую грань по часовой стрелке) и от яркого света у вас "поехала крыша" (крутим
        верхнюю грань) тоже по часовой стрелке. Вы выключили свет (правая грань против часовой
        стрелки) и "крыша" вернулась на свое место (верхняя грань против часовой стрелки). Ну и
        после пиф-пафа еще надо дополнительно включить свет.
        </p>
        
        <p>Для уже знающих формулы все вышесказанное выглядит немного проще:<br/>
        <b>(R U R\' U\') R </b>- <b>пиф-паф</b> выделен скобочками.</p>

        <p>Все тети должны стать дядями, т.е. цель третьего этапа выполнена. Но&#8230<br/><br/>

        Если у вас сложилась ситуация, что дяди расположены
        <a href="rg2://ytplay?time=12:45&link=ku-FyZvD48Q">друг напротив друга</a> и поставить
        одного к себе, а другого налево не получается, то нужно повернуть кубик тетей к себе и
        отправить обоих дядей в "тюрьму" (на второй этаж). Повернуть крышу дважды и вернуть дядей
        на место.</p>
        <p>В этом случае, формула такая: <b>(R\' L) U2 (R L\')</b></p>

        Вот что должно у нас получится после выполнения данного этапа (4 дяди):
        <p style="text-align:center"><img src="begin_3.xml"></p>

        <p>Более подробно все сказанное выше рассмотрено в видео от Максима Чечнева чуть ниже.</p>
    """;
    static const begin_st3_url = "ku-FyZvD48Q";

    static const begin_st4_title = "Этап 4. Первый (нижний) слой";
    static const begin_st4_descr = """
        <p>На этом этапе ставим на место углы выбранной на первом этапе стороны. Для этого
        переворачиваем кубик данной стороной вниз <a href="rg2://ytplay?time=2:06&link=Vt9dHndW7-E">(в подвал).</a>
        И начинаем искать нужных нам \"парней\"
        (углы с одной из наклеек цвета выбранного на первом этапе). И ищем их на <a href="rg2://ytplay?time=2:23&link=Vt9dHndW7-E">\"крыше\" или \"третьем этаже\"</a>
        нашего здания, т.е. на верхней грани.<br/><br/>

        <a href="rg2://ytplay?time=2:40&link=Vt9dHndW7-E">Если находим,</a> то ставим наш угол
        в правый верхний ближний угол кубика. Обратите внимание, что на картинках уже собранный
        крест - белый, а в видео - желтый. Поэтому и на картинках угол с белой наклейкой, а в видео
        с желтой. Т.е. кубик надо взять как-то так:
        </p>
        <p style="text-align:center"><img src="begin_4_7.xml"><br/>
                                    <img src="begin_4_9.xml"><br/>
                                    <img src="begin_4_10.xml"></p>

        <p>Теперь его надо подогнать к своей квартире. А квартира у него находится
        между центрами его <a href="rg2://ytplay?time=4:20&link=Vt9dHndW7-E">дополнительных цветов,</a>
        тех двух цветов, которые не совпадают с цветом креста на нижней грани.<br/>
        Для этого фиксируем крышу и крутим <a href="rg2://ytplay?time=5:50&link=Vt9dHndW7-E">нижние два слоя</a>
        так, чтобы <a href="rg2://ytplay?time=9:01&link=Vt9dHndW7-E">спереди и справа</a> были эти два центра.<br/><br/>
        <p style="text-align:center"><img src="begin_4_8.xml"></p>

        И теперь в зависимости от того <a href="rg2://ytplay?time=9:43&link=Vt9dHndW7-E">какой \"парень\":</a>
        скромный, с завышенной самооценкой
        или наглый делаем соответственно 1, 3 или 5 <a href="rg2://ytplay?time=7:07&link=Vt9dHndW7-E"><b>пиф-паф</b>ов.</a></p>

        <p style="text-align:center"><img src="begin_4_2.xml"><br/>
        скромный парень = <a href="rg2://ytplay?time=7:07&link=Vt9dHndW7-E">1 пиф-паф</a></p>

        <p style="text-align:center"><img src="begin_4_3.xml"><br/>
        с завышенной самооценкой = <a href="rg2://ytplay?time=10:22&link=Vt9dHndW7-E">3 пиф-пафа</a></p>

        <p style="text-align:center"><img src="begin_4_4.xml"><br/>
        наглый парень =  <a href="rg2://ytplay?time=13:25&link=Vt9dHndW7-E">5 пиф-пафов</a></p>

        <p>Если \"парень\" на первом этаже или в подвале, но не на своем месте, то кубик необходимо
        взять так, чтобы \"парень\" оказался в правом ближнем нижнем углу. Например:</p>

        <p style="text-align:center"><img src="begin_4_5.xml"> или <img src="begin_4_6.xml"></p>

        <p>и поднять его на 3 этаж при помощи все того же <b>пиф-пафа</b>.<br/>
        <b>Алгоритм пиф-пафа: (R U R\' U\')</b><br>
        Ну а что делать с углом на 3-ем этаже - смотри выше.</p>

        <p>Алгоритм для более быстрого решения наглых парней будет рассмотрен в Ускорениях для
         начинающих. На данный момент, важнее довести выполнение пиф-пафов до автоматизма. А как их делают
         профессионалы <a href="rg2://ytplay?time=0:06&link=4nSnsav3bIU">смотрите в видео.</a></p>

        <p>Более подробно все сказанное выше рассмотрено в видео от Максима Чечнева чуть ниже.</p>
    """;
    static const begin_st4_url = "Vt9dHndW7-E";

    static const begin_st5a_title = "Этап 5а. Два нижних слоя (Ромашки)";
    static const begin_st5a_descr = """
        <p>На этом этапе занимаемся ребрами, которые должны находиться на
        <a href="rg2://ytplay?time=4:48&link=v3J6-5_J29s">втором этаже</a>
        нашего
        трехэтажного дома. Поскольку ребра находятся на втором этаже, то искать будем ребра без
        цвета крыши. А вот искать мы их будем как раз на крыше и третьем этаже, т.е. на верхней грани.
        И после того, как нашли нужное ребро (<a href="rg2://ytplay?time=6:02&link=v3J6-5_J29s">без цвета крыши</a>)
        крутим два нижних слоя до тех пор, пока нижняя
        наклейка нашего ребра (находящаяся на третьем этаже) не совпадет по цвету с цветом центра
        грани, тем самым образовав <a href="rg2://ytplay?time=9:23&link=v3J6-5_J29s"><b>стебель ромашки</b></a>
        (три одинаковые вертикально стоящие наклейки).</p>
        <p style="text-align:center"><img src="begin_5_4.xml"></p>

        Теперь смотрим на верхнюю (находящуюся на крыше) наклейку и сравниваем ее цвет с цветом
        центров граней находящихся слева и справа, тем самым определив тип нашей ромашки: у нас
        <a href="rg2://ytplay?time=17:08&link=v3J6-5_J29s"><b>ромашка налево</b></a> или
        <a href="rg2://ytplay?time=11:21&link=v3J6-5_J29s"><b>ромашка направо</b></a>.
        Далее <a href="rg2://ytplay?time=11:47&link=v3J6-5_J29s">поворачиваем кубик</a> так, чтобы стебель ромашки
        был справа и крутим поочередно <b>только правую и верхнюю грани</b> кубика начиная с правой:</p>
        <p>- если у нас <a href="rg2://ytplay?time=12:11&link=v3J6-5_J29s"><b>ромашка направо</b></a>,
        то сначала 5 раз по часовой, затем 5 раз против часовой стрелки.</p>
        
        <p style="text-align:center"><img src="begin_5_1.xml"></p>
        
        <p><b>Алгоритм: (R U R U R) (U\' R\' U\' R\' U\')</b></p>
        <p>- если <a href="rg2://ytplay?time=17:53&link=v3J6-5_J29s"><b>ромашка налево</b></a>,
        то сначала 5 раз против часовой, а затем 5 раз по часовой стрелке.</p>
        
        <p style="text-align:center"><img src="begin_5_2.xml"></p>
        
        <p><b>Алгоритм: (R\' U\' R\' U\' R\') (U R U R U)</b></p>
        <p>Более подробно все сказанное выше рассмотрено в видео от Максима Чечнева чуть ниже.</p>
    """;
    static const begin_st5a_url = "v3J6-5_J29s";

    static const begin_st5b_title = "Этап 5б. Два нижних слоя (Желтый одуванчик)";
    static const begin_st5b_descr = """
        <p>Если на третьем этаже (крыше) все ребра с наклейками с цветом крыши, а два нижних слоя
        еще не собраны (например, как на этой картинке).</p>
        <p style="text-align:center"><img src="begin_5_3.xml"></p>
        <p>Это значит, вы попали в ситуацию "желтый одуванчик", и вот как она решается:<br/>
        надо "поднять" неверно стоящее на втором этаже ребро на третий этаж, не сбив остальные ребра
        стоящие на своих местах. И для этого необходимо поместить его спереди справа и выполнить
        "ромашку налево". После чего ребро окажется на третьем этаже, и что делать с ним в этом
        случаем, мы уже знаем.</p>

        <p>Более подробно все сказанное выше рассмотрено в видео от Максима Чечнева чуть ниже.</p>
    """;
    static const begin_st5b_url = "fad9teqrKVo";

    static const begin_st6_title = "Этап 6. Верхний крест (Оружие)";
    static const begin_st6_descr = """
        <p>И снова занимаемся ребрами, но уже ребрами цвета крыши. В итоге у нас должен будет
        получиться крест на верхней грани кубика. Но пока крест не собран. И чтобы было легче
        определить комбинацию которую нам придется решать, можно/нужно
        <a href="rg2://ytplay?time=10:38&link=8C0Dn2Y7jUY">закрыть углы пальцами.</a> Итак, на
        данном этапе мы видим только оружие: палку (три в ряд), бумеранг (три буквой Г)
        или пулю (все ребра не в цвет крыши). Как их решать: </p>

        - <a href="rg2://ytplay?time=8:05&link=8C0Dn2Y7jUY"><b>Палка.</b></a>
        <p style="text-align:center"><img src="begin_6_1.xml"></p>

        <p>Палку надо поставить так чтобы она нас не била (на 3 и 9 часов),
        <a href="rg2://ytplay?time=9:15&link=8C0Dn2Y7jUY">теперь</a> едем в
        Лондон, делаем пиф-паф, возвращаемся из Лондона.<br/>
        <b>Алгоритм: F (R U R\' U\') F\'</b></p>

        - <a href="rg2://ytplay?time=11:07&link=8C0Dn2Y7jUY"><b>Бумеранг.</b></a>
        <p style="text-align:center"><img src="begin_6_2.xml"></p>
        <p>Его надо поставить на 9 и 12 часов (налево и назад), т.к. бумеранг более
        совершенное оружие, чем палка, то выполнять его чуть сложнее. Едем в Лондон и делаем 2 (два)
        пиф-пафа, и возвращаемся из Лондона.<br/>
        <b>Алгоритм: F (R U R\' U\') (R U R\' U\') F\'</b></p>

        - <a href="rg2://ytplay?time=13:57&link=8C0Dn2Y7jUY"><b>Пуля.</b></a>
        <p style="text-align:center"><img src="begin_6_3.xml"></p>
        <p>Как ставить, абсолютно без разницы. Пуля еще более совершенное оружие, поэтому
        комбинация еще сложнее. Делаем <b>палку</b> (едем в Лондон, делаем пиф-паф, возвращаемся из
        Лондона), получаем из пули <b>бумеранг</b>, поворачиваем его как надо (на 9 и 12) и делаем
        <b>бумеранг</b> ( Едем в Лондон и делаем 2 пиф-пафа, и возвращаемся из Лондона).<br/>
        <b>Алгоритм: (F (R U R\' U\') F\') U2 (F (R U R\' U\') (R U R\' U\') F\')</b></p>

        <p>Более подробно все сказанное выше рассмотрено в видео от Максима Чечнева чуть ниже.</p>
    """;
    static const begin_st6_url = "8C0Dn2Y7jUY";

    static const begin_st7_title = "Этап 7. Красим крышу";
    static const begin_st7_descr = """
        <p>Переходим к самому сложному для понимания этапу сборки кубика.
        На этом этапе займемся углами, повернем их так, чтобы вся крыша была одного цвета (покрасим ее),
        т.е. верхняя сторона будет собрана, но не верхний слой. Если у вас этот этап не будет получаться,
        то посмотрите <a href="rg2://pager?phase=ROZOV&item=5">пятый этап моей методики</a> (от Антона),
        принцип там тот же самый, но на мой взгляд, более понятная и простая реализация.</p>

        <p>И для начала нужно правильно
        <a href="rg2://ytplay?time=2:16&link=u9vBRWSVBA8"><b>взять кубик.</b></a> На
        данном этапе нам придется наклонить наше здание крышей налево.</p>
        <p style="text-align:center"><img src="begin_7_1.xml""></p>

        <p><b>Запомните как вы сейчас держите кубик</b>,
        и ни в коем случае его нельзя перехватывать в течение всего седьмого этапа.
        Я не зря вначале сказал, что этот этап очень сложный. Дело в том, что на этом этапе
        необходимо будет крутить правую и верхнюю грани кубика, а смотреть на результат на
        левой грани, при этом не перехватывая кубик. Запомнили? Тогда идем дальше.</p>
        <p style="text-align:center"><img src="begin_7_2.xml"></p>

        <p>И смотрим на <a href="rg2://ytplay?time=4:24&link=u9vBRWSVBA8"><b>глаз</b></a>
        кубика (на наклейку левого верхнего заднего угла, находящуюся
        на левой грани), если <a href="rg2://ytplay?time=4:54&link=u9vBRWSVBA8"><b>глаз</b></a>
        не совпадает с цветом крыши, то надо его перекрасить. А
        перекрашивать будем нашими любимыми <b>пиф-паф</b>ами. Чтобы <b>глаз</b> стал цвета крыши, необходимо
        выполнить два или четыре пиф-пафа в зависимости от того, какой у нас угол, скромный
        (<a href="rg2://ytplay?time=6:29&link=u9vBRWSVBA8">смотрит от нас</a>)
        или с завышенной самооценкой
        (<a href="rg2://ytplay?time=6:19&link=u9vBRWSVBA8">смотрит вверх</a>).</p>

        <p>Т.е. <a href="rg2://ytplay?time=6:34&link=u9vBRWSVBA8">делаем пиф-пафы</a>
        до тех пор, пока глаз не <a href="rg2://ytplay?time=7:31&link=u9vBRWSVBA8">станет цвета крыши.</a>
        Не обращайте внимание на то,
        что кубик временно <a href="rg2://ytplay?time=7:19&link=u9vBRWSVBA8">\"разобрался\".</a>
        Главное, чтобы те два центра, которыми вы изначально взяли кубик сверху и к себе, оставались
        <a href="rg2://ytplay?time=7:26&link=u9vBRWSVBA8">на месте.</a></p>

        <p>Что делать <a href="rg2://ytplay?time=7:40&link=u9vBRWSVBA8">дальше?</a> А дальше,
        КРЕПКО держим кубик правой рукой и <a href="rg2://ytplay?time=7:44&link=u9vBRWSVBA8">крутим левую грань</a>
        (Чертово колесо) так, чтобы в глазу у кубика оказался элемент НЕ цвета крыши.</p>

        <p>Снова делаем два или четыре <a href="rg2://ytplay?time=8:24&link=u9vBRWSVBA8">пиф-пафа.</a>
        И если еще не вся крыша оказалась покрашена, то снова КРЕПКО держим кубик правой рукой и снова крутим левую грань
        (<a href="rg2://ytplay?time=8:58&link=u9vBRWSVBA8">Чертово колесо</a>) и делаем пиф-пафы.
        Повторяем так, до тех пор, пока не докрасим крышу.</p>

        <p>Если у вас не получилось покрасить крышу с первого раза, пожалуйста, не поленитесь
        пощелкать по ссылкам в тексте или посмотреть видео целиком, также можете посмотреть
        как выполняется разворот углов <a href="rg2://pager?phase=ROZOV&item=5">в моей методике,</a>
        на мой взгляд, там он выполняется понятнее.
        Или напишите мне
        <a href="mailto:rubicsguide@yandex.ru?subject=Не%20получается%207ой%20этап&body=Здравствуйте,%20Антон.">на почту,</a>
        что вам показалось непонятным. Постараюсь поправить.</p>

        <p>Очень важно понимать, что <a href="rg2://ytplay?time=12:57&link=u9vBRWSVBA8">общее количество пиф-пафов</a>
        на данном этапе должно быть равно
        6-ти или 12-ти, другого быть НЕ МОЖЕТ. Если вы покрасили крышу, но сделали при этом, например,
        только 8 пиф-пафов - значит какой-то из уголков <a href="rg2://ytplay?time=13:20&link=u9vBRWSVBA8">провёрнут на своем месте</a>
        и такой кубик собрать невозможно.</p>

        <p><b>Алгоритм пиф-пафа: (R U R\' U\')</b></p>

        <p><i>P.S. На данном этапе вам может попасться всего лишь 7 вариантов расположения угловых
        элементов. И для каждого из этих вариантов есть простой и быстрый алгоритм. Данные алгоритмы
        приведены в Ускорениях для начинающих и я рекомендую вам их выучить чуть позднее. А пока, лучше
        потренируйте пиф-пафы, они еще много где пригодятся.</i></p>
    """;
    static const begin_st7_url = "u9vBRWSVBA8";

    static const begin_st8_title = "Этап 8. Ставим ребра (Убийство в Лондоне)";
    static const begin_st8_descr = """
        <p>Теперь расставим на свои места ребра на верхней грани (сделаем верхний крест правильным).
        Для этого опять же надо повернуть крышу так, чтобы у нас было два дяди и две тети. Но на
        этом этапе один дядя, как обычно, идет налево, а вот другой от нас убегает, т.е. дядей надо
        поставить <a href="rg2://ytplay?time=3:28&link=oU5LJmWefDw">на 9 и 12 часов.</a></p>
        <p style="text-align:center"><img src="begin_8_1.xml"></p>
        <p>И теперь запоминаем следующую <a href="rg2://ytplay?time=4:27&link=oU5LJmWefDw">присказку:</a><br/><br/>
        8-ой этап, мы очень устали и хотим спать, поэтому <b>ВЫКЛЮЧАЕМ СВЕТ</b>, и наступает
        длинная-длинная ночь <b>(КРУТИМ КРЫШУ 2 РАЗА)</b>, наступает утро, и мы <b>ВКЛЮЧАЕМ СВЕТ</b>,
        наступает длинный-длинный день <b>(СНОВА КРУТИМ КРЫШУ 2 РАЗА)</b>, опять наступает вечер и
        мы ложимся спать <b>(ВЫКЛЮЧАЕМ СВЕТ)</b> и нам снится, что мы <b>ПОЕХАЛИ В ЛОНДОН</b>,
        там мы совершили убийство <b>(СДЕЛАЛИ ПИФ-ПАФ)</b>, и чтобы замести следы <b>ВЫКЛЮЧИЛИ
        СВЕТ</b>. После чего <b>ВЕРНУЛИСЬ ИЗ ЛОНДОНА</b> и <b>ВКЛЮЧИЛИ СВЕТ ВО ВСЕХ КОМНАТАХ</b>
        (включили 2 раза). Проснулись, и <b>КРЫША ВСТАЛА НА СВОЕ МЕСТО</b> (против часовой стрелки).
        Надеюсь понятно, что в присказке выделены действия, остальной текст для упрощения запоминания.</p>

        <p><b>Алгоритм: R\' U2 R U2 R\' F (R U R\' U\') R\' F\' R2 U\'</b></p>

        <p>Если вы попали в ситуацию, когда два дяди на данном этапе находятся друг напротив друга,
        то данный алгоритм надо будет выполнить два раза. Первый без разницы из какого положения,
        а вот перед вторым выполнением уже надо будет расположить дядей на 9 и 12 часов.<br/><br/>

        P.S. А вот так этот алгоритм можно <a href="rg2://ytplay?time=5:39&link=AB940Ieyt58">выполнять быстро.</a>
        </p>
    """;
    static const begin_st8_url = "oU5LJmWefDw";

    static const begin_st9_title = "Этап 9. Треугольники (Инфаркт)";
    static const begin_st9_descr = """
        <p>Ну и на последнем этапе мы ставим на место углы верхней грани (крыши). Для начала,
        возьмем кубик как на седьмом этапе, т.е. <a href="rg2://ytplay?time=1:23&link=dGh_gjwsfe0">крышей налево,</a>
        т.к. так же как и на седьмом этапе
        мы работаем с углами. На данном этапе в большинстве случаев у нас будет получаться
        ситуация, когда только один из углов стоит на своем месте. Нужно повернуть кубик так, чтобы
        данный "собранный" угол <a href="rg2://ytplay?time=2:58&link=dGh_gjwsfe0">оказался внизу,</a>
        сзади, слева, при этом крыша тоже осталась слева.</p>

        <p style="text-align:center"><img src="begin_9_1.xml"></p>

        <p>И теперь запоминаем/выполняем <a href="rg2://ytplay?time=3:56&link=dGh_gjwsfe0">новую историю:</a><br/>
        Последний этап, мы не то чтобы устали, у нас случился сердечный приступ. И нам делают
        \"разряд\"  <b>(КРУТИМ КРЫШУ 2 РАЗА)</b>, и <b>СВЕТ</b> у нас перед глазами <b>ВКЛЮЧАЕТСЯ</b>,
        но нам зачем-то снова делают \"разряд\" <b>(КРЫША 2 РАЗА)</b> и <b>СВЕТ</b> перед глазами
        <b>ВЫКЛЮЧАЕТСЯ</b>, поэтому нас отправляют <b>на 2 ГОДА В ЛОНДОН</b> на лечение. В Лондоне
        нам сразу делают \"разряд\" <b>(КРЫША 2 РАЗА)</b> и свет перед нами опять включается, но
        поскольку мы в Лондоне, то и <b>СВЕТ ВКЛЮЧАЕТСЯ СЛЕВА</b>, нам опять делают \"разряд\"
        <b>(КРЫША 2 РАЗА)</b> и Лондонский <b>СВЕТ СЛЕВА ВЫКЛЮЧАЕТСЯ</b>. Возвращаемся из
        <b>ДОЛГОЙ поездки В ЛОНДОН</b> (переднюю грань крутим 2 раза).</p>

        <p><b>Алгоритм: (U2 R U2 R\') F2 (U2 L\' U2 L) F2</b></p>

        <p>Пожалуйста, обратите внимание, что включение света слева это именно ход L\', а не L.
        Почему так - смотрите в \"Азбуке вращений\". Чтобы увидеть краткую азбуку вращений для данной
        головоломки, нажмите на знак вопроса в правом верхнем углу этого окна.</p>

        <p>Если кубик не собрался с <a href="rg2://ytplay?time=5:11&link=dGh_gjwsfe0">первого раза,</a>
        значит соберется со второго, нужно просто повторить данный алгоритм.</p>

        <p>Теперь о ситуации, когда <a href="rg2://ytplay?time=6:52=&link=dGh_gjwsfe0">все 4 угла</a>
        оказались не на своем месте: опять же делаем данный
        алгоритм не смотря на то, что в дальнем нижнем заднем углу у нас несобранный угол. После
        выполнения алгоритма, один из углов обязательно встанет на свое место. А что делать в такой
        ситуации мы уже знаем.</p>

        <p><i>P.S. Заметьте, что двойные кручения можно крутить как по часовой, так и против часовой
        стрелки. Поэтому, что ехать на 2 года В ЛОНДОН, что ИЗ ЛОНДОНА не имеет значения. И в какую
        сторону крутить крышу при "разряде" тоже.</i></p>

        <p><i>P.P.S. Для данной ситуации существует несколько вариантов алгоритмов, которые проще для исполнения,
        но немного сложнее для запоминания и найти их можно в
        <a href="rg2://ytplay?time=0:00&link=B_Fkals9Svk">Ускорениях для Начинающих N20</a>
        а также
        <a href="rg2://ytplay?time=0:00&link=L_r41Y1MuAY">PLL Треугольники.</a></i></p>
    """;
    static const begin_st9_url = "dGh_gjwsfe0";

}
