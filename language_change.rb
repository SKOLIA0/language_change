# encoding: utf-8
argument = ARGV[0].to_s
if argument == nil
  language = "ru"
elsif argument == "en"
  language = "en"
elsif argument.downcase == "ru"
  language = "ru"
elsif argument.downcase == "fr"
   language = "fr"
else
  language = "ru"
end

def get_text(language)
  if language == "en"
    text = ["What is the dollar exchange rate?",
             "How many rubles do you have?",
             "How many dollars do you have?",
             "Everything is fine, your portfolio is balanced, you don't need to do anything.",
             "You need to buy $",
             "You need to sell $"]

  elsif language == "ru"
    text = ["Какой курс  доллара?",
            "Сколько у вас рублей?",
            "Сколько у вас долларов?",
            "Всё хорошо, ваш портфель сбалансирован, ничего делать не нужно.",
            "Вам нужно купить $",
            "Вам нужно продать $"]

  elsif language == "fr"
    text = ["Quel est le taux de change du Dollar?",
            "Combien de roubles avez-vous?",
            "Combien de dollars avez-vous?",
            "Tout va bien, votre portefeuille est équilibré, vous n'avez rien à faire.",
            "Vous devez acheter $",
            "Vous devez vendre $"]
  end
  return text
end

def usd_to_sell(rub, usd, price)
  rub_usd = rub / price
  if (rub_usd - usd).abs < 0.01
    return 0
  else
    return (((rub_usd + usd)/2) - rub_usd).round(2)
  end
end

def metod(usd_to_sell, text3, text4, text5)
  if usd_to_sell > 0
    return "#{text5}#{usd_to_sell}"
  elsif usd_to_sell < 0
    return "#{text4}#{usd_to_sell.abs}"
  elsif usd_to_sell == 0
    return "#{text3}"
  end
end

puts get_text(language)[0]
price = STDIN.gets.to_f

puts get_text(language)[1]
rub = STDIN.gets.to_f

puts get_text(language)[2]
usd = STDIN.gets.to_f

puts metod(usd_to_sell(rub, usd, price), get_text(language)[3], get_text(language)[4], get_text(language)[5])
