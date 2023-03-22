module String_animations
  def animate_text(string)
    string.each_char do |char|
      print char
      sleep rand(0.02..0.08)
    end
  end
end