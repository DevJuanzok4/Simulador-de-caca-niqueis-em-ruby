reel1 = %w[7 Bar Diamante Cereja]
reel2 = %w[Diamante Cereja BAR 7]
reel3 = %w[Cereja Diamante 7 BAR]

def spin_reels(reel)
  reel.sample
end

def check_win(symbols)
  symbols.uniq.length == 1
end

balance = 100

loop do
  puts "Seu saldo atual: #{balance}"

  print "Faça sua aposta (ou digite 'sair' para sair): "
  bet = gets.chomp.downcase

  break if bet == 'sair'

  bet = bet.to_i

  if bet <= 0 || bet > balance
    puts 'Aposta inválida, seu trapaceiro.'
    next
  end

  symbol1 = spin_reels(reel1)
  symbol2 = spin_reels(reel2)
  symbol3 = spin_reels(reel3)

  puts "Resultado: #{symbol1} - #{symbol2} - #{symbol3}"

  # Verificando se houve uma vitória
  if check_win([symbol1, symbol2, symbol3])
    win_amount = bet * 10 # Valor da vitória
    balance += win_amount
    puts "Parabéns, você ganhou #{win_amount}!"
  else
    balance -= bet
    puts 'Não foi dessa vez. Tente novamente!'
  end

  # Verificando se o jogador ficou sem dinheiro
  if balance <= 0
    puts 'Você ficou sem dinheiro. Obrigado por jogar!'
    break
  end
end

puts 'Obrigado por jogar!'
