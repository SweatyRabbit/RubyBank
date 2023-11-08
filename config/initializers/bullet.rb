# frozen_string_literal: true

if Rails.env.in?(%w[test development])
  Rails.application.config.after_initialize do
    Bullet.enable        = true
    Bullet.alert         = true
    Bullet.rails_logger  = true
  end
end
