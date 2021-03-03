def wave(str)
  mexican_wave = []
  amount_of_times = str.size
  amount_of_times.times do
    mexican_wave << str.dup
  end
  mexican_wave.each_with_index do |word, index|
    next if word == ' '
    p "#{index}: #{word}"
    p mexican_wave
    word[index] = word[index].upcase
  end
  # mexican_wave.delete(str)
  mexican_wave
end

p wave("hello")