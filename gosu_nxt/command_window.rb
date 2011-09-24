require "rubygems"
require 'gosu'
require "nxt"

class CommandWindow < Gosu::Window

  def initialize
    super(300, 400, false)
    @nxt=NXTComm.new($DEV)

  end

  def update
    if button_down? Gosu::Button::KbLeft
      puts "left"
      m= Commands::Move.new(@nxt)
      m.steering = :left
      m.start
    end
    if button_down? Gosu::Button::KbRight
      puts "Right"
      m = Commands::Move.new(@nxt)
      m.steering = :right
      m.start
    end
    if button_down? Gosu::Button::KbUp
      puts "Up"
      Commands::Move.new(@nxt).start
    end
    if button_down? Gosu::Button::KbDown
      puts "down"
      m = Commands::Move.new(@nxt)
      m.direction = :backward
      m.start
    end
  end

  def draw
  end
end 

window = CommandWindow.new
window.show
