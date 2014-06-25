# Turnip generic steps

## 概要

受け入れテスト自動化ソフトTurnipでよく使われるstepをテンプレとしてまとめた。Ruby on Rails環境での使用を想定。

## 使い方

1. Railsで RSpec、Cucumber、Turnipを使用可能な環境を整える (詳細は省略、[Turnipについて](http://gongo.hatenablog.com/entry/2013/05/29/223218)などを参照)
2. generic_step.rbを spec/stepsディレクトリに置く
3. 以下のような要領でfeatureファイルに受け入れテストを書き、spec/acceptanceディレクトリやspec/featuresなどに置く

``` example.feature
前提 "[参加者一覧]"リンクをクリックする
ならば "参加者一覧"と表示されている
かつ "[参加者編集]"リンクをクリックする
かつ "[追加]"リンクをクリックする
ならば "1件追加"と表示されている
かつ "sankasha[name]"に"参加者001"を設定する
かつ "sankasha[yomi]"に"さんかしゃよみ"を設定する
かつ "sankasha[zip_code]"に"239-0803"を設定する
かつ "sankasha[address]"に"住所1"を設定する
かつ "sankasha[sub_address]"に"住所2"を設定する
かつ "sankasha[tel]"に"03-671-2500"を設定する
かつ "sankasha[fax]"に"03-671-2501"を設定する
かつ "sankasha[eigyou]"に"営業太郎"を設定する
かつ "sankasha[email]"に"eigyou@eigyou.com"を設定する
かつ "追加"ボタンをクリックする
ならば "参加者001を作成しました"と表示されている
```

4. 後は普通にRSpecを実行
