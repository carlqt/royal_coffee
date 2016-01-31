# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setPrice = (drink)->
  $.getJSON("/products/#{drink.product_id}").done (data)->
    size = "#{drink.size.val().toLowerCase()}_price"
    price = parseFloat(data[size]).toFixed(2)
    drink.price.text("$#{price}")

ready = ->

  $(".product").on "change", ".size", (e)->
    el = $(e.delegateTarget)
    drink =
      name: el.find('.name').text()
      size: el.find('.size')
      price: el.find('.price')
      product_id: el.data("product-id")

    setPrice(drink)

  $(".product").on "click", ".order", (e)->
    el = $(e.delegateTarget)
    id = $("#table").data("table-id")
    orderLink = el.find('.order')

    drink =
      price: el.find('.price').text().trim()
      size: el.find('.size').val()
      product_id: el.data("product-id")

    url = "#{id}/add_item?#{$.param(drink)}"
    orderLink.text('Adding...')
    console.log url
    $.post(url)
    return false

$(document).ready(ready)
$(document).on('page:load', ready)