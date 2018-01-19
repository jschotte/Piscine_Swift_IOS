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













