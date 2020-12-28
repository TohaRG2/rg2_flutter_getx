
import 'package:rg2_flutter_getx/models/phases.dart';

class Gear implements Phase {
  @override
  int count = gear_title.length;

  @override
  String phase = "GEAR";

  @override
  List<String> titles() => gear_title;

  @override
  List<String> icons() => gear_icon;

  @override
  List<String> descriptions() => gear_descr;

  @override
  List<String> urls() => gear_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const gear_title = [
        gear1_title,
        gear2_title,
    ];

    static const gear_icon = [
        "gear_1",
        "gear_2",
    ];

    static const gear_descr = [
        gear1_descr,
        gear2_descr,
    ];


    static const gear_url = [
        gear1_url,
        gear2_url,
    ];

    static const gear1_title = "Расстановка углов";
    static const gear1_descr = """
   <p><a href="rg2://ytplay?time=0:29&link=WqdWYE9thBA">GearCube</a> выглядит довольно устрашающе и
   автор головоломки сначала назвал его \"опасный куб\". Видимо потому, что шестеренки в этой головоломке
   могут придавить пальцы, а это если не больно то, как минимум, неприятно. Но потом его решили назвать
   в соответствие с его внешним видом. Gear в переводе с английского означает механизм или зубчатая
   передача. Внешне головоломка очень похожа на обычный кубик 3х3, но эта головоломка гораздо проще
   кубика и является, пожалуй, самой простой шарнирной головоломкой. На мой взгляд проще даже, чем
   RediCube. А все <a href="rg2://ytplay?time=1:11&link=WqdWYE9thBA">дело в том,</a> что вращения
   боковых граней могут быть выполнены только на 180 градусов и при этом средняя грань повернется на
   90 градусов. Не буду подробно останавливаться на том, где у нее центры, ребра и углы – это очевидно,
   все абсолютно аналогично обычному кубику. Перейдем сразу к сборке.</p>

    <p>Последовательность сборки этой головомки отличается от обычного кубика 3х3.
    <a href="rg2://ytplay?time=2:12&link=WqdWYE9thBA">Сначала займемся</a> углами и центрами. А на
    ребра пока не обращаем никакого внимания ни на их цвет, ни на расположение.</p>
    <p style="text-align:center"><img src="gear_1_1.xml" width="100"></p>

    <p>Первое, что нам нужно сделать, это поставить на одну сторону
    <a href="rg2://ytplay?time=2:36&link=WqdWYE9thBA">четыре одинаковых угла,</a> например, белых
    (поскольку положение ребер нас пока не интересует, то для иллюстраций к данному этапу будем считать,
    что головоломка имеет форму куба).</p>
    <p style="text-align:center"><img src="gear_1_2.xml" width="100"></p>

    <p>В этой головоломке это легко можно сделать из любого положения не более чем за
    <a href="rg2://ytplay?time=2:56&link=WqdWYE9thBA">четыре интуитивных хода.</a></p>

    <p>После того, как вы поставили четыре одинаковых угла
    <a href="rg2://ytplay?time=3:46&link=WqdWYE9thBA">на одну сторону,</a> смотрим на боковые наклейки
    этих углов. Тут, в отличие от кубика 3х3, может быть не три, а только две ситуации. Первая, это
    когда со всех сторон глазки, значит все хорошо и мы переходим к установке верхнего центра, а
    вторая, когда <a href="rg2://ytplay?time=4:11&link=WqdWYE9thBA">глазок нет ни с одной стороны.</a></p>
    <p style="text-align:center"><img src="gear_1_3.xml" width="100"></p>

    <p>В этом случае делаем очень простой и интуитивный
    <a href="rg2://ytplay?time=4:18&link=WqdWYE9thBA">алгоритм</a> <b>R2 F2 R2</b> и получаем глазки
    со всех сторон.</p>
    <p style="text-align:center"><img src="gear_1_4.xml" width="100"></p>

    <p><a href="rg2://ytplay?time=4:42&link=WqdWYE9thBA">Установка верхнего центра:</a><br/>
    Нужно сделать так, чтобы верхний центр совпал по цвету с верхними уголками. Тут опять же может
    быть только два варианта: или все хорошо и он уже такого же цвета, или он противоположного цвета.
    В этом случае, просто крутим правую грань на 360 градусов (делаем полный оборот) и центр станет
    нужного нам цвета.</p>
    <p style="text-align:center"><img src="gear_1_5.xml" width="100"></p>

    <p>Далее нужно покрутить нижнюю грань так, чтобы глазки снизу, а они там точно будут,
    <a href="rg2://ytplay?time=5:43&link=WqdWYE9thBA">совпали по цвету с верхними глазками.</a></p>
    <p style="text-align:center"><img src="gear_1_6.xml" width="100"></p>

    <p>Более того, покрутить так, чтобы совпали не только нижние глазки,
    <a href="rg2://ytplay?time=6:00&link=WqdWYE9thBA">но и центры.</a> Возможно, придется сделать не
    один полный оборот нижней грани.</p>
    <p style="text-align:center"><img src="gear_1_7.xml" width="100"></p>

    <p>В итоге должно получится что-то <a href="rg2://ytplay?time=6:23&link=WqdWYE9thBA">типа этого.</a></p>
    """;
    static const gear1_url = "WqdWYE9thBA";


