
if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_authentication_app", domain: "book-transaction-app.web.app"
  else
    Rails.application.config.session_store :cookie_store, key: "_authentication_app"
  end