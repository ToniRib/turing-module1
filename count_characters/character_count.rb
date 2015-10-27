require 'pry'

class CharacterCount
  def count_chars(str)
    return nil if str == ""

    totals = {}

    uniq_letters = str.chars.uniq

    uniq_letters.each do |letter|
      totals[letter] = str.chars.count(letter)
    end

    totals
  end

  def count(str = '')
    counts = count_chars(str)
    sorted = sort(counts)
    sorted.each do |k, v|
      puts "#{k}: #{v}"
    end
  end

  def sort(hash)
    sorted = hash.sort_by { |k, v| v }
    Hash[*sorted.reverse.flatten]
  end
end

if __FILE__ == $0
  counter = CharacterCount.new
  sentence = 'I really want to work for Wingspan'
  counter.count(sentence)
end
