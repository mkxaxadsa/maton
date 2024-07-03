import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WorldNews {
  final String image;
  final String title;
  final String content;
  final String ago;

  WorldNews({
    required this.image,
    required this.title,
    required this.content,
    required this.ago,
  });
}

class ForView extends StatelessWidget {
  final String settings;

  const ForView({Key? key, required this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 17, 12),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(settings)),
      ),
    );
  }
}

List<WorldNews> worldNews = [
  WorldNews(
    image:
        'https://image.cnbcfm.com/api/v1/image/107350350-1703123113518-gettyimages-1858399319-AFP_34884Y3.jpeg',
    title:
        'Bank of Japan is expected to trim bond buying by \$100 billion in first year, Reuters survey shows',
    content:
        'Japan bond market participants expect the central bank to trim bond purchases by roughly \$100 billion in the first year under a quantitative tightening (QT) plan set for release this month, according to a survey conducted by Reuters.\n\nA Reuters survey of 19 banks, brokerages, insurers and asset managers showed they expect the Bank of Japan to trim bond buying by an average 16.1 trillion yen (\$99.7 billion) in the first year.\n\nThat would translate into monthly purchases of 4.65 trillion yen, down from the current pace of around 6 trillion yen. In the second year, the respondents expect the purchase amount to fall to an average 3.55 trillion yen, the survey showed.\n\nCombined, it would amount to a reduction of roughly 45 trillion yen during the two-year period',
    ago: '8h ago',
  ),
  WorldNews(
    image:
        'https://image.cnbcfm.com/api/v1/image/107432293-1719240576296-gettyimages-2153753009-AA_24052024_1694110.jpeg',
    title:
        'Collapsed bitcoin exchange Mt. Gox is about to unload \$9 billion of coins onto the market. Here\'s what it means',
    content:
        'A bitcoin exchange that collapsed 10 years ago after being hacked is set to return billions of dollars worth of the token to users — and it has investors worried.\n\nIn a few days, bankrupt Tokyo-based bitcoin exchange Mt. Gox will begin paying back thousands of users almost \$9 billion worth of tokens. The platform went under in 2014 following a series of heists that cost it in the range of 650,000 to 950,000 bitcoins, or upward of \$59 billion, at current prices.',
    ago: '9h ago',
  ),
  WorldNews(
    image:
        'https://ichef.bbci.co.uk/news/1024/cpsprodpb/15ECD/production/_127150898_mediaitem127150897.jpg.webp',
    title:
        'Gas and electricity prices fell by 7% in England, Scotland and Wales on 1 July.',
    content:
        'Under the new energy price cap, the typical annual dual-fuel bill paid by direct debit is now £1,568 per year.\n\nHowever, while bills are at their lowest for two years, they remain about £400 higher than they were three years ago.',
    ago: '10h ago',
  ),
  WorldNews(
    image:
        'https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-2156454374.jpg',
    title: 'French election results boost stocks and the euro',
    content:
        'French stocks and the euro rallied Monday after results from the first round of elections suggested the far right will inflict a heavy defeat on President Emmanuel Macron but fall short of winning an outright majority in parliament.\n\nFrance\'s CAC 40 index, which represents 40 of the biggest companies listed in Paris, rose 2.7% at the open. The index closed 1% higher on the day but is still almost 6% below its level before Macron called the snap election on June 9.',
    ago: '12h ago',
  ),
  WorldNews(
    image:
        'https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-1735541439-20240318145303576.jpg',
    title: 'The average Wall Street bonus dipped 2% last year, to \$176,500',
    content:
        'Last year wasn\'t the most lucrative for Wall Street bankers, but their bonus payouts still easily trounced US median household income.\n\nThe average Wall Street bonus for 2023 was \$176,500, according to estimates that will be released Tuesday morning by New York State Comptroller Thomas DiNapoli. That\'s down 2% from the \$180,000 recorded in 2022. Both those averages were well below the \$240,000 paid out in 2021.',
    ago: '14h ago',
  ),
  WorldNews(
    image:
        'https://crypto.news/app/uploads/2023/07/MarketAcross-and-Chainlink-Labs-Establish-Channel-Partnership-To-Support-Chainlink-BUILD-Members04.jpg.webp',
    title: 'Chainlink climbs as Hedera tops developer activity leaderboard',
    content:
        'Chainlink saw a considerable spike in developer activity in June as the decentralized oracle network climbed into second spot behind Hedera, according to data by market intelligence platform Santiment.\n\nAccording to Santiment analysis, Hedera remained crypto\'s top coins in terms of GitHub activity. However, Chainlink developer data from its GitHub repository showed a surge in the number of events in the past 30 days, with the project rising to 2nd.',
    ago: '15h ago',
  ),
  WorldNews(
    image:
        'https://crypto.news/app/uploads/2024/03/crypto-news-USDC-option03.webp',
    title: 'Circle wins Europe\'s first stablecoin license via MiCA',
    content:
        'Circle has authorization to market its USDC stablecoin services across Europe under the bloc\'s MiCA laws.\n\nStablecoin issuer Circle is the first stablecoin company to achieve compliance with the European Union\'s (EU) Markets in Crypto Asset (MiCA) policies designed to oversee digital asset business operations.\n\nHaving obtained an Electronic Money Institution (EMI) license from French regulators, CEO Jeremy Allaire said Circle Mint France will manage EURC and USDC issuance for European users. ',
    ago: '17h ago',
  ),
  WorldNews(
    image:
        'https://crypto.news/app/uploads/2023/11/crypto-news-io.net-Partner-With-Render-Network06.webp',
    title: 'Injective price to reach \$100 and Render to hit \$150: analyst',
    content:
        'Injective (INJ) and Render Token (RNDR) prices have remained in a bear market since March and prior attempts to bounce faced strong resistance. Render was trading at \$7.5605 on Monday, down by over 44% from its highest level this year, giving it a market cap of over \$2.9 billion.\n\nInjective, the venture-backed blockchain that made waves in 2023, has crashed by over 56% from the year-to-date high. This drop has brought its market cap from over \$4.86 billion in March to \$2.14 billion. ',
    ago: '18h ago',
  ),
  WorldNews(
    image:
        'https://crypto.news/app/uploads/2024/04/crypto-news-Kanga-Moon-option03.webp',
    title:
        'Bullish July predicted for ETH; these ERC-20 memecoins set to skyrocket',
    content:
        'Popular analyst Captain Faibik forecasts a bullish July for Ethereum, with ERC-20 meme coins including KangaMoon expected to surge significantly.\n\nIn an earlier X post by Captain Faibik, the popular crypto analyst hinted at an extremely bullish July for Ethereum (ETH) coin. As expected, Ethereum is positioned for more bulls due to its long consolidation and its upcoming rally together with Bitcoin.',
    ago: '18h ago',
  ),
  WorldNews(
    image:
        'https://crypto.news/app/uploads/2024/06/crypto-news-Mt-Gox-announced-the-start-of-payments-option01-1380x820.webp',
    title:
        'PayPal-backed fintech startup Mesh teams up with Italy\ns crypto wallet Conio',
    content:
        'Backed by PayPal, fintech connection layer Mesh has unveiled a partnership with Italy\'s crypto wallet Conio.\n\nAmerican fintech startup Mesh has announced a partnership with Italian crypto wallet Conio, aiming to broaden its reach to multiple crypto trading platforms such as Coinbase and Binance. The collaboration will enable Conio’s 430,000 Italian customers to access 10 crypto exchanges and withdraw funds into their Conio wallets, the report says.',
    ago: '22h ago',
  ),
];
