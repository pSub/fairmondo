###
   Copyright (c) 2012-2017, Fairmondo eG.  This file is
   licensed under the GNU Affero General Public License version 3 or later.
   See the COPYRIGHT file for details.
###

remoteValidate = ->
  $('.l-main').on 'change keyup', '.JS-remote-validate-blur', validateRemotely

$(document).ready remoteValidate
$(document).ajaxStop remoteValidate

validateRemotely = (event) ->
  $(@).doTimeout 'typing', 250, -> # to allow JS-enforce-input-constraints to do it's thang
    target = event.target
    $target = $(target)
    params_from_name = target.name.slice(0, -1).split('[') # e.g. line_item[requested_quantity] => ['line_item', 'requested_quantity']
    value = target.value
    unless value is $target.attr('data-validation-allow') or value is '' # allow specific inputs. maybe make this regex compatible
      model = params_from_name[0]
      field = params_from_name[1]
      additional_params = $target.attr('data-validation-params')
      additional_params = if additional_params then "?#{additional_params}" else ''

      $.ajax
        type: 'POST'
        url: "/remote_validations/#{model}/#{field}/#{value}.json#{additional_params}"
        dataType: 'json'
        global: false
        success: (response) ->

          # reset in case error messages get chained
          $target.parent().removeClass 'error'
          $target.siblings('.inline-errors').remove()
          $target.parent().qtip('destroy', true);
          if response.errors.length > 0 # add an error message if one exists
            #$.each response.errors, (index, error) -> console.log "#{target.name}: #{error}"
            $target.parent().addClass 'error'
            new_error = $ HandlebarsTemplates['articles/remote_validation_error']
              error: response.errors[0]
            $target.after new_error
            document.Fairmondo.setQTipError new_error
