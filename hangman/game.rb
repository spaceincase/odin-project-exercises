require 'io/console'
require 'yaml'

class Game

  FIGURE = ['O','/','|','\\','/','\\']

  def initialize

    @savenames = Dir['saves/*'].join(', ').gsub('saves/', '').gsub('.txt', '')
    @width = IO.console.winsize[1]
    generate_word
    @correct_letters = []
    @incorrect_letters = []
    @turns = 0
    @player = []

    system 'clear'

    if @savenames.length > 0
      puts "Would you like to load a previous save (y/n)?"
      answer = gets.chomp.downcase
      if answer == 'y'
        puts "Which save would you like to load?"
        puts @savenames
        answer = gets.chomp
        filename = 'saves/' + answer + '.txt'
        load(filename) if File.exist?(filename)
      else
        play
      end

    else
      play
    end
  end

  def play

    while @turns < 6
      break if check_word
      display
      puts "Welcome to hangman!".center(@width), "Type 'save' instead of guessing to save.".center(@width) if @turns == 0
      puts "Enter a letter?"

      guess = gets.chomp.downcase
      if guess == 'save'
        self.save
        redo
      end

      redo if guess.length != 1 || guess =~ /[^a-z]/

      if @word.include?(guess)
        @correct_letters << guess
      else
        @player[@turns] = Game::FIGURE[@turns]
        @incorrect_letters << guess
        @turns += 1
      end

    end

    display
    puts "You win!" if check_word
    puts "Play Again (y/n)?"
    answer = gets.chomp.downcase
    Game.new if answer == 'y'

  end

  def display
    w = @width
    s = " "
    system 'clear'
    puts "Hangman!".center(w)
    puts "______".center(w)
    puts "|     #{@player[0] || s} ".center(w)
    puts "|    #{@player[1] || s}#{@player[2] || s}#{@player[3] || s}".center(w)
    puts "|    #{@player[4] || s} #{@player[5] || s}".center(w)
    puts "|_______".center(w)
    puts ""
    puts "Word: #{self.reveal}".center(w)
    puts "Trys left: #{6-@turns}".center(w)
    puts "Guesses so far: #{(@incorrect_letters + @correct_letters).uniq.join(' ')}".center(w)
  end

  def generate_word
    words = File.readlines('5desk.txt')
    words.map! { |word| word.gsub(/\r\n/, '') }
    words.select!{|word| word.length <= 12 && word.length >= 5}
    @word = words[rand(0..words.length-1)]
  end

  def reveal
    @word.gsub(/./) {|c| @correct_letters.include?(c) ? c : '_'}
  end

  def check_word
    @word.split('').uniq == @correct_letters.uniq
  end

  def save

    Dir.mkdir('saves') unless Dir.exist?('saves')

    puts "Name for savefile?"
    name = gets.chomp.downcase

    if @savenames.split(' ').include?(name)
      puts "filename already exists. Do you want to overwrite (y/n)?"
      gets.chomp.downcase == 'y' ? filename = 'saves/' + name + '.txt' : save
    else
      filename = 'saves/' + name + '.txt'
    end

    File.open(filename, 'w') {|file| file.write self.to_yaml}
  end

  def load(filename)

    file = File.open(filename, 'r')
    data = YAML.load file.read

    @word = data[:word]
    @turns = data[:turns]
    @player = data[:player]
    @correct_letters = data[:correct_letters]
    @incorrect_letters = data[:incorrect_letters]

    play

  end

  def to_yaml

    YAML.dump({
      word: @word,
      turns: @turns,
      player: @player,
      correct_letters: @correct_letters,
      incorrect_letters: @incorrect_letters
      })

  end

end