    static const gear2_title = "Расстановка и разворот ребер";
    static const gear2_descr = """
    <p>Все углы и центры стоят на своих местах, поэтому перейдем к
    <a href="rg2://ytplay?time=6:23&link=WqdWYE9thBA">расстановке и развороту ребер.</a></p>
    <p>Можно сначала расставить все ребра на свои места, а потом их развернуть так, чтобы головоломка
    приобрела форму куба. А можно и наоборот, сначала развернуть все ребра, а потом расставить их на
    свои места. Первый вариант может оказаться чуть быстрее, но на мой взгляд, для того чтобы лучше
    понять головоломку, лучше все-таки сначала привести её к кубу, и только потом расставить ребра
    на свои места.</p>

    <p><a href="rg2://ytplay?time=7:05&link=WqdWYE9thBA">Разворот ребер.</a> Тут все очень и очень
    просто, если вы видите два каких-то ребра, которые развернуты неправильно, то просто возьмите
    кубик так, чтобы эти ребра находились на слое M, сделайте
    <a href="rg2://ytplay?time=7:22&link=WqdWYE9thBA"><b>два полных оборота (R4)2</b></a> или четыре
    полуоборота <b>(R2)4</b> правой грани, если ребра не встали как надо, то
    <a href="rg2://ytplay?time=7:56&link=WqdWYE9thBA">еще два полных оборота.</a> <i>Именно по два
    полных оборота, а не по одному, т.к. если обороты делать по одному, то может получиться ситуация,
    когда вроде бы и все ребра стоят правильно, но центры при этом оказываются не на своих местах.</i></p>
    <p style="text-align:center"><img src="gear_2_1.xml" width="210"></p>

    <p>Повторите эти действия для остальных неправильно повернутых ребер. Еще раз проверьте, все ли
    центры остались на своих местах и дружат ли они со своими уголками.</p>

    <p><a href="rg2://ytplay?time=8:27&link=WqdWYE9thBA">Вот теперь,</a> когда у нас все углы и все
    центры стоят на своих местах, а ребра ориентированы как надо, мы будем расставлять ребра на свои
    места. И для этого будем использовать вот такой, очень простой и интуитивный алгоритм, который
    разворачивает пару на верхнем слое.</p>
    <p style="text-align:center"><img src="gear_2_2.xml" width="100"></p>

    <p>Сначала вращаем правую грань на полный оборот по часовой стрелке, потом верхнюю грань на пол
    оборота и возвращаем все на свои места.</p>
    <p><a href="rg2://ytplay?time=9:01&link=WqdWYE9thBA&alg=R4_U2_R4’_U2’">Алгоритм:</a> <b>R4 U2 R4’ U2’</b></p>

    <p><b>Важно!!!</b> Есть две разновидности этой головоломки, которые выглядят одинаково, но внутри
    немного отличаются. Если данный алгоритм у вас не переворачивает пару, то значит у вас вариант
    головоломки отличный от используемой в видео. В этом случае выполните вот такой алгоритм:<br>
    <b>R2 U2 R2 U2 R2 U2</b></p>

    <p>Теперь ищем какую-нибудь <a href="rg2://ytplay?time=9:51&link=WqdWYE9thBA">собранную сторону</a>
    (не слой). Чаще всего такая сторона есть, если же ее нет, то выполняем алгоритм этого этапа
    <b>(R4 U2 R4’ U2’)</b> или <b>R2 U2 R2 U2 R2 U2</b> в зависимости от вашей головоломки, из
    любого положения и получаем какую-то собранную сторону (не обязательно
    белую). Если такая сторона у вас <a href="rg2://ytplay?time=9:51&link=WqdWYE9thBA">НЕ получилась</a>,
    значит нужно просто покрутить верхнюю или нижнюю грань так, чтобы центры среднего слоя встали на
    свои места и тогда такая сторона появится на одной из боковых граней. После чего берем кубик этой
    собранной стороной вверх.</p>
    <p style="text-align:center"><img src="gear_2_3.xml" width="100"></p>

    <p><i>Надо заметить, что если собранная сторона у вас <b>получилась сверху</b> из ситуации, когда
    ее не было, то центры среднего слоя (второго этажа) окажутся не на своих местах. В этом случае,
    можно их расставить по своим местам, а можно пока не обращать на это внимание. Главное, что есть
    собранная сторона.</i></p>

    <p>Если верхняя сторона собрана, а верхний (третий этаж) нет, то находим на этой собранной стороне
    пару ребер, которую нужно развернуть. Берем головоломку так, чтобы эта пара находилась на слое М
    на верхней грани и делаем наш алгоритм <b>R4 U2 R4’ U2’</b>. Теперь наша задача собрать
    <a href="rg2://ytplay?time=10:56&link=WqdWYE9thBA">полностью один слой,</a> т.е. одну сторону так,
    чтобы все ее элементы находились на своих местах. Выполнив это условие, вы автоматически соберете
    и противоположную сторону, и более того, все остальные стороны.</p>

    <p>Если верхний слой собран, нижний собран, <a href="rg2://ytplay?time=10:27&link=WqdWYE9thBA">а средний нет,</a></p>
    <p style="text-align:center"><img src="gear_2_4.xml" width="100"></p>

    <p>значит надо просто покрутить нижний или верхний слой так, чтобы все элементы встали на свои места.</p>
    """;
    static const gear2_url = "WqdWYE9thBA";

}
