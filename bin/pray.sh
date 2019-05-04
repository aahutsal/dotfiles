title=$(curl "https://azbyka.ru/molitvoslov/molitva-pered-nachalom-i-po-okonchanii-vsyakogo-dela.html"|xmllint --html --xpath "//h2/text()" - 2>/dev/null)
text=$(curl "https://azbyka.ru/molitvoslov/molitva-pered-nachalom-i-po-okonchanii-vsyakogo-dela.html"|xmllint --html --xpath "//h2/following-sibling::p/text()" - 2>/dev/null)

Xdialog --title $title --msgbox $text --wrap --cr-wrap --center 6 10
