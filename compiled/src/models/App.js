// Generated by CoffeeScript 1.10.0
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  window.App = (function(superClass) {
    extend(App, superClass);

    function App() {
      return App.__super__.constructor.apply(this, arguments);
    }

    App.prototype.initialize = function() {
      var deck;
      this.set('deck', deck = new Deck());
      this.set('playerHand', deck.dealPlayer());
      this.set('dealerHand', deck.dealDealer());
      this.get('playerHand').on('stand', (function(_this) {
        return function() {
          return _this.get('dealerHand').dealerTurn();
        };
      })(this));
      return this.get('dealerHand').on('stand', (function(_this) {
        return function() {
          return _this.compareScores();
        };
      })(this));
    };

    App.prototype.compareScores = function() {
      var dealerScore, playerScore;
      playerScore = this.get('playerHand').getBetterScore();
      dealerScore = this.get('dealerHand').getBetterScore();
      switch (false) {
        case !(playerScore > dealerScore):
          return alert('You Win!!!');
        case playerScore !== dealerScore:
          return alert('Draw');
        default:
          return alert('House wins!!!');
      }
    };

    return App;

  })(Backbone.Model);

}).call(this);
