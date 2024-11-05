import 'package:myapp/models/comic_model.dart';

class ComicService {
  static Future<ListComic?> fetchComic() async {
    return ListComic.fromJson(_comicJson);
  }

  static final _comicJson = [
    {
      'id': 'tu-linh-su-thien-tai-cua-hoc-vien',
      'title': 'Tử Linh Sư Thiên Tài Của Học Viện',
      'img': 'assets/images/comics/1azGNQa9rl8Fv4AKPJSaYBCbYWqGjppvY.jpg',
      'category': ['Manhwa', 'Huyền Bí', 'Hành Động', 'Học Đường', 'Phiêu Lưu'],
      'description':
          'Sau “cuộc chiến kéo dài hàng thế kỷ” giữa phe chiêu hồn và linh mục, tài năng mạnh nhất có thể làm nghiêng cán cân quyền lực đã ra đời. Anh ấy có tiềm năng vượt xa những gì mọi người có thể tưởng tượng. Sau khi kế thừa quân đoàn xác sống của cha mình, anh đăng ký vào học viện chiêu hồn vĩ đại, “Kizen”, một trong hai thế lực lớn nhất lục địa. Là một thiên tài vượt trội ngay cả trong giới thượng lưu, sự xuất hiện của ông đã gây chấn động trong giới nghiên cứu. Các quan chức và người đứng đầu cơ quan trên khắp vương quốc đều háo hức tuyển dụng anh ta. "Giáo sư! Khi nào tôi có thể tạo Lich?” “Nghiêm túc mà nói, thật nực cười khi thấy bạn tài năng đến mức nào.” Một thiên tài trong số những thiên tài đã xuất hiện.'
    },
    {
      'id': 'thien-phong-phach-dao',
      'title': 'Thiên Phong Phách Đạo',
      'img': 'assets/images/comics/1M691ZGnchxIBgHh96W6-0kEhfFw9WOpz.jpg',
      'category': ['Hành Động', 'Võ Thuật', 'Phiêu Lưu', 'Manhwa'],
      'description': 'Updating'
    },
    {
      'id': 'chuyen-sinh-thanh-ac-nhan',
      'title': 'Chuyển Sinh Thành Ác Nhân',
      'img': 'assets/images/comics/1UdJ_L6xK9GjEGupe8g6bluF2A046itgw.jpg',
      'category': ['Manhwa', 'Hành Động'],
      'description':
          'Sau khi bị buộc tội giết đồng nghiệp, Cassian Lee đã tìm đến cái chết. Khoảnh khắc anh nghĩ rằng tất cả đã kết thúc, linh hồn của anh đột nhiên bị chiếm hữu bởi cơ thể của một tên nhóc và cuộc hành trình trở thành ác nhân của anh bắt đầu.'
    },
    {
      'id': 'toan-tri-doc-gia',
      'title': 'Toàn Tri Độc Giả',
      'img': 'assets/images/comics/1Xdf9aEjsHuIC02ed6O6q4W8pOf7JI0Dk.jpg',
      'category': [
        'Manhwa',
        'Hành Động',
        'Huyền Bí',
        'Truyện Màu',
        'Webtoons',
        'Siêu Nhiên'
      ],
      'description':
          'Điều gì sẽ xảy ra nếu một ngày bạn tới được thế giới của bộ truyện mà bạn yêu thích? khám phá Đại Hải Trình trong One Piece, đi tìm 7 viên ngọc rồng hay thậm chí là đi bắt Cửu Vĩ? Hãy cùng theo dõi anh chàng nhân viên văn phòng Dokja trong chuyến hành trình bí ẩn khi thế giới giả tưởng trong bộ tiểu thuyết ưa thích của anh ấy lại bất ngờ trở thành hiện thực đáng sợ!'
    },
    {
      'id': 'thien-qua-thu-kho-dai-cong-tu',
      'title': 'Thiên Qua Thư Khố Đại Công Tử',
      'img': 'assets/images/comics/1O65Qahot1bPvEYSzUmNM3zRKP98gNy7f.jpg',
      'category': ['Manhwa', 'Phiêu Lưu', 'Murim', 'Hành Động', 'Võ Thuật'],
      'description':
          "Một ngày nọ, linh hồn của Thủ lĩnh Liên minh Murim quyến rũ và uy nghiêm, Hu Gong, đột nhiên chiếm hữu cơ thể của một chàng trai trẻ.Chàng thanh niên đó tên là Beom Hang. Anh ta là chủ nhân trẻ tuổi của 'Thiên đại lục', một trong ba kho lưu trữ lớn của jianghu, nhưng lại là một cái cớ xin lỗi của một người.Để xác định lý do tại sao linh hồn của mình lại hoán đổi thân xác, Hu Gong bắt đầu huấn luyện cơ thể của Beom Hang. Khi chủ nhân trẻ tuổi bị chiếm hữu của Thiên Đại Lưu Trữ hoàn toàn khác với trước đây, nó bắt đầu thu hút sự chú ý của giang hồ…"
    },
    {
      'id': 'nguoi-choi-tro-lai-sau-10000-nam',
      'title': 'Người Chơi Trở Lại Sau 10000 Năm',
      'img': 'assets/images/comics/1p3_rIbn_bvWDEIYtyMuHgedzKwGj88d5.jpg',
      'category': ['Manhwa', 'Phiêu Lưu', 'Huyền Bí', 'Hành Động'],
      'description':
          'Một ngày nọ, lạc lõng, anh ta rơi vào địa ngục. Tất cả những gì anh ta có với anh ta là khát vọng sống và sức mạnh để sinh tồn. Từ địa ngục thứ 1000 đến địa ngục thứ 9000, anh ta đã nuốt chửng hàng chục và hàng trăm nghìn con quỷ, và thậm chí cả bảy thành trì quy hàng trước anh ta. “Tại sao bạn lại muốn quay trở lại? người đã có tất cả mọi thứ trong địa ngục này. "" Mọi thứ? cái mông của tôi. "Không có gì để ăn hoặc thưởng thức ở đây! Địa ngục không là gì ngoài vùng đất hoang vắng đầy những con quỷ khủng khiếp! “Tôi sẽ trở lại.“ Sau mười ngàn năm dài, cuối cùng anh ấy cũng trở lại Trái đất.'
    },
    {
      'id': 'hoi-uc-chien-than',
      'title': 'Hồi Ức Chiến Thần',
      'img': 'assets/images/comics/1wPOjVZ4DgybwkkVAuoc-2y6GzBD3P7EB.jpg',
      'category': ['Manhwa', 'Lịch Sử', 'Viễn Tưởng', 'Võ Thuật', 'Hành Động'],
      'description':
          'Chỉ thở thôi cũng chưa chắc sẽ đảm bảo được sự sống của mọi người! Là hậu duệ của vùng đất Cao Ly, Dan Sa Yu cực kì lên án thủ phủ vì người bạn cậu ta yêu quý nhất. Vì vậy, cậu ta đã thống trị mọi trận chiến! Không ai có thể ngăn cản cậu ta! Cùng với câu chuyện của quân đội Cheonpo cùng với võ công cao cường nhất vùng Cao Ly. Huyền thoại về quân đội Cheonpo sẽ luôn hiện hữu khi mà lịch sử của Chiến Vương được hé lộ!'
    },
    {
      'id': 'thuc-long-ma-phap-su',
      'title': 'Thực Long Ma Pháp Sư',
      'img': 'assets/images/comics/1rYDDLr0jwLM9iZTl7dp4WZR37EvbA4rv.jpg',
      'category': ['Phiêu Lưu', 'Manhwa', 'Siêu Nhiên', 'Hành Động'],
      'description':
          'Bạn sẽ là nền tảng của một thần thoại mới. Vì lợi ích của câu chuyện thần thoại đó, tôi sẽ cho bạn một cơ hội khác.] Người thừa kế cuối cùng của một gia tộc đóng góp sáng lập đã sa ngã và pháp sư hạng ba bị nguyền rủa, Russel Raymond. Anh ấy hy vọng sẽ vực dậy địa vị xã hội của gia đình mình, nhưng đã bị đuổi khỏi học viện. Tất cả những gì anh ta có thể làm là làm việc như một pháp sư hạng ba lính đánh thuê. Một ngày nọ, trên đường đi làm công việc tạm thời, chiếc nhẫn kỷ niệm của mẹ anh, "Trái tim rồng", phản ứng, và Russel được trao cho một cơ hội bất ngờ. Anh ấy “thụt lùi” trở lại những ngày còn ở học viện. [Bạn đã nhận được một viên đá mana (có thể tiêu hao) như một phần thưởng của nhiệm vụ.] Đó là cách Russel bắt đầu thăng hoa trong cuộc sống. Giống như một con rồng không bao giờ được dang rộng đôi cánh của mình. Anh vượt qua những con sóng mang tên định mệnh đã đè lên mình và bay vào thế giới tươi sáng mà trước đây anh bị cấm đoán.'
    },
    {
      'id': 'tro-thanh-hung-than-trong-tro-choi-thu-thanh',
      'title': 'Trở Thành Hung Thần Trong Trò Chơi Thủ Thành',
      'img': 'assets/images/comics/1DTzRCDISHWcG3ssqmB8liLYbSKb6OGu6.jpg',
      'category': ['Săn Bắn', 'Manhwa', 'Game', 'Huyền Bí', 'Phiêu Lưu'],
      'description':
          'Game nhập vai tấn công ngục tối và phòng thủ tháp,Tôi đã xem đoạn kết của trò chơi với một độ khó mà chưa ai giải quyết được.Nhưng khi tỉnh dậy, tôi đã ở trong trò chơi. Hơn hết, ở giai đoạn hướng dẫn mà tôi dường như không thể vượt qua.“Tôi sẽ hoàn thành trò chơi chết tiệt này bằng mọi giá…!”'
    },
    {
      'id': 'tuy-kiem-da-hanh',
      'title': 'Tuý Kiếm Dạ Hành',
      'img': 'assets/images/comics/1E-fdc9UXvfYmcboW8sbgm402BUd7u5oS.jpg',
      'category': ['Manhwa', 'Võ Thuật', 'Hành Động', 'Phiêu Lưu'],
      'description':
          'Chân Chiêu Hãn vỗn dĩ sinh ra là đứa trẻ mồ côi, được Huyền Nguyệt Kiếm Vũ Đoàn nuôi dưỡng và cùng trải qua thời niên thiếu cùng với những cô gái ấy. Nhưng một ngày nọ, Chiêu Hãn được Độc Ma trong Tứ Đại Ma đã bắt cóc và dạy dỗ nuôi lớn. Sau 10 năm dưới sự dạy bảo của Độc Ma và Y Tiên, Chiêu Hãn bắt đầu đi tìm tung tích của Huyền Nguyệt Kiếm Vũ Đoàn năm xưa, nhưng giờ đây Kiếm Vũ Đoàn đã bị huỷ nhiệt bởi Hắc Đạo! Có ân phải đền, có oắn ắt phải báo!! Hành trình b.á.o t.h.ù của Chân Chiêu Hãn bắt đầu từ đây!!'
    },
    {
      'id': 'tinh-tu-kiem-si',
      'title': 'Tinh Tú Kiếm Sĩ',
      'img': 'assets/images/comics/1eSGKIDQedVgST1P7ZS_WPXcRhZu9VSnQ.jpg',
      'category': ['Hành Động', 'Phiêu Lưu', 'Võ Thuật', 'Manhwa'],
      'description':
          'Vlad là một đứa trẻ lang thang trong khu ổ chuột và luôn ngưỡng mộ các hiệp sĩ. Sau sự cố bị sét đánh đen, anh bắt đầu nghe thấy một giọng nói. Một ngày nọ, một hiệp sĩ ánh trăng xanh xuất hiện, và cuộc sống trong hẻm của Vlad bị đảo lộn… Ngay cả một ngôi sao mờ mịt không tỏa sáng trên những đỉnh cao nhất của bầu trời đêm vẫn là một ngôi sao nếu nó muốn tỏa sáng.'
    },
    {
      'id': 'bach-luyen-thanh-than',
      'title': 'Bách Luyện Thành Thần',
      'img': 'assets/images/comics/1qV_7XLS6CPUQe0RYX1VDUbLzTZwdQokS.jpg',
      'category': ['Hành Động', 'Drama', 'Phiêu Lưu'],
      'description':
          'Lã Chính một nô lệ khiêm tốn được sinh ra như là con trai cả của một gia đình giàu có. Do gia đình sa sút, bị một thế lực hùng mạnh bắt cóc em gái, giờ đây anh chỉ có thể bị người khác giẫm lên. Tuy nhiên, ông trời không bao giờ phong tỏa mọi lối thoát. Một cuốn sách cổ của cha ông ta để lại tiết lộ một bí thuật thần thánh bí mật, mang lại cho người đọc sức mạnh to lớn! Nhưng điều gì ẩn sau sức mạnh này? Đây là một cuộc thi chống lại số phận.'
    },
    {
      'id': 'su-ki-kim-quang-tu',
      'title': 'Sử Kí Kim Quang Tử',
      'img': 'assets/images/comics/15kzBJRm9jjSS5SbEHdQRoTGi2zvX_bHL.jpg',
      'category': ['Võ Thuật', 'Manhwa', 'Huyền Bí', 'Shounen', 'Hành Động'],
      'description':
          'Cần bao nhiêu cú đá để đập nát trái tim của một gã khổng lồ? Mặc dù không phải là Đứa trẻ Ánh sáng Vàng thuần khiết, Loxy phải học cách truyền hơi ấm của mặt trời và lật đổ những tên khổng lồ cao chót vót đang cản đường cứu em gái cô. Với những gã khổng lồ khát máu trên con đường của cô và Thần của các vị thần tàn nhẫn, Odin, đang truy đuổi gắt gao, Loxy đẩy cơ thể của mình đến giới hạn của nó với hy vọng rằng cô có thể trở nên mạnh mẽ bằng một nửa người chị hiện đang rất cần sự giúp đỡ của cô.'
    },
    {
      'id': 'hay-hanh-dong-nhu-mot-boss-di-ngai-mr-devourer',
      'title': 'Hãy Hành Động Như Một Boss Đi Ngài Mr Devourer',
      'img': 'assets/images/comics/1Sedw-aohOhjb4XySdikvXIrE1qzM6tIG.jpg',
      'category': ['Siêu Nhiên', 'Phiêu Lưu', 'Manhwa'],
      'description':
          'Thời đại của những cuộc đột kích vào ngục tối cuối cùng đã đến. Bảy ngục tối tà ác— bảy ngục tối mạnh nhất được coi là không thể chinh phục được. Sâu bên trong ngục tối khét tiếng nhất, Primordial Core, có tên trùm khủng khiếp nhất mọi thời đại, “Kẻ ăn thịt”. “Việc tên trùm ngục tối ngủ gật cho đến khi con người ở ngay trước mặt hắn có hợp lý không?!?!” Bởi vì những cuộc viếng thăm liên tục của con người, những cánh cửa của Lõi Nguyên thủy không bao giờ cạn, và những lời cằn nhằn mà Devourer nghe thấy không bao giờ dừng lại…?! “Ha… tôi không muốn làm điều này.”'
    },
    {
      'id': 'toi-da-giet-tuyen-thu-hoc-vien',
      'title': 'Tôi Đã Giết Tuyển Thủ Học Viện',
      'img': 'assets/images/comics/1HnzGnv2JUCCPIQFXtYmvCEjsohgmRchg.jpg',
      'category': ['Manhwa', 'Hài Hước', 'Hành Động'],
      'description': 'Tôi đã giết người chơi.Hắn ta đúng là một tên khốn nạn…'
    },
    {
      'id': 'hoang-tu-ban-thuoc',
      'title': 'Hoàng Tử Bán Thuốc',
      'img': 'assets/images/comics/17Aou9c5pMxaTQKs74LtcubLNO4oND5Hf.jpg',
      'category': ['Huyền Bí', 'Manhwa'],
      'description': 'Updating'
    },
    {
      'id': 'ta-la-sat-than',
      'title': 'Ta Là Sát Thần',
      'img': 'assets/images/comics/1JPFpgYVMy-CMw9cWQciMgrnNSXuz5FRq.jpg',
      'category': ['Manhua', 'Hành Động', 'Phiêu Lưu'],
      'description':
          'Trần Trí Liễu, là một học bá hiện đại, thiên tài kiếm đạo, vì theo đuổi con gái không những bị sét đánh cuốn vào thế giới trong game mà còn không có cách nào thoát ra! Đành phải tiếp tục sống trong game, nhưng không ngờ vừa bắt đầu đã gặp con đại Boss! Người chơi Trần Trí Liễu chấp nhận chết và kết thúc game hay là đánh bại được con đại Boss nè?'
    },
    {
      'id': 'tieu-gia-chu-cua-tu-xuyen-duong-gia-tro-thanh-kiem-than',
      'title': 'Tiểu Gia Chủ của Tứ Xuyên Đường Gia trở thành Kiếm Thần',
      'img': 'assets/images/comics/1jJ9AZt_Wf-LmCFzFU1zGsZd91_9ovCYO.jpg',
      'category': ['Huyền Bí', 'Phiêu Lưu', 'Manhwa', 'Võ Thuật', 'Trùng Sinh'],
      'description':
          "Sacheondanga vốn là một gia tộc nổi tiếng về thuốc độc và trí nhớ nhưng hiện tại đã suy tàn. Sinh ra ở đó, Yeon Myeong đột nhiên trở nên điên cuồng với thanh kiếm và thức tỉnh về kiếp trước, nơi anh đạt đến cấp độ của một vị thần kiếm. 'Lần này tôi muốn sống một cuộc sống bình thường.'"
    },
    {
      'id': 'ta-la-ta-de',
      'title': 'Ta Là Tà Đế',
      'img': 'assets/images/comics/1yMbzPTDi4ZJOSAOzYnl52iA6usNjKe5M.jpg',
      'category': ['Siêu Nhiên', 'Trùng Sinh', 'Huyền Bí', 'Manhua'],
      'description':
          'thiếu niên Tà Thiên, vận mệnh nhiều thăng trầm, ngẫu nhiên đạt được truyền thừa, Chư Giới muốn trảm. Xông Cửu Châu, sát phá non sông! Chiến Thất Giới, Tà chữ che trời!Tiên đến, ta tru!Phật đến, ta đồ!Giết hết chín thành chín, lưu một đám, nhìn ta xé trời!'
    },
    {
      'id': 'ta-co-mot-son-trai',
      'title': 'Ta Có Một Sơn Trại',
      'img': 'assets/images/comics/1FyjkUhcnkcF4eLqkuzs_njd4Y1xQj3Dq.jpg',
      'category': ['Manhua', 'Viễn Tưởng', 'Hành Động'],
      'description':
          'Truyện tranh Ta Có Một Sơn Trại được cập nhật nhất và đầy đủ nhất tại goctruyentranh.Com. Hãy ghé thăm goctruyentranh.Com mỗi ngày để được đọc các chương mới nhất của Ta Có Một Sơn Trại.'
    },
    {
      'id': 'nguyen-lai-ta-la-tu-tien-dai-lao',
      'title': 'Nguyên Lai Ta Là Tu Tiên Đại Lão',
      'img': 'assets/images/comics/1MSuAPjWDpVMZ057vRjfJZMkDa3QO4dzq.jpg',
      'category': [
        'Phiêu Lưu',
        'Võ Thuật',
        'Hài Hước',
        'Manhua',
        'Trùng Sinh',
        'Hành Động'
      ],
      'description':
          'Từ một thế giới tu tiên đang trên đà xuống dốc , sự xuất hiện của hắn giống như thổi một làn sức sống mới ngăn chặn sự xuống dốc đó . Từ sau đại kiếp , Long môn , Địa Phủ , Thiên Cung bị phong bế đều bởi vì hắn mà lần lượt mở ra ... Truyện đi từ từ dần dần mang đậm phong cách hài hước , tuy cũng có sạn nhưng cũng không phải nhiều bởi mỗi thế giới là của một tác giả tạo nên cho nên chẳng có ai có thể định đúng sai , tác giả có khác gì thiên đạo , truyện này mang tính giải trí cực cao , đủ để các đạo hữu đọc tới xuyên đêm .'
    },
    {
      'id': 'thien-ma-phi-thang-truyen',
      'title': 'Thiên Ma Phi Thăng Truyện',
      'img': 'assets/images/comics/1mEnX98j2X_dBOYYiURbz1UqNbDk24moN.jpg',
      'category': ['Hành Động', 'Phiêu Lưu', 'Manhwa'],
      'description':
          "(천마육성)Một nhóm trinh sát đã được chỉ định đến khu vực của Mount Hua Sect bởi thủ lĩnh vĩ đại của họ, ‘The Mantis.’Nhân vật chính ‘Seol Hwi’ đối mặt với Đạo sư phái Hua ‘Goo JongMyung, 'và rơi vào tình trạng nguy hiểm chết người.Một cửa sổ trạng thái sau đó bật lên và khiến anh ta quay trở lại thời điểm trước khi anh ta nhận nhiệm vụ do thám.Khi anh ta nhận được cùng một nhiệm vụ trinh sát khiến anh ta chết, Seol Hui đấu tranh để thay đổi thực tế không thể tránh khỏi.Một cửa sổ trạng thái xuất hiện mọi khủng hoảng.Lựa chọn với tương lai không chắc chắn.Câu chuyện về Seol Hwi khi anh ấy cố gắng tìm ra quyết định tốt nhất trong thế giới của mình xen lẫn giữa sự sống và cái chết."
    },
    {
      'id': 'toi-lam-vuon-tai-the-gioi-tho-san',
      'title': 'Tôi Làm Vườn Tại Thế Giới Thợ Săn',
      'img': 'assets/images/comics/1uNVSNc7iOBpxCI7p5OLohliiEtXk3Ci_.jpg',
      'category': ['Manhwa', 'Phiêu Lưu', 'Hầm Ngục'],
      'description':
          "Jiha, thợ săn thuộc tầng lớp lao động yếu nhất, không có kỹ năng cũng như khả năng chiến đấu, kiếm sống bằng cách điều hành một cửa hàng trong khi giữ cấp bậc thợ săn thấp nhất.Nhưng một ngày nọ, cuộc sống thợ săn của anh thay đổi khi anh bước vào một khu vườn từ một chiều không gian khác thông qua giấc mơ của mình...<Bạn đã nhận được Cây thân thiện Lv.1> <Bạn đã nhận được Phước lành XXX Lv.1>'Mình đã đạt được kỹ năng chỉ bằng cách trồng một cành cây...?'Cuộc phiêu lưu độc đáo của anh với tư cách là người làm vườn duy nhất trong thế giới thợ săn bắt đầu."
    },
    {
      'id': 'nhung-nhan-vat-chinh-ma-chi-toi-biet',
      'title': 'Những Nhân Vật Chính Mà Chỉ Tôi Biết',
      'img': 'assets/images/comics/1J_PwWoayZ81gEnQjHTzVCey3TkGRF2AG.jpg',
      'category': ['Huyền Bí', 'Manhwa', 'Trùng Sinh', 'Phiêu Lưu'],
      'description':
          '“Nếu tôi được trao một cơ hội khác…” 10 năm sau ngày tận thế bắt đầu trên Trái đất, khi đối mặt với cái chết sắp xảy ra, Yoohyun tràn ngập hối hận. Đúng lúc đó, một luồng ánh sáng chói lóa chiếu thẳng vào anh. Khi mở mắt ra, anh được chào đón bởi một khung cảnh xa lạ… Anh không chỉ tái sinh thành một chủng tộc phi nhân loại tên là “Người kể chuyện”, mà anh còn du hành ngược thời gian 10 năm! “Giờ chuyện đã đến nước này rồi, lần này tôi sẽ sống cuộc sống tốt nhất của mình!” Không giống như kiếp trước, nơi anh chỉ tập trung vào sự sống còn, giờ đây anh quyết tâm sống một cuộc sống thành công. Trong cuộc sống mới mà anh có được, liệu Yoohyun có thực sự có thể trở thành nhân vật chính?'
    },
    {
      'id': 'nguoi-dan-ong-thuc-thu',
      'title': 'Người Đàn Ông Thực Thụ',
      'img': 'assets/images/comics/1-BjzutaN3j7BOCdQIjyuANVtULE_bUNA.jpg',
      'category': ['Khoa Học', 'Manhwa', 'Drama'],
      'description':
          'Một CEO giỏi nhất thế giới, Han Yoo Hyun. Anh ấy mất tất cả mọi thứ và quay trở lại thời gian ban đầu và sống lại cuộc đời mình! tự mình thay đổi tất cả.'
    },
    {
      'id': 'chieu-hon-su-sieu-pham',
      'title': 'Chiêu Hồn Sư Siêu Phàm',
      'img': 'assets/images/comics/1rfBEoZtLmd74o8tFdNZ-j-2l6WfBshfl.jpg',
      'category': ['Manhwa', 'Phiêu Lưu', 'Hành Động'],
      'description':
          "Tôi chưa bao giờ nghĩ mình có thể trở thành một thợ săn.Tôi chưa bao giờ nghĩ mình sẽ có cơ hội.Nhưng rồi...'Tháp thử thách' đã chọn tất cả các ứng cử viên phù hợp từ Trái đất. Vui lòng chọn độ khó của bạn. Phần thưởng bạn nhận được sẽ tỷ lệ thuận với độ khó bạn đã chọn. Tôi đã được trao một cơ hội ngay bây giờ."
    },
    {
      'id': 'su-tro-lai-cua-huyen-thoai',
      'title': 'Sự Trở Lại Của Huyền Thoại',
      'img': 'assets/images/comics/1MErSaIYxpvSJN154HYBNBU-1wYbTfZ4B.jpg',
      'category': ['Manhwa', 'Bi Kịch', 'Trùng Sinh'],
      'description':
          'Do tình huống giống như IMF thứ hai, công ty bảo mật mà Jang Taesan làm việc bị phá sản, và anh ta trở thành một người đàn ông thất nghiệp lang thang khắp Noryangjin-dong.Anh mất mạng khi cứu một học sinh tiểu học suýt bị ô tô đâm. Nhưng nhờ hành động tốt của mình, anh ấy đã quay ngược thời gian 14 năm và được chào đón với một cuộc sống mới.Tuy nhiên, niềm vui được hồi sinh thật ngắn ngủi. Ý nghĩ lại phải thi vào đại học khiến tôi choáng váng…Nhưng tôi nhớ tất cả các vấn đề CSAT mà tôi gặp phải khi nghiên cứu và biểu đồ thị trường chứng khoán mà tôi đã thấy khi làm môi giới chứng khoán… ?! Kiếp trước đã tàn, nhưng kiếp sau này sẽ công thành!'
    },
    {
      'id': 'ke-bat-bai',
      'title': 'Kẻ Bất Bại',
      'img': 'assets/images/comics/1kGh26l5cUysFad5s5ag9zM30OJbx0Qsq.jpg',
      'category': ['Võ Thuật', 'Hành Động', 'Lãng Mạn', 'Manhwa'],
      'description':
          'Im Hwa-pyung. Một người đàn ông muốn sống một cuộc sống bình thường giống như tên của mình. Mọi thứ anh ta làm đã bị phá hủy. [Tình yêu của bạn đã trở thành hận thù của tôi.] Tôi không nên chạm vào nó. Lẽ ra tôi nên để nó im lặng như thế. Không thể có bất kỳ kẻ thù nào, anh ta bắt đầu di chuyển.'
    },
    {
      'id': 'canh-sat-bao-thu',
      'title': 'Cảnh Sát Báo Thù',
      'img': 'assets/images/comics/1uWFLaqEna54MHAkb9X-kQs_q-tlxWuCk.jpg',
      'category': ['Phiêu Lưu', 'Hành Động', 'Bạo Lực', 'Manhwa'],
      'description':
          "Sau khi bị tổ chức mà anh ta làm việc phản bội và giết chết, sát thủ khét tiếng 'Bi-Gwang' tái sinh thành 'Kim Gyeongsoo', một sĩ quan cảnh sát. Anh thề sẽ trả thù 'Hwaguksa',tổ chức của những kẻ giết người đã phản bội anh."
    }
  ];
}
