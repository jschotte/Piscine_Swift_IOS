import Foundation

class Deck : NSObject
{
	static let allSpades: [Card] = Value.allValues.map{ (Card(color: Color.Spade, value: $0)) }
	static let allDiamonds: [Card] = Value.allValues.map{ (Card(color: Color.Diamond, value: $0)) }
	static let allHearts: [Card] = Value.allValues.map{ (Card(color: Color.Heart, value: $0)) }
	static let allClubs: [Card] = Value.allValues.map{ (Card(color: Color.Club, value: $0)) }

	static let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs

		var cards: [Card] = allCards
		var discards: [Card] = []
		var out: [Card] = []

		init(b: Bool)
		{
			if (b)
			{
				cards.random()
			}
		}

	override var description: String
	{
		return cards.description
	}

	func draw () -> Card?
	{
		if (!cards.isEmpty)
		{
			out.append(cards.first!)
			cards.removeFirst()
			return (out.first)
		}
		return nil
	}

	func fold(c : Card)
	{
		if let index = out.index(of: c)
		{
		    out.remove(at: index)
			discards.append(c)
		}
	}
}

extension Array {
	mutating func random()  {
		for elem in self.indices
		{
			let r = Int(arc4random_uniform((UInt32(self.count))))
			swapAt(elem, r)
		}
	}
}

