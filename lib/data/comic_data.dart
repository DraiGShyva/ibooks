import 'package:myapp/models/comic_model.dart';

class ComicData {
  static late List<ComicModel> comics;

  static void init() {
    comics = [
      ComicModel(
        id: 'doremon-truyen-ngan-24988',
        title: 'Doraemon (truyện ngắn)',
        author: 'Fujiko F. Fujio',
        category:
            'Hành động, Hài hước, Học đường, Kỳ ảo, Phiêu lưu, Shounen, Siêu nhiên, Truyện dài, Truyện tranh, Viễn tưởng, Đời thường',
        description:
            'Doraemon là một chú mèo máy đến từ tương lai, cậu được Sewashi, cháu trai 22 đời của Nobita gửi về để giúp đỡ ông Nobita tránh khỏi những rắc rối và khổ sở trong cuộc sống hàng ngày.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F30%2F30558%2Fmv5bmgizzmq4ymutzgq4nc00otkylwe1mgutmtq3n2y3n2e2nweyxkeyxkfqcgdeqxvyodaznzawotu._v1_fmjpg_ux1000_.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'one-piece-24458',
        title: 'One Piece',
        author: 'Eiichiro Oda',
        category: 'Action, Adventure, Comedy, Shounen, Drama, Fantasy',
        description:
            'One Piece là câu chuyện về Luffy và các thuyền viên của mình trên hành trình tìm kiếm kho báu One Piece, kho báu vĩ đại nhất thế giới.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F0%2F139%2F00.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'conan-16715',
        title: 'Thám tử lừng danh Conan',
        author: 'Aoyama Gosho',
        category: 'Adventure, Mystery, Shounen, Trinh Thám',
        description:
            'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên "Miền Nhiệt đới" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học. Theo lời khuyên của Tiến sĩ Hiroshi Agasa, Shinichi đã che giấu tung tích, để tránh việc hội Áo đen có thể phát hiện ra rằng cậu vẫn còn sống. Khi Ran hỏi tên cậu, Shinichi đã ghép "Conan" trong tên của Sir Arthur Conan Doyle và "Edogawa" trong tên của Edogawa Rampo, buột miệng nói ra tên mình là "Conan Edogawa"....',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F0%2F118%2F5aa9edad51fb8ca9b7bc2df7c37be433.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'dragon-ball-full-color-edition-15306',
        title: 'Dragon Ball',
        author: 'Akira Toriyama, Toyotarou',
        category: 'Adventure, Comedy, Martial Arts, Sci-fi, Shounen',
        description:
            'Dragon Ball là câu chuyện về Goku, một cậu bé có sức mạnh phi thường, cùng với những người bạn của mình trên hành trình tìm kiếm 7 viên ngọc rồng để thực hiện ước mơ của mình.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F25%2F25663%2Fdragon-ball-1-p000-akraa.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'naruto-mau-ban-dep-24880',
        title: 'Naruto',
        author: 'Masashi Kishimoto',
        category: 'Adventure, Shounen, Fantasy',
        description:
            'Naruto là một cậu bé mồ côi, sống ở làng Lá. Mục tiêu của Naruto là trở thành Hokage, người đứng đầu làng Lá, người mạnh nhất trong làng. Để thực hiện ước mơ của mình, Naruto đã phải trải qua nhiều khó khăn, thử thách và gặp nhiều người bạn đồng hành.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F33%2F33473%2Fcov.jpg&w=640&q=75',
      ),

      //lặp lại
      ComicModel(
        id: 'doremon-truyen-ngan-24988',
        title: 'Doraemon (truyện ngắn)',
        author: 'Fujiko F. Fujio',
        category:
            'Hành động, Hài hước, Học đường, Kỳ ảo, Phiêu lưu, Shounen, Siêu nhiên, Truyện dài, Truyện tranh, Viễn tưởng, Đời thường',
        description:
            'Doraemon là một chú mèo máy đến từ tương lai, cậu được Sewashi, cháu trai 22 đời của Nobita gửi về để giúp đỡ ông Nobita tránh khỏi những rắc rối và khổ sở trong cuộc sống hàng ngày.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F30%2F30558%2Fmv5bmgizzmq4ymutzgq4nc00otkylwe1mgutmtq3n2y3n2e2nweyxkeyxkfqcgdeqxvyodaznzawotu._v1_fmjpg_ux1000_.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'one-piece-24458',
        title: 'One Piece',
        author: 'Eiichiro Oda',
        category: 'Action, Adventure, Comedy, Shounen, Drama, Fantasy',
        description:
            'One Piece là câu chuyện về Luffy và các thuyền viên của mình trên hành trình tìm kiếm kho báu One Piece, kho báu vĩ đại nhất thế giới.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F0%2F139%2F00.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'conan-16715',
        title: 'Thám tử lừng danh Conan',
        author: 'Aoyama Gosho',
        category: 'Adventure, Mystery, Shounen, Trinh Thám',
        description:
            'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên "Miền Nhiệt đới" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học. Theo lời khuyên của Tiến sĩ Hiroshi Agasa, Shinichi đã che giấu tung tích, để tránh việc hội Áo đen có thể phát hiện ra rằng cậu vẫn còn sống. Khi Ran hỏi tên cậu, Shinichi đã ghép "Conan" trong tên của Sir Arthur Conan Doyle và "Edogawa" trong tên của Edogawa Rampo, buột miệng nói ra tên mình là "Conan Edogawa"....',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F0%2F118%2F5aa9edad51fb8ca9b7bc2df7c37be433.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'dragon-ball-full-color-edition-15306',
        title: 'Dragon Ball',
        author: 'Akira Toriyama, Toyotarou',
        category: 'Adventure, Comedy, Martial Arts, Sci-fi, Shounen',
        description:
            'Dragon Ball là câu chuyện về Goku, một cậu bé có sức mạnh phi thường, cùng với những người bạn của mình trên hành trình tìm kiếm 7 viên ngọc rồng để thực hiện ước mơ của mình.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F25%2F25663%2Fdragon-ball-1-p000-akraa.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'naruto-mau-ban-dep-24880',
        title: 'Naruto',
        author: 'Masashi Kishimoto',
        category: 'Adventure, Shounen, Fantasy',
        description:
            'Naruto là một cậu bé mồ côi, sống ở làng Lá. Mục tiêu của Naruto là trở thành Hokage, người đứng đầu làng Lá, người mạnh nhất trong làng. Để thực hiện ước mơ của mình, Naruto đã phải trải qua nhiều khó khăn, thử thách và gặp nhiều người bạn đồng hành.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F33%2F33473%2Fcov.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'doremon-truyen-ngan-24988',
        title: 'Doraemon (truyện ngắn)',
        author: 'Fujiko F. Fujio',
        category:
            'Hành động, Hài hước, Học đường, Kỳ ảo, Phiêu lưu, Shounen, Siêu nhiên, Truyện dài, Truyện tranh, Viễn tưởng, Đời thường',
        description:
            'Doraemon là một chú mèo máy đến từ tương lai, cậu được Sewashi, cháu trai 22 đời của Nobita gửi về để giúp đỡ ông Nobita tránh khỏi những rắc rối và khổ sở trong cuộc sống hàng ngày.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F30%2F30558%2Fmv5bmgizzmq4ymutzgq4nc00otkylwe1mgutmtq3n2y3n2e2nweyxkeyxkfqcgdeqxvyodaznzawotu._v1_fmjpg_ux1000_.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'one-piece-24458',
        title: 'One Piece',
        author: 'Eiichiro Oda',
        category: 'Action, Adventure, Comedy, Shounen, Drama, Fantasy',
        description:
            'One Piece là câu chuyện về Luffy và các thuyền viên của mình trên hành trình tìm kiếm kho báu One Piece, kho báu vĩ đại nhất thế giới.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F0%2F139%2F00.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'conan-16715',
        title: 'Thám tử lừng danh Conan',
        author: 'Aoyama Gosho',
        category: 'Adventure, Mystery, Shounen, Trinh Thám',
        description:
            'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên "Miền Nhiệt đới" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học. Theo lời khuyên của Tiến sĩ Hiroshi Agasa, Shinichi đã che giấu tung tích, để tránh việc hội Áo đen có thể phát hiện ra rằng cậu vẫn còn sống. Khi Ran hỏi tên cậu, Shinichi đã ghép "Conan" trong tên của Sir Arthur Conan Doyle và "Edogawa" trong tên của Edogawa Rampo, buột miệng nói ra tên mình là "Conan Edogawa"....',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F0%2F118%2F5aa9edad51fb8ca9b7bc2df7c37be433.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'dragon-ball-full-color-edition-15306',
        title: 'Dragon Ball',
        author: 'Akira Toriyama, Toyotarou',
        category: 'Adventure, Comedy, Martial Arts, Sci-fi, Shounen',
        description:
            'Dragon Ball là câu chuyện về Goku, một cậu bé có sức mạnh phi thường, cùng với những người bạn của mình trên hành trình tìm kiếm 7 viên ngọc rồng để thực hiện ước mơ của mình.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F25%2F25663%2Fdragon-ball-1-p000-akraa.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'naruto-mau-ban-dep-24880',
        title: 'Naruto',
        author: 'Masashi Kishimoto',
        category: 'Adventure, Shounen, Fantasy',
        description:
            'Naruto là một cậu bé mồ côi, sống ở làng Lá. Mục tiêu của Naruto là trở thành Hokage, người đứng đầu làng Lá, người mạnh nhất trong làng. Để thực hiện ước mơ của mình, Naruto đã phải trải qua nhiều khó khăn, thử thách và gặp nhiều người bạn đồng hành.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F33%2F33473%2Fcov.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'doremon-truyen-ngan-24988',
        title: 'Doraemon (truyện ngắn)',
        author: 'Fujiko F. Fujio',
        category:
            'Hành động, Hài hước, Học đường, Kỳ ảo, Phiêu lưu, Shounen, Siêu nhiên, Truyện dài, Truyện tranh, Viễn tưởng, Đời thường',
        description:
            'Doraemon là một chú mèo máy đến từ tương lai, cậu được Sewashi, cháu trai 22 đời của Nobita gửi về để giúp đỡ ông Nobita tránh khỏi những rắc rối và khổ sở trong cuộc sống hàng ngày.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F30%2F30558%2Fmv5bmgizzmq4ymutzgq4nc00otkylwe1mgutmtq3n2y3n2e2nweyxkeyxkfqcgdeqxvyodaznzawotu._v1_fmjpg_ux1000_.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'one-piece-24458',
        title: 'One Piece',
        author: 'Eiichiro Oda',
        category: 'Action, Adventure, Comedy, Shounen, Drama, Fantasy',
        description:
            'One Piece là câu chuyện về Luffy và các thuyền viên của mình trên hành trình tìm kiếm kho báu One Piece, kho báu vĩ đại nhất thế giới.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F0%2F139%2F00.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'conan-16715',
        title: 'Thám tử lừng danh Conan',
        author: 'Aoyama Gosho',
        category: 'Adventure, Mystery, Shounen, Trinh Thám',
        description:
            'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên "Miền Nhiệt đới" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học. Theo lời khuyên của Tiến sĩ Hiroshi Agasa, Shinichi đã che giấu tung tích, để tránh việc hội Áo đen có thể phát hiện ra rằng cậu vẫn còn sống. Khi Ran hỏi tên cậu, Shinichi đã ghép "Conan" trong tên của Sir Arthur Conan Doyle và "Edogawa" trong tên của Edogawa Rampo, buột miệng nói ra tên mình là "Conan Edogawa"....',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F0%2F118%2F5aa9edad51fb8ca9b7bc2df7c37be433.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'dragon-ball-full-color-edition-15306',
        title: 'Dragon Ball',
        author: 'Akira Toriyama, Toyotarou',
        category: 'Adventure, Comedy, Martial Arts, Sci-fi, Shounen',
        description:
            'Dragon Ball là câu chuyện về Goku, một cậu bé có sức mạnh phi thường, cùng với những người bạn của mình trên hành trình tìm kiếm 7 viên ngọc rồng để thực hiện ước mơ của mình.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F25%2F25663%2Fdragon-ball-1-p000-akraa.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'naruto-mau-ban-dep-24880',
        title: 'Naruto',
        author: 'Masashi Kishimoto',
        category: 'Adventure, Shounen, Fantasy',
        description:
            'Naruto là một cậu bé mồ côi, sống ở làng Lá. Mục tiêu của Naruto là trở thành Hokage, người đứng đầu làng Lá, người mạnh nhất trong làng. Để thực hiện ước mơ của mình, Naruto đã phải trải qua nhiều khó khăn, thử thách và gặp nhiều người bạn đồng hành.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F33%2F33473%2Fcov.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'doremon-truyen-ngan-24988',
        title: 'Doraemon (truyện ngắn)',
        author: 'Fujiko F. Fujio',
        category:
            'Hành động, Hài hước, Học đường, Kỳ ảo, Phiêu lưu, Shounen, Siêu nhiên, Truyện dài, Truyện tranh, Viễn tưởng, Đời thường',
        description:
            'Doraemon là một chú mèo máy đến từ tương lai, cậu được Sewashi, cháu trai 22 đời của Nobita gửi về để giúp đỡ ông Nobita tránh khỏi những rắc rối và khổ sở trong cuộc sống hàng ngày.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F30%2F30558%2Fmv5bmgizzmq4ymutzgq4nc00otkylwe1mgutmtq3n2y3n2e2nweyxkeyxkfqcgdeqxvyodaznzawotu._v1_fmjpg_ux1000_.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'one-piece-24458',
        title: 'One Piece',
        author: 'Eiichiro Oda',
        category: 'Action, Adventure, Comedy, Shounen, Drama, Fantasy',
        description:
            'One Piece là câu chuyện về Luffy và các thuyền viên của mình trên hành trình tìm kiếm kho báu One Piece, kho báu vĩ đại nhất thế giới.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F0%2F139%2F00.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'conan-16715',
        title: 'Thám tử lừng danh Conan',
        author: 'Aoyama Gosho',
        category: 'Adventure, Mystery, Shounen, Trinh Thám',
        description:
            'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên "Miền Nhiệt đới" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học. Theo lời khuyên của Tiến sĩ Hiroshi Agasa, Shinichi đã che giấu tung tích, để tránh việc hội Áo đen có thể phát hiện ra rằng cậu vẫn còn sống. Khi Ran hỏi tên cậu, Shinichi đã ghép "Conan" trong tên của Sir Arthur Conan Doyle và "Edogawa" trong tên của Edogawa Rampo, buột miệng nói ra tên mình là "Conan Edogawa"....',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F0%2F118%2F5aa9edad51fb8ca9b7bc2df7c37be433.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'dragon-ball-full-color-edition-15306',
        title: 'Dragon Ball',
        author: 'Akira Toriyama, Toyotarou',
        category: 'Adventure, Comedy, Martial Arts, Sci-fi, Shounen',
        description:
            'Dragon Ball là câu chuyện về Goku, một cậu bé có sức mạnh phi thường, cùng với những người bạn của mình trên hành trình tìm kiếm 7 viên ngọc rồng để thực hiện ước mơ của mình.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F25%2F25663%2Fdragon-ball-1-p000-akraa.jpg&w=640&q=75',
      ),
      ComicModel(
        id: 'naruto-mau-ban-dep-24880',
        title: 'Naruto',
        author: 'Masashi Kishimoto',
        category: 'Adventure, Shounen, Fantasy',
        description:
            'Naruto là một cậu bé mồ côi, sống ở làng Lá. Mục tiêu của Naruto là trở thành Hokage, người đứng đầu làng Lá, người mạnh nhất trong làng. Để thực hiện ước mơ của mình, Naruto đã phải trải qua nhiều khó khăn, thử thách và gặp nhiều người bạn đồng hành.',
        image:
            'https://blogtruyenmoi.vn/_next/image?url=https%3A%2F%2Fcdn.blogtruyenmoi.vn%2Fmanga%2F33%2F33473%2Fcov.jpg&w=640&q=75',
      ),
      //lặp lại
    ];
  }
}
