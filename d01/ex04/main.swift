for color in Color.allColors
{
	print("\(color): \(color.rawValue)")
}

print("\n")

for value in Value.allValues
{
	print("\(value): \(value.rawValue)")
}

print("\n")

for color in Color.allColors
{
	for value in Value.allValues
	{
		let card = Card(color: color, value: value)
		print(card.description)
	}
}

print("\n")

let card1 = Card(color: Color.Diamond, value: Value.Ace)
let card2 = Card(color: Color.Diamond, value: Value.Ace)
let card3 = Card(color: Color.Diamond, value: Value.King)

print (card1.isEqual(card2))
print (card2.isEqual(card3))
print (card1.isEqual(Color.Diamond))

print("\n")

let card4 = Card(color : Color.Spade, value : Value.Ace)
print(card4)
let card5 = Card(color : Color.Diamond, value: Value.Two)
print(card5)
let card6 = Card(color : Color.Diamond, value: Value.Two)
print(card6)
print(card4 == card5)
print(card6 == card5)

print("\n")

var deck = Deck.allCards
for card in deck
{
	print(card.description)
}
deck.random()
for card in deck
{
	print(card.description)
}

print("\nEx04")

//var newdeck = Deck(b: false)
//print(newdeck.description)

var newdeck = Deck(b: true)
for i in 0..<53
{
	print("----")
	print("Cards:")
	print(newdeck.description)
	print("Card Pick:")
	print((newdeck.draw())?.description ?? "Error Deck is empty")
	print("Out:")
	print(newdeck.out.description)
	print("----")
}


print("\n")
var foldtest = Deck(b: false)
print(foldtest.description)

print("draw")
foldtest.draw()
foldtest.draw()
foldtest.draw()
foldtest.draw()
foldtest.draw()
print(foldtest.out.description)
print(foldtest.discards.description)

print("fold")
foldtest.fold(c: (foldtest.out.first!))
print(foldtest.out.description)
print(foldtest.discards.description)

foldtest.fold(c: (foldtest.discards.first!))
print(foldtest.out.description)
print(foldtest.discards.description)
