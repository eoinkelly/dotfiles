#!/usr/bin/env ruby

$commands = Hash.new(0)

ARGF.each do |line|
  atoms = line.split(' ')
  key = atoms[3]
  key = "#{key} #{atoms[4]}" if key == 'git'
  $commands[key] += 1
end

$commands.each do |command, frequency|
  puts "#{frequency} #{command}"
end
