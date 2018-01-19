import Foundation

class Card: NSObject
{
	var color: Color
	var value: Value

	init(color: Color, value: Value)
	{
		self.color = color
		self.value = value
	}

	override var description: String
	{
		get{
			return "(\(value.rawValue), \(color))"
		}
	}

	override func isEqual(_ object: Any?)-> Bool
	{
		let obj = object as? Card
		return (obj?.value == self.value && obj?.color == self.color)
	}

	static func ==(c1: Card, c2: Card) -> Bool
	{
		return (c1.color == c2.color && c1.value == c2.value)
	}
}
