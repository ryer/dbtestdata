# GENERATOR FUNCTIONS

## Formatter

#### CONCAT

Join text.

| Example | Returns |
| ------- | ------- |
| `CONCAT(RANDOM_LITERAL('Sunny', 'Moon'), '/', RANDOM_INT(100))` | `'Moon/13'` |

#### FOLD

Add new line.

| Example | Returns |
| ------- | ------- |
| `FOLD(15, RANDOM_ALPHA(100))` | `"DkMbHuBVHUHbfuq\nPDxBNFjhFFbGhjs\nCfyhGNUbD ...'` |

#### SPRINTF

Like sprintf.

| Example | Returns |
| ------- | ------- |
| `SPRINTF("%8s/%0.2f", RANDOM_ALPHA(8, 2), RANDOM_DOUBLE(99))` | `'  uXkass/27.28'` |

## Generator

#### COUNTER

Magical increment.

| Example | Returns |
| ------- | ------- |
| `COUNTER()` | `'1' => '1' => '2' ...` |
| `COUNTER(0)` | `'0' => '1' => '2' ...` |
| `COUNTER('AA')` | `'AA' => 'AB' => 'AC' ...` |

#### PERL

The perl code.

| Example | Returns |
| ------- | ------- |
| `PERL(sub{ rand(99999) });` | `'89827'` |

#### RANDOM_ALPHA

Alphabet.

| Example | Returns |
| ------- | ------- |
| `RANDOM_ALPHA(20)` | `'CAHJkiJGUIuuZaqoUjtg' (length == 20)` |
| `RANDOM_ALPHA(100, 40)` | `'aSoigqTuqWeikdqoUYIQ ... jJHCAHJkiJGUIukygfuE' (length == 40 .. 100)` |

#### RANDOM_CHOICE

Selection.

| Example | Returns |
| ------- | ------- |
| `RANDOM_CHOICE('Male', 'Female', 'Other')` | `'Female'` |
| `RANDOM_CHOICE('Music', 'Sport', RANDOM_ALPHA(30, 5))` | `'ValkUOkfhaax' => 'Music' => 'UmxkAj' ...` |

#### RANDOM_DATETIME

Date and time.

| Example | Returns |
| ------- | ------- |
| `RANDOM_DATETIME("2010-01-05 10:34:25")` | `'2009-01-01 09:22:34'` |
| `RANDOM_DATETIME("2019-01-05", "2000-09-10", "%Y-%m-%d %H:%M:%S")` | `'2013-08-25 12:22:45'` |
| `RANDOM_DATETIME(undef, "2015-00-10", "%Y/%m/%d")` | `'2006/12/22'` |

#### RANDOM_DOUBLE

Float.

| Example | Returns |
| ------- | ------- |
| `RANDOM_DOUBLE(20)` | `'15.231'` |
| `RANDOM_DOUBLE(100, 40)` | `'98.8861'` |

#### RANDOM_EMAIL

Email.

| Example | Returns |
| ------- | ------- |
| `RANDOM_EMAIL()` | `'dykUnDp@jhdnEkgtX.com.test'` |

#### RANDOM_INT

Integer.

| Example | Returns |
| ------- | ------- |
| `RANDOM_INT(20)` | `'15'` |
| `RANDOM_INT(100, 40)` | `'98'` |

#### RANDOM_JA_FAMILYNAME_KAN

Family name (Kanji) in japanese.

| Example | Returns |
| ------- | ------- |
| `RANDOM_JA_FAMILYNAME_KAN()` | `'山田'` |

#### RANDOM_JA_FIRSTNAME_KAN

First name (Kanji) in japanese.

| Example | Returns |
| ------- | ------- |
| `RANDOM_JA_FIRSTNAME_KAN()` | `'太郎'` |

#### RANDOM_JA_HIRAGANA

Hiragana in japanese.

| Example | Returns |
| ------- | ------- |
| `RANDOM_JA_HIRAGANA(20)` | `'にぱんべそのくるぇけあうぃをぶぁぇえおい'` |
| `RANDOM_JA_HIRAGANA(100, 40)` | `'なうええけちあぺそのり ... ゆあゅとんきげらそ'` |

#### RANDOM_JA_JP_PREF

Japanese prefecture in japanese.

| Example | Returns |
| ------- | ------- |
| `RANDOM_JA_JP_PREF()` | `'東京都'` |

#### RANDOM_JA_KATAKANA

Katakana in japanese.

| Example | Returns |
| ------- | ------- |
| `RANDOM_JA_KATAKANA(20)` | `'パンベソノクルェケアウィアヲヴァォエオイ'` |
| `RANDOM_JA_KATAKANA(100, 40)` | `'ナコソルリパンベソノク ... アイエオヲヴァォエ'` |

#### RANDOM_JA_NAME_KAN

Person name (Kanji) in japanese.

| Example | Returns |
| ------- | ------- |
| `RANDOM_JA_NAME_KAN(' ')` | `"山田 太郎"` |

#### RANDOM_JP_TEL

Japanese telephone number.

| Example | Returns |
| ------- | ------- |
| `RANDOM_JP_TEL()` | `'029-5881-3882'` |

#### RANDOM_JP_ZIPCODE

Japanese zip code (Fake).

| Example | Returns |
| ------- | ------- |
| `RANDOM_JP_ZIPCODE()` | `'224-0053'` |

#### SEQUENTIAL_CHOICE

Selection.

| Example | Returns |
| ------- | ------- |
| `SEQUENTIAL_CHOICE('Male', 'Female', 'Other')` | `'Male' => 'Female' => 'Other' => 'Male' ...` |

#### SEQUENTIAL_JA_JP_PREF

Japanese prefecture as '北海道' to '沖縄県' in japanese.

| Example | Returns |
| ------- | ------- |
| `SEQUENTIAL_JA_JP_PREF()` | `'北海道' => '青森県' => '岩手県' ...` |

## Key

#### FOREIGN_KEY

Key selector.

| Example | Returns |
| ------- | ------- |
| `FOREIGN_KEY("table_name")` | `72 => 55122 => 937 => 135722 ...` |
| `FOREIGN_KEY("table_name", FK_RANDOM)` | `5729 => 99221 => 351 => 7712 ...` |
| `FOREIGN_KEY("table_name", FK_ROTATION)` | `1 => 2 => 3 => 1 => 2 => 3 ...` |
| `FOREIGN_KEY("table_name", sub{ my ($fks) = @_; return $fks->[0] })` | `'X11-B3' => 'X11-B3' => 'X11-B3' ...` |

#### PRIMARY_KEY

Define primary key.

| Example | Returns |
| ------- | ------- |
| `PRIMARY_KEY(COUNTER())` | `1 => 2 => 3 ...` |

## Literal

#### LITERAL

Literal

| Example | Returns |
| ------- | ------- |
| `LITERAL('HELLO')` | `'HELLO'` |

#### SQL

Unescaped literal.

| Example | Returns |
| ------- | ------- |
| `SQL('NOW()')` | `NOW()` |

