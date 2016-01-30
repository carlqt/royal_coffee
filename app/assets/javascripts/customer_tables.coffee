# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setPrice = (drink)->
  $.getJSON("/products/#{drink.id}").done (data)->
    size = "#{drink.size.val().toLowerCase()}_price"
    price = parseInt(data[size]).toFixed(2)
    drink.price.text("$#{price}")

$(document).ready ->

  $(".product").on "change", ".size", (e)->
    el = $(e.delegateTarget)
    drink =
      name: el.find('.name').text()
      size: el.find('.size')
      price: el.find('.price')
      id: el.data("product-id")

    setPrice(drink)