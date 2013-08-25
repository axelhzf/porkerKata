expect = (require 'chai').expect
Card = require '../src/Card'
CardSequenceParse = require '../src/CardSequenceParser'

describe 'CardSequenceParser', ->

    it 'should parse a valid card sequence', ->
        cards = CardSequenceParse.parse '3♣ 10♦ J♦ Q♠ K♥'

        expect(cards.length).to.equal 5
        expect(cards[0]).to.eql new Card("3", "♣")
        expect(cards[1]).to.eql new Card("10", "♦")
        expect(cards[2]).to.eql new Card("J", "♦")
        expect(cards[3]).to.eql new Card("Q", "♠")
        expect(cards[4]).to.eql new Card("K", "♥")
