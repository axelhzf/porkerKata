_ = require 'underscore'
CardSequenceParser = require './CardSequenceParser'
Card = require './Card'

class Hand

    constructor : (cardSequence) ->
        @cards = CardSequenceParser.parse cardSequence

    value : ->
        switch
            when @hasStraightFlush() then 'Straight flush'
            when @hasFourOfAKind() then 'Four of a kind'
            when @hasFullHouse() then 'Full House'
            when @hasFlush() then 'Flush'
            when @hasStraight() then 'Straight'
            when @hasTwoPair() then 'Two pair'
            when @hasThreeOfAKind() then 'Three of a kind'
            when @hasPair() then 'Pair'
            else
                ''

    hasPair : -> @countSameNumber(2) == 1

    hasTwoPair : -> @countSameNumber(2) == 2

    hasThreeOfAKind : -> @countSameNumber(3) == 1

    hasStraight : ->
        @cardsAreConsecutive(@cards.sort(Card.comparatorAceLow)) ||
        @cardsAreConsecutive(@cards.sort(Card.comparatorAceHigh))

    hasFlush : ->
        numberOfSuits = _.unique(_.pluck(@cards, "suit")).length
        numberOfSuits == 1

    hasFullHouse : ->
        @countSameNumber(2) == 1 && @countSameNumber(3) == 1

    hasFourOfAKind : ->
        @countSameNumber(4) == 1

    hasStraightFlush : ->
        @hasFlush() && @hasStraight()

    countSameNumber : (n) ->
        _.chain(@cards)
            .countBy((card) -> card.number)
            .filter((count) -> count == n)
            .value()
            .length

    cardsAreConsecutive : (cards) ->
        for i in [0..cards.length - 2]
            [card1, card2] = cards[i..i + 1]
            areConsecutive = card1.isNextNumber card2
            return false unless areConsecutive
        true

module.exports = Hand


