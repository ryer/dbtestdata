package Generator;

use warnings;
use strict;
use utf8;

my @items = (
    '陸', '大翔', '大輝', '蓮', '翼', '悠斗', '翔太', '海斗', '空', '優太', '陽斗', '大樹', '大和', '拓海',
    '涼太', '颯', '颯太', '悠人', '一輝', '歩夢', '陽翔', '亮太', '翔大', '颯汰', '悠', '悠真', '悠翔', '遥斗',
    '陽向', '颯斗', '海翔', '輝', '虎太郎', '光', '光希', '匠', '琉生', '龍之介', '和真', '翔', '葵', '響',
    '健太', '樹', '太陽', '大輔', '暖', '優斗', '雄大', '陸斗', '涼', '怜', '怜央', '瑛太', '健太郎', '光輝',
    '巧', '航', '太一', '拓実', '琢磨', '天翔', '優人', '勇斗', '悠希', '陸翔', '颯人', '雅也', '健人', '晃大',
    '仁', '蒼空', '大河', '大雅', '大貴', '智也', '直哉', '哲平', '隼', '柊斗', '唯人', '悠太', '陽太', '翔也',
    '愛斗', '伊織', '伊吹', '啓斗', '健斗', '春輝', '駿太', '心', '奏', '蒼', '蒼真', '大智', '大夢', '拓斗',
    '達也', '宙', '柊', '優', '優希', '優輝', '勇輝', '陸人', '凌', '塁', '漣', '煌', '翔太郎', '颯大',
    '陽菜', '美羽', '美咲', 'さくら', '愛', '葵', '七海', '真央', '優衣', '愛美', '杏', '結菜', '優奈', '楓',
    '結愛', '美優', '彩花', '菜々美', '遥', '彩音', '心', '優菜', '和奏', 'こころ', 'ひなた', '花菜', '芽生',
    '菜々子', '心愛', '桃花', '美空', '凜', '杏奈', '花音', '心優', '美結', '優花', '優月', '栞奈', 'ひより',
    '愛莉', '芽依', '彩華', '若菜', '春菜', '桃香', '美月', '萌', '未来', '優', '遥菜', '和花', '莉央', '莉緒',
    'はるか', '亜美', '愛香', '愛菜', '愛奈', '杏菜', '琴音', '結衣', '彩', '彩乃', '菜月', '咲愛', '咲希',
    '日菜', '寧々', '美緒', '舞', '萌花', '陽香', 'あおい', '愛華', '愛梨', '愛理', '綾音', '綾乃', '夏希',
    '花', '琴美', '結', '結奈', '彩菜', '咲良', '詩乃', '朱里', '春香', '心音', '心結', '心菜', '真帆', '雪乃',
    '千尋', '奏', '奈々', '美桜', '美里', '百花', '優芽', '友菜', '遥香', '梨乃', '瑠奈', '和', '茉央', '莉子'
);
sub JA_FIRSTNAME_KAN_ITEMS {
    return @items;
}
push(@Generator::EXPORT, qw(JA_FIRSTNAME_KAN_ITEMS));

##
# Type: Generator
# Synopsis: First name (Kanji) in japanese.
#
# RANDOM_JA_FIRSTNAME_KAN()
#   => '太郎'
##
sub RANDOM_JA_FIRSTNAME_KAN {
    return {
        "type" => 'RANDOM_JA_FIRSTNAME_KAN',
        "gen"  => RANDOM_CHOICE(@items)->{'gen'}
    };
}

1;
