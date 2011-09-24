#!/usr/bin/env ruby

require "rubygems"
require "nxt"

class Remote
  def initialize
    @nxt=NXTComm.new($DEV)
    @comm = ''
  end

  def run
    while @comm != 'q'
    @comm = gets.chomp
      puts @comm
      execute(@comm) 
    end
  end

  def execute(comm)
    case comm
    when comm = "f"
      Commands::Move.new(@nxt).start
    when comm = "b"
      m = Commands::Move.new(@nxt)
      m.direction = :backward
      m.start
    when comm = "l"
      m= Commands::Move.new(@nxt)
      m.steering = :left
      m.start
    when comm = "r"
      m = Commands::Move.new(@nxt)
      m.steering = :right
      m.start
    when comm = "s"
      m = Commands::Move.new(@nxt)
      m.stop
    end
  end

end

 remote =Remote.new
 remote.run

