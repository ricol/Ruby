#!/usr/bin/env ruby

teamA = 4.50
draw = 3.40
teamB = 1.91
match = { :teamA => teamA, :draw => draw, :teamB => teamB }

betTeamA = 100.0
betTeamB = 100.0
betDraw = 100.0

earningsTeamA = match[:teamA] * betTeamA
earningsTeamB = match[:teamB] * betTeamB
earningsDraw = match[:draw] * betDraw

totalBet = betTeamA + betTeamB + betDraw
totalEarnings = earningsTeamA + earningsDraw + earningsTeamB
net = totalEarnings - totalBet
puts "total bet: #{totalBet}"
puts "total earnings: #{totalEarnings}"
puts "net: #{net}"
