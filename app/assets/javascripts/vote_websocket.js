var VoteSocket = function(user_id, auction_id, form) {
  this.user_id = user_id;
  this.auction_id = auction_id;
  this.form = form;

  this.socket = new WebSocket();
}


VoteSocket.sendBid = function(value) {
  this.socket.send('');
}
