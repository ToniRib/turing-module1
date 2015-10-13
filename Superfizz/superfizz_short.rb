TRANSLATE = { 7 => 'Super', 3 => 'Fizz', 5 => 'Buzz' }

(0..1000).to_a.each do |n|
  vals = TRANSLATE.keys.select { |k| n % k == 0 }
  if vals.length == 3
    puts TRANSLATE.values.join
  elsif vals.length == 2 && vals.include?(7)
    puts TRANSLATE.fetch(vals.first) + TRANSLATE.fetch(vals.last)
  elsif vals.length == 1
    puts TRANSLATE.fetch(vals.first)
  else
    puts n
  end
end
