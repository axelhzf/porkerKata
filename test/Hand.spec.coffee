expect = (require 'chai').expect
Hand = require '../src/Hand'

describe 'Hand', ->

    testHand = (cardSequence, expectedValue) ->
        hand = new Hand cardSequence
        (expect hand.value()).to.equal(expectedValue)

    it 'should detect empty hand', ->
        testHand '3♠ Q♣ 5♦ 6♦ J♠ ', ''

    it 'should detect a pair', ->
        testHand '3♠ 3♣ 5♦ 6♦ 7♠ ', 'Pair'

    it 'should detect two pair', ->
        testHand '3♠ 3♣ 5♦ 5♦ 7♠ ', 'Two pair'

    it 'should detect straight', ->
        testHand '3♠ 5♦ 6♦ 7♠ 4♣', 'Straight'

    it 'should detect straight with K and 1', ->
        testHand '10♠ J♦ Q♦ K♠ 1♣', 'Straight'

    it 'should detect flush', ->
        testHand '3♠ 6♠ 6♠ 7♠ 4♠', 'Flush'

    it 'should detect full house', ->
        testHand '3♠ 3♦ 4♠ 4♦ 4♣', 'Full House'

    it 'should detect four of a kind', ->
        testHand '1♠ 1♣ 1♦ 1♣ J♠ ', 'Four of a kind'

    it 'should detect straight flush', ->
        testHand '10♠ J♠ Q♠ K♠ 1♠', 'Straight flush'