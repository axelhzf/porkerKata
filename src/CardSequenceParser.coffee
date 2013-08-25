Card = require './Card'

class CardSequenceParser

    @parse: (cardSequence) ->
        pattern = /(10|[1-9]|[JKQ])([♣♦♠♥])/g

        cards = []
        while (matches = pattern.exec(cardSequence))
            [number, suit] = matches[1..2]
            cards.push new Card(number, suit)
        cards

module.exports = CardSequenceParser
