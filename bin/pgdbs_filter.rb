#!/usr/bin/env ruby

ARGF.each do |line|
  cols = line.split('|').map(&:strip)

  # ignore the standard postgres databases
  next if cols[0] =~ /^template/
  next if cols[0] =~ /^postgres/

  # ignore postgres intro and summary lines
  next if cols[0] =~ /^$/
  next if cols[0] =~ /^--/
  next if cols[0] =~ /^\(/
  next if cols[0] =~ /^Name/
  next if cols[0] =~ /^List of/

  # ["wolfpack_test", "eoinkelly", "UTF8", "en_NZ.UTF-8", "en_NZ.UTF-8", "", "7265 kB", "pg_default", ""]
  puts "#{cols[0]} (approx. #{cols[6]})"
end
