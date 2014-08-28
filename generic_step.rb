# vim:set fileencoding=utf-8 filetype=ruby:
#
# page オブジェクトに関するステップ

# テスト用ステップ
step %(:textと表示されている) do |text|
  expect(page).to have_content(text)
end

step %(:textが:cnt個表示されている) do |text, cnt|
  expect(page).to have_content(text, count: cnt)
end

step %(:textと表示されていない) do |text|
  expect(page).not_to have_content(text)
end

step %(アクセス表示権限エラーが出ていない) do
  expect(page).not_to have_content("リンク先のページを表示する権限がありません")
end

step %(アクセス表示権限エラーが出ていない) do
  expect(page).not_to have_content("リンク先のページを表示する権限がありません")
end

step %(CSVファイルが出力される) do
  expect(page.response_headers['Content-Type']).to eq 'text/csv'
  expect(CSV.parse(page.body)).to be_a(Array)
end

step %(ファイル:filenameがダウンロードされる) do |filename|
  expect(page.response_headers['Content-Disposition']).to include(%(filename="#{filename}"))
end

step %(セレクトボックス:selectboxに:itemがある) do |selectbox, item|
  expect(page).to have_select(selectbox, with_options: item)
end

# 操作用ステップ
step %(:textリンクをクリックする) do |text|
  click_link text
end

step %(:n番目の:textリンクをクリックする) do |n, text|
  n = n.to_i - 1
  all(:link_or_button, text)[n].click
end

step %(:textボタンをクリックする) do |text|
  click_button text
end

step %(:n番目の:textボタンをクリックする) do |n, text|
  n = n.to_i - 1
  all(:link_or_button, text)[n].click
end

step %(:fieldに:valueを設定する) do |field, value|
  fill_in field, with: value
end

step %(:n番目の:fieldに:valueを設定する) do |n, field, value|
  fill_in field, with: value
end

step %(:optionオプションの:valueを選択する) do |option, value|
  select value, from: option
end

step %(:choiceを選択する) do |choice|
  choose choice
end

step %(:choiceをチェックする) do |choice|
  check choice
end

step %(:choiceのチェックを外す) do |choice|
  uncheck choice
end

# デバッグ用
step %(pryを呼び出す) do
  binding.pry
  puts ''
end

step %(表示する) do
  save_and_open_page
end
