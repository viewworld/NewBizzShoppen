Backup::Model.new(:fairleads_db_backup, 'Fairleads db backup') do
  split_into_chunks_of 250

  database PostgreSQL do |db|
    db.name               = "nbs_production"
    db.username           = "rails"
    db.password           = "secret"
  end

  compress_with Gzip

  store_with SFTP do |server|
    server.username   = "u63403"
    server.password   = "R8wy0eeoIe8dKmp4"
    server.ip         = "u63403.your-backup.de"
    server.port       = 22
    server.path       = "~/backups/"
    server.keep       = 5
  end

  notify_by Mail do |mail|
    mail.on_success           = true

    mail.from                 = "selleo.test@gmail.com"
    mail.to                   = "aossowski@gmail.com"
    mail.address              = "smtp.gmail.com"
    mail.port                 = 587
    mail.user_name            = "selleo.test@gmail.com"
    mail.password             = "secret4gmail"
    mail.authentication       = "plain"
    mail.enable_starttls_auto = true
  end

end

Backup::Model.new(:fairleads_assets_backup, 'Fairleads assets backup') do
  split_into_chunks_of 250

  archive :public_system do |archive|
    archive.add '/srv/nbs/production/shared/system'
  end

  compress_with Gzip

  store_with SFTP do |server|
    server.username   = "u63403"
    server.password   = "R8wy0eeoIe8dKmp4"
    server.ip         = "u63403.your-backup.de"
    server.port       = 22
    server.path       = "~/backups/"
    server.keep       = 5
  end

  notify_by Mail do |mail|
    mail.on_success           = true

    mail.from                 = "selleo.test@gmail.com"
    mail.to                   = "aossowski@gmail.com"
    mail.address              = "smtp.gmail.com"
    mail.port                 = 587
    mail.user_name            = "selleo.test@gmail.com"
    mail.password             = "secret4gmail"
    mail.authentication       = "plain"
    mail.enable_starttls_auto = true
  end

end