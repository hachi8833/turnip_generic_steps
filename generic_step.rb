## -*- encoding: utf-8 -*- 
## 一般的に利用できるTurnipステップ

## テスト用ステップ

	#表示テキスト存在確認
step %(:textと表示されている) do |text|
  expect(page).to have_content(text)
end

	#表示テキスト不在確認
step %(:textと表示されていない) do |text|
  expect(page).not_to have_content(text)
end

	#表示個数確認
step %(:textが:count個表示されている) do |text, count|
  expect(page.all(text).count).to eq (count)
end

## 操作用ステップ

	#ページ移動
step %(:pageページにアクセスする) do |page|
  visit "http://localhost/#{page}"
end

	#リンクをクリック (textはリンク文字列かid)
	#同じ名前のリンクが複数ある場合には文字列は指定できない
step %(:textリンクをクリックする) do |text|
  click_link text
end

	#同じ名前のリンクが複数ある場合に順序も指定
step %(:n番目の:textリンクをクリックする) do |n, text|
  n = n.to_i - 1
  all(:link_or_button, text)[n].click
end

	#ボタンをクリック (textはボタン文字列かid)
	#同じ名前のボタンが複数ある場合には文字列は指定できない
step %(:textボタンをクリックする) do |text|
  click_button text
end

	# フィールドに文字列を入力する |fieldはモデル[属性]の形式
step %(:fieldに:valueを設定する) do |field, value|
  fill_in field, with: value
end

	# ドロップダウンボックスを選択 (textはボタン文字列かid)
	#同じ名前の項目が複数ある場合には文字列は指定できない
step %(:choiceを選択する) do |choice|
  choose choice
end

	# チェックボックスを選択  (choiceは文字列かid)
	# 同じ名前の項目が複数ある場合には文字列は指定できない
step %(:choiceをチェックする) do |choice|
  check choice
end

	# チェックボックスを選択解除  (choiceは文字列かid)
	# 同じ名前の項目が複数ある場合には文字列は指定できない
step %(:choiceのチェックを外す) do |choice|
  uncheck choice
end

## デバッグ用

	# pryを呼ぶ (pry, pry-rails, pry-doc がインストールされていること)
step %(pryを呼び出す) do
  binding.pry
  puts ''
end

	# その時点の静的なwebページを表示する
step %(表示する) do
  save_and_open_page
end

	# ペンディング用
step %(:reasonという理由でペンディング) do |reason|
  pending reason
end
