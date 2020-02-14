/*
Author: Arian Allenson Valdez
This is a course requirement for CS 192
Software Engineering II under the
supervision of Asst. Prof. Ma. Rowena C.
Solamo of the Department of Computer
Science, College of Engineering, University
of the Philippines, Diliman for the AY 2019-
2020
Arian Allenson Valdez - 14/02/2020 - Add date picker
*/

// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import 'daterangepicker'
import 'daterangepicker/daterangepicker.css'

$(function() {
  const dataset = []
  $('input[name="daterange"]').daterangepicker({
    opens: 'left'
  }, function(start, end, label) {
    $('[data-daterangeborrow]').each((d, $el) => {
      const url = new URL(`https://site.com${$el.dataset.to}`)

      const newParam = new URLSearchParams()
      const param = new URLSearchParams(url.search)
      for (let pair of param.entries()) {
        if (pair[0] === 'end') {
          newParam.set('end', end.format('YYYY-MM-DD'))
        } else if (pair[0] === 'start') {
          newParam.set('start', start.format('YYYY-MM-DD'))
        } else {
          newParam.set(pair[0], pair[1])
        }
      }

      const endpoint = `${$el.dataset.to.split('?')[0]}?${newParam.toString()}`
      $el.dataset.to = endpoint
      $el.href = endpoint
    })
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'))
  })
})
