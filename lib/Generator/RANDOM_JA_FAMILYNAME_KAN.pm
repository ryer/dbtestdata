package Generator;

use warnings;
use strict;
use utf8;

my @items = (
    '佐藤', '鈴木', '高橋', '田中', '渡辺', '伊藤', '山本', '中村', '小林', '斎藤', '加藤', '吉田', '山田',
    '佐々木', '山口', '松本', '井上', '木村', '林', '清水', '山崎', '中島', '池田', '阿部', '橋本', '山下',
    '森', '石川', '前田', '小川', '藤田', '岡田', '後藤', '長谷川', '石井', '村上', '近藤', '坂本', '遠藤',
    '青木', '藤井', '西村', '福田', '太田', '三浦', '藤原', '岡本', '松田', '中川', '中野', '原田', '小野',
    '田村', '竹内', '金子', '和田', '中山', '石田', '上田', '森田', '小島', '柴田', '原', '宮崎', '酒井',
    '工藤', '横山', '宮本', '内田', '高木', '安藤', '島田', '谷口', '大野', '高田', '丸山', '今井', '河野',
    '藤本', '村田', '武田', '上野', '杉山', '増田', '小山', '大塚', '平野', '菅原', '久保', '松井', '千葉',
    '岩崎', '桜井', '木下', '野口', '松尾', '菊地', '野村', '新井', '渡部'
);
sub JA_FAMILYNAME_KAN_ITEMS {
    return @items;
}
push(@Generator::EXPORT, qw(JA_FAMILYNAME_KAN_ITEMS));

##
# Type: Generator
# Synopsis: Family name (Kanji) in japanese.
#
# RANDOM_JA_FAMILYNAME_KAN()
#   => '山田'
##
sub RANDOM_JA_FAMILYNAME_KAN {
    return {
        "type" => 'RANDOM_JA_FAMILYNAME_KAN',
        "gen"  => RANDOM_CHOICE(@items)->{'gen'}
    };
}

1;
