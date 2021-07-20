enum EventType: String {
  case home
  case join
  case login
  case logout
  case search
  case item
  case like
  case addToCart = "add to cart"
  case removeFromCart = "remove from cart"
  case cart
  case purchaseStart = "purchase start"
  case purchase
  case promotion
  case review
  case clickRecomItem = "click recom item"
  case imprRecomItems = "impr recom items"
  case openNotification = "open notification"
  case notificationReceived = "notification received"
}
