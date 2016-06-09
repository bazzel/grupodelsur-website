# See also http://miromannino.github.io/Justified-Gallery/
#= require './vendor/jquery.justifiedGallery'

$ ->
  lineHeight = parseInt($('body').css('lineHeight'))
  numOfLines = 6
  margins = 1
  $(".picture").justifiedGallery
    rowHeight: numOfLines * lineHeight - margins
    fixedHeight: yes
    randomize: yes
    lastRow: 'justify'
    margins: margins
