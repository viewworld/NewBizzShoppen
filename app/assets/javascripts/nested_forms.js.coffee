jQuery ($) ->
  $(document).ready ->
    nestedFormSample = $('.duplicatable-nested-form-sample').clone()
    $('.duplicatable-nested-form-sample').remove()

    $('.destroy-duplicate-nested-form').live 'click', (e) ->
      nestedForm = $(this).closest('.duplicatable-nested-form')

      # TODO: Add undo
      if $(nestedForm).hasClass('new-record')
        $(nestedForm).remove()
      else
        $(nestedForm).hide();
        $(nestedForm).find('input[type=hidden]').val('1')

    $('.duplicate-nested-form').click (e) ->
      e.preventDefault()

      newNestedForm = $(nestedFormSample).clone()
      formsOnPage = $('.duplicatable-nested-form').length

      $(newNestedForm).find('label').each ->
        oldLabel = $(this).attr 'for'
        newLabel = oldLabel.replace(new RegExp(/_[0-9]+_/), "_#{formsOnPage}_")
        $(this).attr 'for', newLabel

      $(newNestedForm).find('input').each ->
        oldId = $(this).attr 'id'
        newId = oldId.replace(new RegExp(/_[0-9]+_/), "_#{formsOnPage}_")
        $(this).attr 'id', newId

        oldName = $(this).attr 'name'
        newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[#{formsOnPage}]")
        $(this).attr 'name', newName

      $('.duplicatable-nested-form-list').append(newNestedForm.removeClass('hidden'));
