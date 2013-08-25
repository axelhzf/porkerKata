expect = (require 'chai').expect
Card = require '../src/Card'

card1 = new Card("1", "♣")
card2 = new Card("2", "♣")
cardK = new Card("K", "♣")

describe "Card", ->
    describe "isNextNumber", ->
        describe "when consecutive cards", ->
            it  "should return true", ->
                expect(card1.isNextNumber(card2)).to.be.true;

        describe "when no consecutive cards", ->
            it  "should return false", ->
                expect(card1.isNextNumber(cardK)).to.be.false;

        describe "when pass K and 1", ->
            it  "should return true", ->
                expect(cardK.isNextNumber(card1)).to.be.true;
