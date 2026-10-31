# Reversing a given Sentence

sentence_1 = "This Sentence Needs to be Reversed"
# Expected Output:
# sihT ecnetneS sdeeN ot eb desreveR

def reverse_string(sentence)
  # Each word needs to be reversed individually first
  # Array of words of the sentence
  words = sentence.split(" ");

  reversed_words = []
  reversed_sentence =''

  # Looping over the array and then calling a function to reverse each word.
  words.each do |word|
    reversed_words << reverse_word(word)
  end

  # Join words with spaces in between
  reversed_sentence = reversed_words.join(' ')
  # Strip the Leading and Trailing Spaces.
  reversed_sentence.strip()
end

def reverse_word(word)
  # Loop over the word in reverse and store each character in a sperate variable
  reversed_word = ''

  (word.length - 1).downto(0) do |char_index|
    reversed_word << word[char_index]
  end

  reversed_word
end

# Display the reversed String.
puts "\"#{reverse_string(sentence_1)}\""
