
$ ->
  $('.tags_with_autocomplete').autocomplete
    minLength: 2
    source: (request, response) ->
      $.ajax
        url: $('.tags_with_autocomplete').data('autocompleteurl')
        dataType: "json"
        data:
          query: request.term
        success: (data) ->
          console.log(data)
          response(data)