# NOTE: customConfig param is required to override config which is done by CKEditor gem, this issue is solved
#       in CKEditor gem from version 4.0, so as soon as it gets upgraded, all customconfigs can be removed

module CkeditorHelper
  def lite_ckeditor_params
    {
      width: '320px',
      height: '150px',
      toolbar: 'Lite',
      customConfig: '/javascripts/ckeditor/config.js'
    }
  end

  def email_signature_ckeditor_params
    {
      toolbar: 'EmailSignature',
      customConfig: '/javascripts/ckeditor/config.js'
    }
  end

  def email_popup_multi_ckeditor_params
    {
      toolbar: 'EmailPopupMulti',
      customConfig: '/javascripts/ckeditor/config.js'
    }
  end

  def email_popup_ckeditor_params
    {
      toolbar: 'EmailPopup',
      customConfig: '/javascripts/ckeditor/config.js'
    }
  end

  def email_ckeditor_params
    {
      toolbar: 'Email',
      customConfig: '/javascripts/ckeditor/config.js'
    }
  end
end
