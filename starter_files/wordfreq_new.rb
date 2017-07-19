require "csv"

wordsArr = []
newWordsArr = []

STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from', 'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to', 'were', 'will', 'with']

text = File.read("seneca_falls.txt")
text.gsub!(/\n+|,|:|;|'s|\.|--/, " ")
text.gsub!(/\s\s/, " ")
text.downcase!
wordsArr = text.split(" ")

STOP_WORDS.each do |wordToDelete| # filters out the STOP_WORDS from the Words Arr
  wordsArr.delete(wordToDelete)
end

words = {}
wordsArr.each do |x|
  words[x] = 0 if words[x].nil?
  words[x] += 1
end

sortedWords = words.sort_by{|key, value| value}.reverse
hashWords = sortedWords.to_h.take(10)

hashWords.each do |key, value|
  puts "#{key} | #{value} " + "*"* value
end
