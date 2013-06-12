xml.instruct! :xml, :version => "1.0"
if current_user and current_user.softphone_server
  xml.flashphoner do
    xml.rtmp_server "rtmfp://#{current_user.softphone_server.server_host}:#{current_user.softphone_server.server_port}"
    xml.register_required true
    xml.application "phone_app"
    xml.video_width 176
    xml.video_height 144
    xml.check_validation_callee true
    xml.use_enhanced_mic true
    xml.ring_sound
    xml.busy_sound
    xml.register_sound
    xml.finish_sound
  end
else
  xml.root :registered => "False"
end
