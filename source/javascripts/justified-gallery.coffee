#= require './vendor/jquery.justifiedGallery'

$ ->
  lineHeight = parseInt($('body').css('lineHeight'))
  numOfLines = 6
  $(".picture").justifiedGallery
    rowHeight: numOfLines * lineHeight
    fixedHeight: yes
    randomize: yes
    lastRow: 'justify'
