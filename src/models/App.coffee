# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', =>  @get('dealerHand').dealerTurn()
    @get('dealerHand').on 'stand', => @compareScores()

  compareScores: ->
    playerScore = @get('playerHand').getBetterScore()
    dealerScore = @get('dealerHand').getBetterScore()
    switch
      when playerScore > dealerScore then alert 'You Win!!!'
      when playerScore == dealerScore then alert 'Draw'
      else alert 'House wins!!!'
